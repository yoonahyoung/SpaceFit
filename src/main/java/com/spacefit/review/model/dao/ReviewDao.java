package com.spacefit.review.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.mem.model.vo.Report;
import com.spacefit.review.model.vo.Review;

/**
 * @author USER
 *
 */
public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 리뷰등록시 해당 공간번호 조회
	 * @param conn
	 * @param spaceName 공간명
	 * @return 공간번호
	 */
	public int selectSpaceNo(Connection conn, String spaceName) {
		// select => ResultSet(한행) 
		int spaceNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSpaceNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				spaceNo = rset.getInt("space_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return spaceNo;
	}
	
	/** 후기등록시 1. TB_REVIEW INSERT
	 * @param conn
	 * @param insert할 Reivew 정보
	 * @return
	 */
	public int insertReview(Connection conn, Review rv) {
		// Review에 insert => 처리된행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rv.getBookNo());
			pstmt.setString(2, rv.getSpaceNo());
			pstmt.setString(3, rv.getMemNo());
			pstmt.setString(4, rv.getReviewContent());
			pstmt.setInt(5, rv.getReviewStar());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/** 후기등록시 2. TB_ATTACHEMENT에 사진insert
	 * @param conn
	 * @param list attachment:입력한 사진, 최대 3장
	 * @return
	 */
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		// list안의 Attachment객체 갯수만큼 반복적으로 insert!!
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		try {
			for(Attachment at: list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getFileOriginName());
				pstmt.setString(2, at.getFileChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/** 후기등록시 3. 해당 예약번호에 해당 회원이 등록한 유효한 리뷰가 있는지
	 * @param conn
	 * @param rv
	 * @return
	 */
	public String selectReviewValid(Connection conn, Review rv) {
		// select => ResultSet(한행) => String
		String reviewValid = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewValid");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rv.getBookNo());
			pstmt.setString(2, rv.getMemNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				reviewValid = rset.getString("review_valid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewValid;	
		
	}
	
	/** 후기내역조회용
	 * @param conn
	 * @param memNo 회원번호
	 * @return 회원의 후기들
	 */
	public ArrayList<Review> selectReviewList(Connection conn, int memNo, PageInfo pi){
		// select => ResultSet => ArrayList<Review>
		ArrayList<Review> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;			
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("rv_no"),
									 rset.getString("space_name"),
									 rset.getString("rv_content"),
									 rset.getInt("rv_star"),
									 rset.getString("book_date"),
									 rset.getString("REVIEW_MAINIMG"))					 
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;				
	}
	
	/** 특정 후기의 정보조회1. tb_review
	 * @param conn
	 * @param reviewNo 후기번호
	 * @return
	 */
	public Review selectReview(Connection conn, int reviewNo) {
		// select > ResultSet > Review
		Review rv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rv = new Review( rset.getInt("rv_no"),
								 rset.getInt("book_no"),
								 rset.getString("space_no"),
								 rset.getString("mem_no"),
								 rset.getString("rv_content"),
								 rset.getInt("rv_star") 
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rv;
	}
	
	/** 특정 후기 정보조회 2. tb_attachment
	 * @param conn
	 * @param reviewNo
	 * @return
	 */
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int reviewNo) {
		// select => ResultSet(한행) => ArrayList<Attachment>
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment( rset.getInt("file_no"),
										 rset.getString("file_origin_name"),
										 rset.getString("file_change_name"),
										 rset.getString("file_path"),
										 rset.getInt("file_level")						
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	/** 후기수정1
	 * @param conn
	 * @param rv
	 * @return
	 */
	public int updateReview(Connection conn, Review rv) {
		// update => int처리된행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rv.getReviewContent());
			pstmt.setInt(2, rv.getReviewStar());
			pstmt.setInt(3, rv.getReviewNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
								
	}
	
	/** 후기수정2
	 * @param conn
	 * @param list 거기서 참조글번호 추출
	 * @return
	 */
	public int deleteReview(Connection conn, ArrayList<Attachment> list) {
		// UPDATE => int
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, list.get(0).getRefBoardNo()); // 참조후기글번호는 list의at모두 같을것
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;	
		
	}
	
	/** 후기수정3
	 * @param conn
	 * @param list 새로운 첨부파일 업로드
	 * @return
	 */
	public int insertAttachmentList2(Connection conn, ArrayList<Attachment> list) {
		// insert => int
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList2");
		try {
			for(Attachment at:list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, at.getRefBoardNo());
				pstmt.setString(2, at.getFileOriginName());
				pstmt.setString(3, at.getFileChangeName());
				pstmt.setString(4, at.getFilePath());
				pstmt.setInt(5, at.getFileLevel());
				
				result = pstmt.executeUpdate();
				
								
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/** 후기삭제시 해당 첨부파일 삭제
	 * @param conn
	 * @param reviewNo 삭제할 후기번호 => ref_board
	 * @return 처리결과
	 */
	public int deleteAttachment(Connection conn, int reviewNo) {
		// update => int
		int result = 0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("deleteAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;				
	}
	
	/** 후시삭제
	 * @param conn
	 * @param reviewNo 삭제할 후기번호
	 * @return
	 */
	public int deleteReivewReal(Connection conn, int reviewNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReivewReal");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	/** 페이징처리 => listCount
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn, int memNo) {
		// select문 => ResultSet => int
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	}
	
	
	
	
	
	
	// 이 부분부터 admin 리뷰 부분 소희작성
	
	/** admin-리뷰리스트 전체조회
	 * @param conn
	 * @param 
	 * @return
	 */
	public ArrayList<Review> adminReviewSelect(Connection conn) {
		// select => ResultSet(한행) => ArrayList<Attachment>
		ArrayList<Review> rvList = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminReviewSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rvList.add(new Review( rset.getInt("rv_no"),
									   rset.getString("mem_id"),
									   rset.getString("space_name"),
									   rset.getInt("rv_star"),
									   rset.getString("book_date"),
									   rset.getInt("all_like_count"),
									   rset.getInt("all_rpt_count"),
									   rset.getString("rv_status"),
									   rset.getDate("rv_enroll_date")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rvList;
	}
	
	
	public Review adminSelectEachReview(Connection conn, int reviewNo) {
		
		Review rv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectEachReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review(
								rset.getInt("rv_no"),
								rset.getInt("book_no"),
								rset.getString("space_name"),
								rset.getString("mem_id"),
								rset.getInt("rv_star"),
								rset.getString("rv_content"),
								rset.getDate("rv_enroll_date"),
								rset.getDate("rv_modify_date"),
								rset.getString("book_date"),
								rset.getInt("gr_no"),
								rset.getInt("all_like_count"),
								rset.getInt("all_rpt_count"),
								rset.getString("rv_status")
								// rset.getString("space_no")
						);
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return rv;
		
	}
	
	
	
	
	
	
	
	// 이 부분부터 공간별 후기리스트 관련 메소드 소희작성
	
	/**
	 * @param conn
	 * @param 공간조회 디테일 페이지에서 후기리스트 전체조회용 메소드 1
	 * @return
	 */
	public ArrayList<Review> selectRvListForSpace(Connection conn, int spNo){
		
		ArrayList<Review> rvList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRvListForSpace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				rvList.add(new Review(
							rset.getInt("rv_no"),
							rset.getInt("book_no"),
							rset.getString("space_name"), // == SPACE NAME 으로 하기!
							rset.getString("mem_id"),
							rset.getString("rv_content"),
							rset.getDate("rv_enroll_date"),
							rset.getDate("rv_modify_date"),
							rset.getInt("rv_star"),
							rset.getString("rv_status"),
							rset.getString("gr_name"),
							rset.getInt("all_like_count"),
							rset.getString("mem_no")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return rvList;
		
	}
	
	public int todayRvCount(Connection conn) {
		int todayRvCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("todayRvCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayRvCount = rset.getInt("todayRvCount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return todayRvCount;
		
		
	}
	
	/**
	 * @param conn
	 * @param 전체 공간에 대한 전체 별점 평균 (소수점 1자리에서 올림처리)
	 * @return
	 */
	public float avgRoundOne(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("avgRoundOne");
		float avgRoundOne = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				avgRoundOne = rset.getFloat("avgRoundOne");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return avgRoundOne;
		
	}
	
	
	
	/**
	 * @param conn
	 * @param 해당 공간에 대한 전체 별점 평균 (소수점 올림처리)
	 * @return
	 */
	public int selectAvgStars(Connection conn, int spNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("avgStars");
		int avgStars = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				avgStars = rset.getInt("avg_star");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} return avgStars;
		
	}
	
	
	public int reportReview(Connection conn, Report rpt) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportReview");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rpt.getMemNo());
			pstmt.setInt(2, rpt.getRptMemNo());
			pstmt.setInt(3, rpt.getRptReasonNo());
			pstmt.setInt(4, rpt.getRptRefNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int selectRvExist(Connection conn, Report rpt) {
		// select => ResultSet(int)
		int reportRvExist =0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectRvExist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rpt.getMemNo());
			pstmt.setInt(2, rpt.getRptRefNo());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reportRvExist = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return reportRvExist;
	}
	
}

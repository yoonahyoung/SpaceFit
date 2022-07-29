package com.spacefit.review.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.review.model.vo.Review;

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
	public ArrayList<Review> selectReviewList(Connection conn, int memNo){
		// select => ResultSet => ArrayList<Review>
		ArrayList<Review> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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
}

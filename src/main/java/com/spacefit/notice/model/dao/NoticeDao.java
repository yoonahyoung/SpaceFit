package com.spacefit.notice.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.notice.model.vo.FAQ;
import com.spacefit.notice.model.vo.Notice;
import com.spacefit.notice.model.vo.Terms;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream( NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> selectNoticeList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NT_NO"),
									rset.getString("NT_CATEGORY"),
									rset.getString("NT_TITLE"),
									rset.getString("MEM_ID"),
									rset.getInt("NT_COUNT"),
									rset.getDate("NT_CREATE_DATE")
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
	
	public int insertNotice(Connection conn, Notice n) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeCategory());
			pstmt.setString(2, n.getNoticeTitle());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getNoticeWriter()); 
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int increaseCount(Connection conn, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		// select문 => ResultSet (한행) => Notice
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("NT_NO"),
						       rset.getString("NT_CATEGORY"),
								rset.getString("NT_TITLE"),
								rset.getString("NT_CONTENT"),
								rset.getString("MEM_ID"),
								rset.getInt("NT_COUNT"),
								rset.getDate("NT_CREATE_DATE")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  n.getNoticeTitle());
			pstmt.setString(2,  n.getNoticeContent());
			pstmt.setString(3,  n.getNoticeCategory());
			pstmt.setInt(4,  n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectListCount(Connection conn) {
		// select문 => ResultSet(숫자한개) => int
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	// FAQ
	public ArrayList<FAQ> selectFAQList(Connection conn, PageInfo pi){
		ArrayList<FAQ> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new FAQ(rset.getInt("faq_no"),
								 rset.getString("faq_title"),
								 rset.getString("faq_content"),
								 rset.getString("mem_name"),
								 rset.getString("faq_create_date"),
								 rset.getString("faq_update_date"),
								 rset.getString("faq_status")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<FAQ> selectFAQUserList(Connection conn){
		ArrayList<FAQ> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectFAQUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				FAQ f = new FAQ();
				f.setFaqNo(rset.getInt("faq_no"));
				f.setFaqTitle(rset.getString("faq_title"));
				f.setFaqContent(rset.getString("faq_content"));
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// -------------------- admin ---------------------- //
	
	// 이용약관 목록 조회
	public ArrayList<Terms> adminTermsList(Connection conn){
		
		ArrayList<Terms> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminTermsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Terms(rset.getInt("terms_no"),
								   rset.getString("terms_title"),
								   rset.getString("terms_content"),
								   rset.getString("terms_status"),
								   rset.getString("terms_page"),
								   rset.getString("terms_note"),
								   rset.getDate("terms_enroll_date"),
								   rset.getDate("terms_modify_date")
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
	
	// 이용약관 등록
	public int adminInsertTerms(Connection conn, Terms t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getTermsStatus());
			pstmt.setString(4, t.getTermsPage());
			pstmt.setString(5, t.getTermsNote());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 이용약관 상세페이지
	public Terms adminSelectTerms(Connection conn, int termsNo){
		
		Terms t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termsNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Terms(rset.getInt("terms_no"),
							   rset.getString("terms_title"),
							   rset.getString("terms_content"),
							   rset.getString("terms_status"),
							   rset.getString("terms_page"),
							   rset.getString("terms_note"),
							   rset.getDate("terms_enroll_date"),
							   rset.getDate("terms_modify_date")
							);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
		
	}
	
	// 이용약관 수정
	public int adminUpdateTerms(Connection conn, Terms t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdateTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t.getTermsTitle());
			pstmt.setString(2, t.getTermsContent());
			pstmt.setString(3, t.getTermsStatus());
			pstmt.setString(4, t.getTermsPage());
			pstmt.setString(5, t.getTermsNote());
			pstmt.setInt(6, t.getTermsNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminDeleteTerms(Connection conn, int termsNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminDeleteTerms");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, termsNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public FAQ adminDetailFAQ(Connection conn, int faNo) {
		FAQ f = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminDetailFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new FAQ(rset.getInt("faq_no"),
							rset.getString("faq_title"),
							rset.getString("faq_content"),
							rset.getString("mem_name"),
							rset.getString("faq_create_date"),
							rset.getString("faq_update_date"),
							rset.getString("faq_status")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}
	
	public int adminInsertFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setInt(3, f.getMemNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int adminUpdateFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdateFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			pstmt.setInt(3, f.getMemNo());
			pstmt.setString(4, f.getFaqStatus());
			pstmt.setInt(5, f.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/*
	public ArrayList<Terms> selectTerm(Connection conn) {
		ArrayList<Terms> tList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTerm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return tList;
	}*/
	
}

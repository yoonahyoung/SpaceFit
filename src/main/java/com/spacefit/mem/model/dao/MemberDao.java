package com.spacefit.mem.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.spacefit.mem.model.vo.Member;

import static com.spacefit.common.JDBCTemplate.*;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		// member-mapper.xml 읽기 (classes 폴더 안에 있는 파일)
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member loginMember(Connection conn, String memId, String memPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getInt("mem_no"),
						rset.getInt("gr_no"),
						rset.getString("mem_id"),
						rset.getString("mem_pwd"),
						rset.getString("mem_name"),
						rset.getString("mem_idno"),
						rset.getString("mem_phone"),
						rset.getString("mem_mail"),
						rset.getString("mem_profile"),
						rset.getDate("mem_enroll_date"),
						rset.getDate("mem_modify_date"),
						rset.getString("mem_status"),
						rset.getString("mem_adm_flag")
						);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return m;
	}
	
	
	public int idCheck(Connection conn, String memId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		// System.out.println(count);
		return count;
	}
	
	
	public int insertMember(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemIdNo());
			pstmt.setString(5, m.getMemPhone());
			pstmt.setString(6, m.getMemMail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Member idSearch(Connection conn, Member m) {
		
		String memId = "";
		Member searchM = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemPhone());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				memId = rset.getString("mem_id");
				searchM.setMemId(memId);
				searchM.setMemName(m.getMemName());
				searchM.setMemPhone(m.getMemPhone());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return searchM;
		
	}
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemMail());
			pstmt.setString(3, m.getMemPhone());
			pstmt.setString(4, m.getMemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println(result);
		return result;
	}
	
	public Member selectMember(Connection conn, String memId) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
							   rset.getInt("gr_no"),
							   rset.getString("mem_id"),
							   rset.getString("mem_pwd"),
							   rset.getString("mem_name"),
							   rset.getString("mem_idno"),
							   rset.getString("mem_phone"),
							   rset.getString("mem_mail"),
							   rset.getString("mem_profile"),
							   rset.getDate("mem_enroll_date"),
							   rset.getDate("mem_modify_date"),
							   rset.getString("mem_status"),
							   rset.getString("mem_adm_flag")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}

}

















package com.spacefit.mem.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.mem.model.vo.Member;

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
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return m;
		
	}
	
	//---------ADMIN-----------//
	
	public int allMemberCount(Connection conn) {
		
		int allMemberCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("allMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				allMemberCount = rset.getInt("MEM_ALL_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return allMemberCount;
		
	}
	
	public ArrayList<Member> adminMemberManageDetailListSelect(Connection conn, int allMemberCount){
		
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminMemberManageDetailListSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=1; i<allMemberCount; i++) {
				pstmt.setInt(1, i);
				pstmt.setInt(2, i);
				pstmt.setInt(3, i);
				pstmt.setInt(4, i);
				pstmt.setInt(5, i);
				pstmt.setInt(6, i);
				pstmt.setInt(7, i);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					list.add(new Member(
								rset.getInt("mem_no"),
								rset.getString("mem_id"),
								rset.getString("mem_name"),
								rset.getString("mem_idno"),
								rset.getString("mem_phone"),
								rset.getString("mem_mail"),
								rset.getString("gr_name"),
								rset.getInt("book_count_all"),
								rset.getInt("book_count_month"),
								rset.getInt("book_amount_all"),
								rset.getInt("book_amount_month"),
								rset.getInt("rpt_count"),
								rset.getInt("like_count"),
								rset.getString("mem_status"),
								rset.getString("mem_adm_flag"),
								rset.getDate("mem_enroll_date"),
								rset.getDate("mem_modify_date")
							));
				}
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

















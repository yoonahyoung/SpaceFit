package com.spacefit.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.spacefit.common.JDBCTemplate.close;

import com.spacefit.event.model.vo.Banner;
import com.spacefit.mem.model.vo.Member;

public class EventDao {

	private Properties prop = new Properties();
	
	public EventDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(EventDao.class.getResource("/db/sql/event-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 사용자_배너 조회
	public ArrayList<Banner> selectBannerList(Connection conn){
		
		ArrayList<Banner> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBannerList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("ban_no"),
									rset.getString("ban_name"),
									rset.getString("ban_status"),
									rset.getDate("ban_enroll_date"),
									rset.getDate("ban_modify_date"),
									rset.getString("ban_url"),
									rset.getString("ban_img")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// ---------- admin ----------- // 
	
	// 관리자_배너 등록
	public int adminInsertBanner(Connection conn, Banner b) {
	      
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("adminInsertBanner");
	      int result = 0;
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, b.getBanName());
	         pstmt.setString(2, b.getBanStatus());
	         pstmt.setString(3, b.getBanURL());
	         pstmt.setString(4, b.getBanImg());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      return result;
	      
	   }
	   
	
	
	
}

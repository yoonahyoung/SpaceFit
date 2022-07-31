package com.spacefit.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.spacefit.common.JDBCTemplate.*;

public class LikeDao {
	
	private Properties prop = new Properties();
	
	public LikeDao() {
		try {
			prop.loadFromXML(new FileInputStream(LikeDao.class.getResource("/db/sql/like-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int checkLikeOnce(Connection conn, int memNo, int rvNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkLikeOnce");
		int idCheckCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, rvNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				idCheckCount = rset.getInt("id_check");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return idCheckCount;
	} 
	
	public int updateLike(Connection conn, int memNo, int likeNo) {
		int updateLike = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, likeNo);
			updateLike = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateLike;
	}
}

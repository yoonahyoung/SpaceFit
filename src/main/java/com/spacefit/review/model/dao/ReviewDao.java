package com.spacefit.review.model.dao;

import java.io.FileInputStream;
import static com.spacefit.common.JDBCTemplate.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
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
}

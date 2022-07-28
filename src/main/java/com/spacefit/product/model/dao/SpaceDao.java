package com.spacefit.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.spacefit.common.JDBCTemplate.*;
import com.spacefit.mem.model.dao.MemberDao;
import com.spacefit.product.model.vo.Space;

public class SpaceDao {
	
	private Properties prop = new Properties();
	
	public SpaceDao() {
		String filePath = MemberDao.class.getResource("/db/sql/space-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Space> selectList(Connection conn) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Space(rset.getInt("space_no"),
								   rset.getString("space_name"),
								   rset.getInt("space_limit"),
								   rset.getString("space_category"),
								   rset.getString("space_pic"),
								   rset.getInt("space_price")
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

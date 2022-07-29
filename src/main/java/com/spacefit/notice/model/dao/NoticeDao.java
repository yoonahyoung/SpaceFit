package com.spacefit.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.notice.model.vo.Notice;

import static com.spacefit.common.JDBCTemplate.*;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream( NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> selectNoticeList(Connection conn){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
//			System.out.println("dao"+list);
		}
		
		return list;
	}
	
}

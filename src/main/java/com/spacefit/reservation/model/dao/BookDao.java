package com.spacefit.reservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.spacefit.common.JDBCTemplate.*;

import com.spacefit.reservation.model.vo.Book;

public class BookDao {
	
	private Properties prop = new Properties();
	
	public BookDao() {
		 try {
			prop.loadFromXML(new FileInputStream(BookDao.class.getResource("/db/sql/book-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Book> selectBookList(Connection conn, String booktype, String bookOrderBy, int memNo){
		// select > ResultSet(여러행) > ArrayList<Book>
		ArrayList<Book> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBookList");
		sql += booktype;
		sql += bookOrderBy;
		
		//System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo); 			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Book(rset.getInt("book_no"),
								  rset.getString("space_name"),
								  rset.getString("book_date"),
								  rset.getString("book_in"),
								  rset.getString("book_out"),
								  rset.getInt("book_price"),
								  rset.getString("book_category"),
								  rset.getString("space_pic")
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

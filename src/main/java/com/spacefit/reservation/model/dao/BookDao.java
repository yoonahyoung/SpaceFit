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
	
	/** 사용자페이지 myPage 예약내역조회용
	 * @param conn : connection객체
	 * @param booktype : 예약현황
	 * @param bookOrderBy : 정렬기준
	 * @param memNo : 로그인한 회원번호
	 * @return 해당 회원의 예약정보
	 */
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
	
	/** 예약상세페이지
	 * @param conn
	 * @param bookNo : 해당 예약번호
	 * @return book객체
	 */
	public Book selectBook(Connection conn, int bookNo) {
		// select ResultSet(한행) Book
		Book b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Book(
							rset.getInt("book_no"),
							rset.getString("space_name"),
							rset.getString("mem_id"),
							rset.getInt("book_count"),							
							rset.getString("book_date"),
							rset.getString("book_in"),
							rset.getString("book_out"),
							rset.getInt("book_price"),
							rset.getString("book_name"),
							rset.getString("book_phone"),
							rset.getString("book_email"),
							rset.getString("book_purpose"),
							rset.getString("book_add_content"),
							rset.getString("book_car"),
							rset.getString("book_animal"),
							rset.getString("book_chair"),
							rset.getString("book_stand"),
							rset.getDate("book_create_date"),
							rset.getString("book_category"),
							rset.getString("book_cancel_reason"),
							rset.getString("book_cansel_content"),
							rset.getString("pl_amount"),
							rset.getInt("BOOK_D_DAY")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
		
	}
	
}

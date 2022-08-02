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
							rset.getInt("BOOK_D_DAY"),
							rset.getInt("space_limit")
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
	
	/** 예약수정
	 * @param conn
	 * @param b 사용자가 수정가는한 항목들
	 * @return 처리된행수
	 */
	public int updateBook(Connection conn, Book b) {
		// update => 처리된행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBookCount());
			pstmt.setString(2, b.getBookName());
			pstmt.setString(3, b.getBookPhone());
			pstmt.setString(4, b.getBookEmail());
			pstmt.setString(5, b.getBookPurpose());
			pstmt.setString(6, b.getBookAddContent());
			pstmt.setString(7, b.getBookCar());
			pstmt.setString(8, b.getBookAnimal());
			pstmt.setString(9, b.getBookChair());
			pstmt.setString(10, b.getBookStand());
			pstmt.setInt(11, b.getBookNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/** 예약삭제용
	 * @param conn
	 * @param b : 삭제시 입력받은 삭제이유, 상세이유, 예약번호
	 * @return 처리된행수
	 */
	public int deleteBook(Connection conn, Book b) {
		// update => 처리된행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBookCancleReason());
			pstmt.setString(2, b.getBookCancelContent());
			pstmt.setInt(3, b.getBookNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;		
	}
	
	/*
	 * 관리자용
	 */
		
	/** 관리자 예약리스트 (정렬 + 검색)
	 * @param conn
	 * @param search 검색
	 * @param booktype 이용완료 | 예약취소 | 예약확정
	 * @param bookOrderBy 예약번호순 | 대여날짜순
	 * @return
	 */
	public ArrayList<Book> searchSelectBook(Connection conn, String search, String booktype, String bookOrderBy){
		// select문 => ResultSet => ArrayList<Book>
		ArrayList<Book> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminSelectBookList");
		sql += booktype; // 이용완료/예약취소/예약확정
		sql += search;   // 검색
		sql += bookOrderBy; // 정렬
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				 list.add(new Book(rset.getInt("book_no"),
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
								   rset.getString("book_car"),
								   rset.getString("book_animal"),
								   rset.getString("book_chair"),
								   rset.getString("book_stand")								
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
	
	public int selectMonthCount(Connection conn) {
		// select => ResultSet(int)
		int thisMonth = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMonthCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				thisMonth = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return thisMonth;
		
	}
	
	public int selectTodayCount(Connection conn) {
		// select => ResultSet(int)
		int todayCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTodayCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayCount = rset.getInt("TODAY_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return todayCount;	
		
	}
	
	public ArrayList<Book> selectMonthlyCount(Connection conn){
		// select => ResultSet => ArrayList<Book>
		ArrayList<Book> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMonthlyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()){
				list.add(new Book(rset.getInt("count"),
								  rset.getString("MONTH")		
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

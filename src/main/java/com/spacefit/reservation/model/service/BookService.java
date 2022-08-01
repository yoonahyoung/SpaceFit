package com.spacefit.reservation.model.service;

import static com.spacefit.common.JDBCTemplate.*;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.reservation.model.dao.BookDao;
import com.spacefit.reservation.model.vo.Book;


public class BookService {
	
	// 사용자페이지 myPage 예약내역조회용 
	public ArrayList<Book> selectBookList(String booktype, String bookOrderBy, int memNo){
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().selectBookList(conn, booktype, bookOrderBy, memNo);		
		close(conn);
		return list;
	}
	
	// 예약상세페이지용
	public Book selectBook(int bookNo) {
		Connection conn = getConnection();
		Book b = new BookDao().selectBook(conn, bookNo);
		close(conn);		
		return b;
	}
	
	// 예약수정용
	public int updateBook(Book b) {
		Connection conn = getConnection();
		int result = new BookDao().updateBook(conn, b);
		
		if(result>0) {
			commit(conn);
		}else {
			 rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 예약취소용
	public int deleteBook(Book b) {
		Connection conn = getConnection();
		int result = new BookDao().deleteBook(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/*
	 * 관리자용
	 */
	
	// 예약내역 리스트 -- 임시 지워질지모름
	/*
	public ArrayList<Book> adminSelectBookList(String category){
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().adminSelectBookList(conn, category);
		close(conn);
		return list;
	}
	*/
	// 예약내역리스트
	public ArrayList<Book> searchSelectBook(String search, String booktype, String bookOrderBy){
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().searchSelectBook(conn, search, booktype, bookOrderBy);
		close(conn);
		return list;
	}
	
}

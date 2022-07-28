package com.spacefit.reservation.model.service;

import static com.spacefit.common.JDBCTemplate.*;

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
	
	// 사용자페이지 예약상세페이지용
	public Book selectBook(int bookNo) {
		Connection conn = getConnection();
		Book b = new BookDao().selectBook(conn, bookNo);
		close(conn);
		return b;
	}
	
}
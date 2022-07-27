package com.spacefit.reservation.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.reservation.model.dao.BookDao;
import com.spacefit.reservation.model.vo.Book;

public class BookService {
	
	public ArrayList<Book> selectBookList(String booktype, String bookOrderBy, int memNo){
		Connection conn = getConnection();
		ArrayList<Book> list = new BookDao().selectBookList(conn, booktype, bookOrderBy, memNo);		
		close(conn);
		return list;
	}
}

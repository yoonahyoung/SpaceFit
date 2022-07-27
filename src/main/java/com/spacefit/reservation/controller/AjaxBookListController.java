package com.spacefit.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;

/**
 * Servlet implementation class AjaxBookListController
 */
@WebServlet("/blist.bo")
public class AjaxBookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBookListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String booktype = "";
		
		switch(request.getParameter("booktype")) {
		case "전체": break;
		case "예약확정": booktype = "AND BOOK_CATEGORY = '예약확정'"; break;
		case "이용완료" : booktype = "AND BOOK_CATEGORY = '이용완료'"; break;
		case "예약취소" : booktype = "AND BOOK_CATEGORY = '예약취소'"; break;		
		}
		
		String bookOrderBy = "";
		
		switch(request.getParameter("bookOrderBy")) {
		case "book_date": bookOrderBy = "ORDER BY BOOK_DATE DESC"; break;
		case "book_no" : bookOrderBy = "ORDER BY BOOK_NO DESC"; break;
		}
		
		// 로그인객체 만들어지면 풀기!!
		//int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int memNo = 3;
		ArrayList<Book> list = new BookService().selectBookList(booktype, bookOrderBy, memNo);
		//System.out.println(list);		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
		 
		 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

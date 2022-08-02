package com.spacefit.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;

/** MyPage에서 예약조회클릭시 예약내역페이지요청
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
		 
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
				
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
		
		//System.out.println(memNo);
		
				
		//System.out.println(list);	
		
		// ajax 페이징처리 
		int listCount = new BookService().selectBookListCount(booktype, memNo);
		int currentPage = Integer.parseInt( request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 4;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Book> list = new BookService().selectBookList(booktype, bookOrderBy, memNo, pi);
		
		//System.out.println(pi);
		//System.out.println(list);
		
		/* 이건 문자열로 여며지므로 안됨 => 하려면 하나하나 담아야함
		JSONObject jObj = new JSONObject();
		jObj.put("list", list);
		jObj.put("pi", pi);		
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
		*/
		
				
		HashMap<String, Object> hm = new HashMap<> ();
		hm.put("list", list);
		hm.put("pi", pi);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(hm, response.getWriter());
		
		
		/*
		ArrayList result = new ArrayList<>();
		result.add(list);
		result.add(pi);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		*/
		
		 
		 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

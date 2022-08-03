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
import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;

/**
 * Servlet implementation class AjaxAdminBookListController
 */
@WebServlet("/ablist.bo")
public class AjaxAdminBookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminBookListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		String booktype = "";				
		switch(request.getParameter("booktype")) {
		case "전체": booktype = "WHERE BOOK_NO IS NOT NULL"; break;
		case "예약확정": booktype = " WHERE BOOK_CATEGORY = '예약확정'"; break;
		case "이용완료" : booktype = " WHERE BOOK_CATEGORY = '이용완료'"; break;
		case "예약취소" : booktype = " WHERE BOOK_CATEGORY = '예약취소'"; break;		
		}
		
		String bookOrderBy = "";
		
		switch(request.getParameter("bookOrderBy")) {
		case "book_date": bookOrderBy = " ORDER BY BOOK_DATE DESC"; break;
		case "book_no" : bookOrderBy = " ORDER BY BOOK_NO DESC"; break;
		}
		
		String search = "";
		
		String searchText = request.getParameter("searchText");
		
		// 검색이 없을 경우제외
		if(searchText != null && !searchText.equals("")) {
			
			switch(request.getParameter("searchType")) {
			case "spaceNo": search += " AND SPACE_NAME LIKE '%"+ searchText + "%'"; break;
			case "userID" : search += " AND MEM_ID LIKE '%"+ searchText + "%'"; break;
			case "userName" : search += " AND BOOK_NAME LIKE '%"+ searchText + "%'"; break;
			
			} 
			
		}				
			
		//System.out.println(search + booktype + bookOrderBy);
		
		// ajax 페이징처리
		int listCount = new BookService().selectAdminBookListCount(booktype, search);
		int currentPage = Integer.parseInt( request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 15;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Book> list = new BookService().searchSelectBook(search,booktype, bookOrderBy, pi);
		
		//System.out.println(list);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(hm, response.getWriter());
		
			
			
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

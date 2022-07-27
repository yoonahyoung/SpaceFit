package com.spacefit.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;

/** 예약상세페이지요청용
 * Servlet implementation class BookDetailController
 */
@WebServlet("/bdetail.bo")
public class BookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookNo = Integer.parseInt(request.getParameter("no"));
		
		Book b = new BookService().selectBook(bookNo);
		
		if(b == null) {			
			request.getSession().setAttribute("alertMsg", "상세보기에 실패했습니다.");
			response.sendRedirect(request.getContextPath()); // 메인페이지로 돌아가게끔
		}else {
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/user/myPage/reservationDetailView.jsp").forward(request, response);
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.vo.Member;
import com.spacefit.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewInsertForm
 */
@WebServlet("/rInsertForm.re")
public class ReviewInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookNo = Integer.parseInt(request.getParameter("bno")); // 예약번호
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo(); // 회원번호
		
		String spaceName = request.getParameter("sName"); // book에서 select해올때부터 spaceNo에 공간명을 담았었음
		
		int spaceNo = new ReviewService().selectSpaceNo(spaceName);
		
		request.setAttribute("bookNo", bookNo);
		request.setAttribute("memNo", memNo);
		request.setAttribute("spaceNo", spaceNo);
		
		
		
		request.getRequestDispatcher("views/user/review/enrollReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

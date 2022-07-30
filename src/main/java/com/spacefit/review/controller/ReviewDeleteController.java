package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/rdelete.vo")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reviewNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new ReviewService().deleteReview(reviewNo);
		
		
		if(result > 0 ) { // 성공							
			request.getSession().setAttribute("alertMsg", "후기삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/rlist.rv");	
						
		}else { // 실패
			request.setAttribute("errorMsg", "후기삭제에 실패했습니다.");
			request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp").forward(request, response);
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

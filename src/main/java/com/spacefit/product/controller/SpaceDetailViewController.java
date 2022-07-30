package com.spacefit.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;
import com.spacefit.review.model.service.ReviewService;
import com.spacefit.review.model.vo.Review;

/**
 * Servlet implementation class SpaceDetailViewController
 */
@WebServlet("/detail.sp")
public class SpaceDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int spNo = Integer.parseInt(request.getParameter("no"));
		
		Space s = new SpaceService().spaceDetailView(spNo);
		
		
		// 이 부분부터 후기쪽 부분입니다. 소희작성
		
		ArrayList<Review> rvList = new ReviewService().selectRvListForSpace(spNo);
		request.setAttribute("rvList", rvList);

		
		// 후기 부분 끝!
		
		
		request.getRequestDispatcher("views/user/space/spaceDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

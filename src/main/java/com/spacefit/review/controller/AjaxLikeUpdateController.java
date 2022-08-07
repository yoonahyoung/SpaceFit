package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.review.model.service.LikeService;

/**
 * Servlet implementation class LikeUpdateController
 */
@WebServlet("/likeUpdate.lk")
public class AjaxLikeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLikeUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int rvNo = Integer.parseInt(request.getParameter("rvNo"));
		
		// 추천은 1번만 할 수 있음
		int idCheckCount = new LikeService().checkLikeOnce(memNo, rvNo);
		if(idCheckCount > 0) {
	         System.out.println("이미 추천한 후기입니다.");
	         response.getWriter().print("likeNO");
	      } else {
	         int updateLike = new LikeService().updateLike(memNo, rvNo);
	         if(updateLike == 1) {
	            int rvStar = new LikeService().getLikeCount(rvNo);
//	            response.getWriter().print("likeOk");
	            response.getWriter().print(String.valueOf(rvStar));
	         }
	      }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

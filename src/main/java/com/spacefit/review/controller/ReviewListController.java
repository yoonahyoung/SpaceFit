package com.spacefit.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.review.model.service.ReviewService;
import com.spacefit.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/rlist.rv")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ------ 페이징 처리 ------
		int listCount;   // 현재 총 게시글 갯수 (항상달라질거이므로 고정X) -- select
		int currentPage; // 사용자가 보게될 페이지 (즉, 사용자가 요청한 페이지) -- 넘어올값
		int pageLimit;   // 페이징바의 페이지 최대갯수 (몇개 단위씩) -- 내가 정하는거
		int boardLimit;  // 한페이지당 보여질 게시글 최대갯수 (몇개 단위씩) -- 내가 정하는거
		// 위의 4개를 가지고 아래 3개의 값을 구해낼거임
		int maxPage;	 // 가장 마지막 페이지 (총 페이지 수)
		int startPage;   // 페이징바의 시작수  예) 사용자가 3페이지(currentPage)본다면 1~10(pageLimit 10)일때 start는 1이고 12페이지를 골랐다면 시작수는 11 
		int endPage;	 // 페이징바의 끝수

		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		listCount = new ReviewService().selectListCount(memNo);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 5;
		
		boardLimit = 4;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<Review> list = new ReviewService().selectReviewList(memNo, pi);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	
		request.getRequestDispatcher("views/user/review/reviewListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

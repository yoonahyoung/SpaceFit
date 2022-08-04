package com.spacefit.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;
import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;
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
		
		// 공간 리스트 불러오기
		Space s = new SpaceService().spaceDetailView(spNo);
		ArrayList<Attachment> at = new SpaceService().selectAttach(spNo);
		
		request.setAttribute("s", s);
		request.setAttribute("at", at);
		
		// 찜했는지 안했는지 불러오기
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			int count = new MemberService().loveCheck(spNo, memNo);
			// count가 1이면 찜한 공간, 0이면 찜하지 않은 공간
			request.setAttribute("loveCheck", count);
		}else {
			// 비회원이 조회시 명시적인 값 제시(사용할 값은 아님)
			request.setAttribute("loveCheck", 10);
		}
		
		// 이 부분부터 후기쪽 부분입니다. 소희작성
		
		// 해당 공간넘버에 해당하는 후기리스트 불러오기
		ArrayList<Review> rvList = new ReviewService().selectRvListForSpace(spNo);
		request.setAttribute("rvList", rvList);
		
		int avgStars = new ReviewService().selectAvgStars(spNo);
		request.setAttribute("avgStars", avgStars);
		
		// 후기 부분 끝!
		
		request.setAttribute("spNo", spNo);
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

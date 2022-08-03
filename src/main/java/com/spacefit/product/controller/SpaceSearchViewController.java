package com.spacefit.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class SpaceSearchViewController
 */
@WebServlet("/search.sp")
public class SpaceSearchViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceSearchViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("keyword");
		ArrayList<Space> list = null;
		
		if(keyword == "") {
			String alertMsg = "검색어를 입력해주세요";
			session.setAttribute("alertMsg", alertMsg);
		}
		
		String search = null;
		if(keyword.contains("파티")) {
			search = "party";
		}else if(keyword.contains("스튜")) {
			search = "studio";
		}else if(keyword.contains("연습")) {
			search = "practice";
		}
		
		if(search != null) {
			// 검색결과 리스트
			list = new SpaceService().searchResultList(search);
		}else {
			// 모든 공간 리스트
			list = new SpaceService().selectList();
		}
		
		// 인기공간 리스트
		ArrayList<Space> topList = new SpaceService().selectTopList();
		

		
		request.setAttribute("search", search);
		request.setAttribute("list", list);
		request.setAttribute("topList", topList);
		request.setAttribute("keyword", keyword);
		request.getRequestDispatcher("views/user/space/spaceSearchResultView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

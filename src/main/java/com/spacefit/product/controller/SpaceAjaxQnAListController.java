package com.spacefit.product.controller;

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
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class SpaceAjaxQnAListController
 */
@WebServlet("/loadQna.sp")
public class SpaceAjaxQnAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceAjaxQnAListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int spNo = Integer.parseInt(request.getParameter("no"));
		
		// ------------------ 페이징 처리 --------------------------------------------------------
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		listCount = new SpaceService().selectListQnACount(spNo);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 3;
		boardLimit = 6;
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
	// ------------------------ 데이터 받고 넘기기 ----------------------------------------------------------------	
		
		ArrayList<QnA> Qlist = new SpaceService().selectQList(pi, spNo); // 질문
		ArrayList<QnA> Alist = new SpaceService().selectAList(pi, spNo); // 답변
		HashMap<String, Object> h = new HashMap<>();
		h.put("Qlist", Qlist);
		h.put("Alist", Alist);
		h.put("pi", pi);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(h, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

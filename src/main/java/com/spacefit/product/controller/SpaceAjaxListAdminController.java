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
import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class SpaceAjaxListAdminController
 */
@WebServlet("/ajaxList.sp")
public class SpaceAjaxListAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceAjaxListAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ------------------ 페이징 처리 --------------------------------------------------------
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		// * listCount : 현재 게시글 총갯수
		listCount = new NoticeService().selectListCount();
		// * currentPage 사용자가 보게될 페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		// * pageLimit : 페이징바의 페이지 최대 갯수 (몇개 단위)
		pageLimit = 10;
		// * boardLimit : 한 페이지당 보여질 게시글의 최대 갯수 (몇개 단위)
		boardLimit = 10;
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		// startPage가 11이면 endPage는 20으로 됨 (근데 maxPage가 고작 13까지 밖에 안되면?)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// * 페이징바를 만들 때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
	// ------------------------ 데이터 받고 넘기기 ----------------------------------------------------------------	
		// ajax로 넘어온 옵션카테고리 처리해주기
		String selectSp = request.getParameter("selectSp");
		
		switch(selectSp) {
		case"*": selectSp = ""; break;
		case"studio": selectSp = "AND SPACE_CATEGORY = 'studio'"; break;
		case"practice": selectSp = "AND SPACE_CATEGORY = 'practice'"; break;
		case"party": selectSp = "AND SPACE_CATEGORY = 'party'"; break;
		}
		
		ArrayList<Space> list = new SpaceService().selectAdminList(pi, selectSp);
		HashMap<String, Object> h = new HashMap<>();
		h.put("list", list);
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

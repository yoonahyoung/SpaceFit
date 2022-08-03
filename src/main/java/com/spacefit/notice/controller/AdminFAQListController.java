package com.spacefit.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.FAQ;

/**
 * Servlet implementation class AdminFAQListController
 */
@WebServlet("/list.fa")
public class AdminFAQListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		if(loginUser == null || loginUser.getMemAdmFlag().equals("U") ) {
			session.setAttribute("alertMsg", "관리자 로그인이 필요합니다!");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
		
			// ---------- 페이징 처리 -----------
			int listCount;		// 현재 총 게시글 갯수
			int currentPage;	// 사용자가 보게될 페이지 (즉, 사용자가 요청한 페이지)
			int pageLimit;		// 페이징바의 페이지 최대갯수 (몇개 단위씩)
			int boardLimit;		// 한 페이지당 보여질 게시글 최대갯수 (몇개 단위씩)
			// 위의 4개를 가지고 아래 3개의 값을 구해낼것임
			int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
			int startPage;		// 페이징바의 시작수 (pageLimit 넘어갈때마다 달라짐)
			int endPage;		// 페이징바의 끝수
			
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
			
			ArrayList<FAQ> list = new NoticeService().selectFAQList(pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/admin/notice/FAQListManage.jsp").forward(request, response);

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

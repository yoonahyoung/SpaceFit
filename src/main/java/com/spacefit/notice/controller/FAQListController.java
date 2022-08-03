package com.spacefit.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.vo.Member;
import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.FAQ;

/**
 * Servlet implementation class FAQListController
 */
@WebServlet("/userList.fa")
public class FAQListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다!");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			
			ArrayList<FAQ> list = new NoticeService().selectFAQUserList();
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/user/notice/FAQListView.jsp").forward(request, response);
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

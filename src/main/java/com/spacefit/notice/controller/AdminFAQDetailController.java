package com.spacefit.notice.controller;

import java.io.IOException;

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
 * Servlet implementation class AdminFAQDetailController
 */
@WebServlet("/detail.fa")
public class AdminFAQDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQDetailController() {
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
			
			request.setCharacterEncoding("UTF-8");
			
			int faNo = Integer.parseInt(request.getParameter("no"));
			FAQ faq = new NoticeService().adminDetailFAQ(faNo);
			
			request.setAttribute("faq", faq);
			request.getRequestDispatcher("views/admin/notice/FAQDetailManage.jsp").forward(request, response);
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

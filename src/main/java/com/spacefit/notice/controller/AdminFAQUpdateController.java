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
 * Servlet implementation class AdminFAQUpdateController
 */
@WebServlet("/adUpdate.fa")
public class AdminFAQUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		int faNo = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String status = request.getParameter("status");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		FAQ f= new FAQ(faNo, title, content, memNo, status);
		
		int result = new NoticeService().adminUpdateFAQ(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다!");
			response.sendRedirect(request.getContextPath() + "/list.fa?cpage=1");
		}else {
			response.sendRedirect("views/admin/common/errorManager.jsp");
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

package com.spacefit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.Terms;

/**
 * Servlet implementation class AdminTermsInsertController
 */
@WebServlet("/adTermsInsert.no")
public class AdminTermsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTermsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String termsTitle = request.getParameter("termsTitle");
		String termsStatus = request.getParameter("termsStatus");
		String termsPage = request.getParameter("termsPage");
		String termsContent = request.getParameter("termsContent");
		String termsNote = request.getParameter("termsNote");
		
		Terms t = new Terms(termsTitle, termsContent, termsStatus, termsPage, termsNote);
		
		int result = new NoticeService().adminInsertTerms(t);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			session.setAttribute("alertMsg", "약관이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adTermsInsertDetail.no");
			
		}else {
			
			session.setAttribute("alertMsg", "약관 등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/adTermsInsertDetail.no");
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

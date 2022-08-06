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
import com.spacefit.notice.model.vo.Terms;

/**
 * Servlet implementation class AdminTermsUpdateController
 */
@WebServlet("/adTermsUpdate.no")
public class AdminTermsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTermsUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		int termsNo = Integer.parseInt(request.getParameter("termsNo"));
		String termsTitle = request.getParameter("termsTitle");
		String termsStatus = request.getParameter("termsStatus");
		String termsPage = request.getParameter("termsPage");
		String termsContent = request.getParameter("termsContent");
		String termsNote = request.getParameter("termsNote");
		
		Terms t = new Terms(termsNo, termsTitle, termsContent, termsStatus, termsPage,  termsNote);
		
		int result = new NoticeService().adminUpdateTerms(t);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "이용약관이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adTermsDetail.no?termsNo=" + termsNo);
		}else {
			session.setAttribute("alertMsg", "이용약관 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/adTermsDetail.no?termsNo=" + termsNo);
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

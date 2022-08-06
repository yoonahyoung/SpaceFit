package com.spacefit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.Terms;

/**
 * Servlet implementation class AdminTermsDetailViewController
 */
@WebServlet("/adTermsDetail.no")
public class AdminTermsDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTermsDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int termsNo = Integer.parseInt(request.getParameter("termsNo"));

		Terms t = new NoticeService().adminSelectTerms(termsNo);

		request.setAttribute("t", t);
		request.getRequestDispatcher("views/admin/homepage/termsDetailView.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

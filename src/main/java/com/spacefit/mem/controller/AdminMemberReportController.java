package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.ReportService;

/**
 * Servlet implementation class MemberReportController
 */
@WebServlet("/memReport.me")
public class AdminMemberReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberReportController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
		//ArrayList <Report> rptList = new ReportDao().selectReportList();
		//request.setAttribute("rptList", rptList);
		int todayReviewCount = new ReportService().todayRvCount();
		int totalReviewCount = new ReportService().totalRvCount();
		int todayCommentCount = new ReportService().todayCmCount();
		int totalCommentCount = new ReportService().totalCmCount();
		String memId = new ReportService().maxMemId();
		
		request.setAttribute("todayReviewCount", todayReviewCount);
		request.setAttribute("totalReviewCount", totalReviewCount);
		request.setAttribute("todayCommentCount", todayCommentCount );
		request.setAttribute("totalCommentCount", totalCommentCount);
		request.setAttribute("memId", memId);
		request.getRequestDispatcher("views/admin/mem/memberReport.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

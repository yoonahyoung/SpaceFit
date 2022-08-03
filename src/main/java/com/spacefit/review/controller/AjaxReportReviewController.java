package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.vo.Report;
import com.spacefit.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxReportReviewController
 */
@WebServlet("/reportRv.rv")
public class AjaxReportReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int rptMemNo = Integer.parseInt(request.getParameter("rptMemNo"));
		int rptReasonNo = Integer.parseInt(request.getParameter("rptReasonNo"));
		int rptRefNo = Integer.parseInt(request.getParameter("rptRefNo"));
		
		Report rpt = new Report(memNo, rptMemNo, rptReasonNo, rptRefNo);
		
		int result = new ReviewService().reportReview(rpt);
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

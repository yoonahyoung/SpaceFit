package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.ReportService;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.mem.model.vo.Report;
import com.spacefit.review.model.service.ReviewService;

/**
 * Servlet implementation class ReportCommentController
 */
@WebServlet("/reportCom.rv")
public class ReportCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int spNo = Integer.parseInt(request.getParameter("spNo"));
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int rptMemNo = Integer.parseInt(request.getParameter("rptMemNo"));
		int rptReasonNo = Integer.parseInt(request.getParameter("rptReasonNo"));
		int rptRefNo = Integer.parseInt(request.getParameter("rptRefNo"));
				
		Report rpt = new Report(memNo, rptMemNo, rptReasonNo, rptRefNo);
		
		//System.out.println(rpt);
		//System.out.println(spNo);
		int reportCmExist = new ReportService().selectCmExist(rpt);
		int result = new ReportService().reportCommentReview(rpt);
		if(result > 0  && reportCmExist < 1){
			 // 신고 성공
			request.getSession().setAttribute("alertMsg","신고완료! 스페이스핏 운영에 도움을 주셔서 감사합니다." );
			response.sendRedirect(request.getContextPath() + "/detail.sp?no=" + spNo);
		 } else {
			 request.getSession().setAttribute("alertMsg","이미 신고한 댓글은 추가로 신고 불가합니다.");			 
			 response.sendRedirect(request.getContextPath() + "/detail.sp?no=" + spNo);
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

package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.ReportService;
import com.spacefit.mem.model.vo.Report;

/**
 * Servlet implementation class AdminMemberReportDetailViewController
 */
@WebServlet("/memRptDetailView.me")
public class AdminMemberReportDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberReportDetailViewController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int rptRefNo = Integer.parseInt(request.getParameter("no"));
		String rptMemId = request.getParameter("rptMemId");
	    String category = request.getParameter("category");
	    String content = "";
	    
		switch(category) {
		case "후기" : content += new ReportService().selectRvContent(rptRefNo); break;
		case "댓글" : content += new ReportService().selectCmContent(rptRefNo); break;
		}
		
		Report r = new Report();
		r.setRptRefNo(rptRefNo);
		r.setRptMemId(rptMemId);
		r.setCategory(category);
		
		request.setAttribute("r", r);
		request.setAttribute("content", content);
		
		request.getRequestDispatcher("views/admin/mem/memberReportDetailView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

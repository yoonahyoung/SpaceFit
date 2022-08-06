package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.ReportService;

/**
 * Servlet implementation class AdminReportStatusChangeController
 */
@WebServlet("/statusChange.rp")
public class AdminReportStatusChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportStatusChangeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rptRefNo = Integer.parseInt(request.getParameter("rno"));		
	    String category = request.getParameter("category");
		
	    int result = 0;
	    
	    switch(category) {
		case "후기" : result = new ReportService().updateRvStatus(rptRefNo); break;
		case "댓글" : result = new ReportService().updateCmStatus(rptRefNo); break;
		}
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "비공개설정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memReport.me");
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

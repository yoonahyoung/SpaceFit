package com.spacefit.mem.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.mem.model.service.ReportService;
import com.spacefit.mem.model.vo.Report;

/**
 * Servlet implementation class AjaxAdminMemberReportController
 */
@WebServlet("/ajAdminReport.re")
public class AjaxAdminMemberReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminMemberReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectSearch = "";
		String selectorderBy = "";
		switch(request.getParameter("selectSearch")) {
		case "total" : break;
		case "reviewSearch" : selectSearch += " WHERE R.RPT_REF_CAT = 1"; break;
		case "commentSearch" : selectSearch += " WHERE R.RPT_REF_CAT = 2"; break;
		case "countDesc" : selectorderBy += " ORDER BY COUNT DESC"; break;		
		}
				
		
		ArrayList<Report> list = new ReportService().adminSelectList(selectSearch, selectorderBy);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

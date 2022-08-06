package com.spacefit.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.Terms;

/**
 * Servlet implementation class AdminTermsListController
 */
@WebServlet("/adTermsList.no")
public class AdminTermsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTermsListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String termsStatus = request.getParameter("opt");

		if(termsStatus != null) { // selected 되었을 경우
			
				ArrayList<Terms> list = new ArrayList<>();
				if(termsStatus.equals("Y")) {
					
					list = new NoticeService().adminTermsYList();	
					
				}else {
					
					list = new NoticeService().adminTermsNList();	
				}
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/admin/homepage/termsManage.jsp").forward(request, response);
				
		}else { // selected 없이 전체 조회
			
			ArrayList<Terms> list = new NoticeService().adminTermsList();	
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/homepage/termsManage.jsp").forward(request, response);
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

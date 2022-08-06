package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberGradeUpChange
 */
@WebServlet("/gradeUp.me")
public class AdminMemberGradeUpChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberGradeUpChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strGradeUpNo = request.getParameter("strGradeUpNo");
		int howMany = new MemberService().gradeUp(strGradeUpNo);
		
		if(howMany > 0) {
			request.getSession().setAttribute("alertMsg", howMany + "명이 등업되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memManage.me");
		} else {
			request.setAttribute("errorMsg", "이미 가장 높은 등급입니다.");
			response.sendRedirect(request.getContextPath() + "/memManage.me");
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

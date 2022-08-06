package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberGeneralChange
 */
@WebServlet("/changeGen.me")
public class AdminMemberGeneralChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberGeneralChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strGenNo = request.getParameter("strGenNo");
		// System.out.println("서블릿에서 확인하는 strAdminNo " + strAdminNo);
		int howMany = new MemberService().generalCheck(strGenNo);
		
		if(howMany > 0) {
			request.getSession().setAttribute("alertMsg", howMany + "명이 일반회원으로 변경되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memManage.me");
		} else {
			request.setAttribute("alertMsg", "이미 일반 회원입니다.");
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

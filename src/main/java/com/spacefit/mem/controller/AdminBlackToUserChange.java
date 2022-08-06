package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminBlackToUserChange
 */
@WebServlet("/changeBlack.me")
public class AdminBlackToUserChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBlackToUserChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strBlackNo = request.getParameter("strBlackNo");
		// System.out.println("서블릿에서 확인하는 strAdminNo " + strAdminNo);
		int howMany = new MemberService().blackCheck(strBlackNo);
		
		if(howMany > 0) {
			request.getSession().setAttribute("alertMsg", howMany + "명이 일반회원으로 변경되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memManage.me");
		} else {
			request.setAttribute("errorMsg", "이미 일반 화원입니다.");
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

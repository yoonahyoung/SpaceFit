package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberReviewAdminChange
 */
@WebServlet("/changeAdm.me")
public class AdminMemberAdminChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberAdminChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strAdminCheck = request.getParameter("strAdminCheck");
		// System.out.println("서블릿에서 확인하는 strAdminCheck " + strAdminCheck);
		int adminCheck = new MemberService().adminCheck(strAdminCheck);
		request.setAttribute("adminCheck", adminCheck);
		//response.sendRedirect(request.getContextPath() + "/memManage.me");
		request.getRequestDispatcher("views/admin/mem/memberManage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

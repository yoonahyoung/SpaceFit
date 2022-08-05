package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.common.controller.PwdHashController;
import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class MemberPwdChangeResultController
 */
@WebServlet("/pwdChangeResult.me")
public class MemberPwdChangeResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdChangeResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String beforeMemPwd = request.getParameter("memPwd");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memPhone = request.getParameter("memPhone");
		
		String memPwd = PwdHashController.encoding(beforeMemPwd);
		
		int result = new MemberService().updateUnknownPwd(memPwd, memPhone);
		
		 request.getRequestDispatcher("views/user/myPage/pwdChangeResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

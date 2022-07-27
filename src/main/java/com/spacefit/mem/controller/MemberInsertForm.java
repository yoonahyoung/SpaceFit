package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class MemberInsertForm
 */
@WebServlet("/insert.me")
public class MemberInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩작업
		request.setCharacterEncoding("UTF-8");
		
		// 2. 요청시 전달값 받기
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String memIdNo = request.getParameter("memIdNo");
		String memPhone = request.getParameter("memPhone");
		String memMail = request.getParameter("memMail"); // 이거만 널일수 있음
		if(memMail == null) {
			memMail = "";
		}
		
		Member m = new Member(memId, memPwd, memName, memIdNo, memPhone, memMail);
		
		// 3. jdbc 실행
		int result = new MemberService().insertMember(m);
		HttpSession session = request.getSession();
		if(result > 0) {
			request.getRequestDispatcher("views/user/myPage/signInThree.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패했습니다. 관리자에게 연락주세요!");
			response.sendRedirect(request.getContextPath());
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

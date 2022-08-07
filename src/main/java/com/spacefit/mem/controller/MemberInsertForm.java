package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.common.controller.PwdHashController;
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
		String memRealPwd = request.getParameter("memPwd"); // 진짜 비밀번호는 따로 저장해서 로그인 할때만 쓸거임
		String memName = request.getParameter("memName");
		String memIdNo = request.getParameter("memIdNo");
		String memPhone = request.getParameter("memPhone");
		String memMail = request.getParameter("memMail"); // 이거만 널일수 있음
		if(memMail == null) {
			memMail = "";
		}
		
		String memPwd = PwdHashController.encoding(memRealPwd);
		
		Member m = new Member(memId, memPwd, memName, memIdNo, memPhone, memMail, memRealPwd);
		
		// 3. jdbc 실행
		int result = new MemberService().insertMember(m);
		HttpSession session = request.getSession();
		if(result > 0) {
			request.getRequestDispatcher("views/user/myPage/signInThree.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "이미 가입한 회원 정보와 일치하는 회원입니다! 정보를 확인해주세요!");
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

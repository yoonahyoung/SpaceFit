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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/memUpdate.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String memName = request.getParameter("memName");
		String memMail = request.getParameter("memMail");
		String memId = request.getParameter("memId");
		String memPhone = request.getParameter("memPhone");
		
		Member m = new Member(memName, memMail, memId, memPhone);
		
		Member updateMem = new MemberService().updateMember(m);
		
		
		if(updateMem == null) { 
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원정보 수정에 실패하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/updatePage.me");
			
		}else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/updatePage.me");
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

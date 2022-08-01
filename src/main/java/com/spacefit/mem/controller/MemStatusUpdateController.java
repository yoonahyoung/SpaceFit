package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class MemStatusUpdateController
 */
@WebServlet("/memStatusUpdate.me")
public class MemStatusUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemStatusUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		int result = new MemberService().updateMemberStatus(memId, memPwd);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "서비스 탈퇴되었습니다. 그동안 SPACEFIT을 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			
		}else {
			session.setAttribute("alertMsg", "서비스 탈퇴에 실패했습니다.");
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

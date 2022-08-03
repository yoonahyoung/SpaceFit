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
 * Servlet implementation class UserMemberUpdateController
 */
@WebServlet("/updatePage.me")
public class MemberUpdatePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int cpCount = new MemberService().selectCouponCount(memNo);
		String grName = new MemberService().selectGrade(memId);
		
		if(session.getAttribute("loginUser") == null) {
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			
			request.setAttribute("cpCount", cpCount);
			request.setAttribute("grName", grName);
			request.getRequestDispatcher("views/user/myPage/memberUpdateView.jsp").forward(request, response);
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

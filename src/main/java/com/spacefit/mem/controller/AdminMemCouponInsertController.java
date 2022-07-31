package com.spacefit.mem.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminMemCouponInsertController
 */
@WebServlet("/adMemCouponInsert.me")
public class AdminMemCouponInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemCouponInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int cpNo = Integer.parseInt(request.getParameter("cpNo"));
		String mcpEndDate = request.getParameter("mcpEndDate");
		String cpGroup = request.getParameter("cpGroup");
		int grNo = Integer.parseInt(request.getParameter("cpGroup_2"));
		String memId = request.getParameter("cpGroup_3");

		int result = 0;
		if(grNo != 0 && cpGroup.equals("그룹회원")) {
			
			result = new MemberService().adminInsertGroupCoupon(cpNo, grNo, mcpEndDate);
			
		}
		
		System.out.println(result);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			session.setAttribute("alertMsg", "쿠폰이 발급되었습니다.");
			response.sendRedirect(request.getContextPath());
			
		}else {
			
			session.setAttribute("alertMsg", "쿠폰 발급에 실패했습니다.");
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

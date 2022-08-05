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
 * Servlet implementation class DownCouponInsertController
 */
@WebServlet("/downCouponInsert.me")
public class DownCouponInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownCouponInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String cpName = request.getParameter("cpName");
		String cpEndDate = request.getParameter("cpEndDate");
		
		System.out.println(cpName + cpEndDate);
		
		int result = new MemberService().insertDownCoupon(cpName, memNo, cpEndDate);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "쿠폰이 발급되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myCouponList.me");
			
		}else {
			
			session.setAttribute("alertMsg", "쿠폰 발급에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myCouponList.me");
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

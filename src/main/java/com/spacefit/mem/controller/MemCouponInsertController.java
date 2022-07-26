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
 * Servlet implementation class MemCouponInsertController
 */
@WebServlet("/memCouponInsert.me")
public class MemCouponInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemCouponInsertController() {
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
		String cpName = request.getParameter("cpCode");
		
		int result = new MemberService().insertMemCoupon(memNo, cpName);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "쿠폰이 발급되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myCouponList.me");
			
		}else {
			
			session.setAttribute("alertMsg", "존재하지 않는 쿠폰입니다.");
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

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
 * Servlet implementation class AdminCouponInsertController
 */
@WebServlet("/adCouponInsert.me")
public class AdminCouponInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCouponInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String cpName = request.getParameter("cpName");
		int cpDiscount = Integer.parseInt(request.getParameter("cpDiscount"));
		
		int result = new MemberService().adminInsertCoupon(cpName, cpDiscount);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			session.setAttribute("alertMsg", "쿠폰이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adCouponDetail.me");
			
		}else {
			
			session.setAttribute("alertMsg", "쿠폰 등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/adCouponDetail.me");
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

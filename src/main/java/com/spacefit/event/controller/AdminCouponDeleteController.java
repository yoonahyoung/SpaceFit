package com.spacefit.event.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminCouponDeleteController
 */
@WebServlet("/adCouponDelete.me")
public class AdminCouponDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCouponDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int cpNo = Integer.parseInt(request.getParameter("cpNo"));
		
		int result = new MemberService().deleteCoupon(cpNo);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			session.setAttribute("alertMsg", "쿠폰을 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/adCouponList.me");
			
		}else {
			
			session.setAttribute("alertMsg", "해당 쿠폰을 보유한 회원이 있습니다.");
			response.sendRedirect(request.getContextPath() + "/adCouponList.me");
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

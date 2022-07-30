package com.spacefit.mem.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class MyCouponListController
 */
@WebServlet("/myCouponList.me")
public class MyCouponListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCouponListController() {
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
		
		String grName = new MemberService().selectGrade(memId);
		ArrayList<Mcp> list = new MemberService().selectCouponList(memNo);
	
		request.setAttribute("grName", grName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/user/myPage/myCoupon.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

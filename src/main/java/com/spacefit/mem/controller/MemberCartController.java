package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class MemberCartController
 */
@WebServlet("/cart.sp")
public class MemberCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int spNo = Integer.parseInt(request.getParameter("no"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		String park = request.getParameter("park");
		String animal = request.getParameter("animal");
		String stand = request.getParameter("stand");
		String chair = request.getParameter("chair");
		String date = request.getParameter("date");
		String detailCI = request.getParameter("detailCI");
		String detailCO = request.getParameter("detailCO");
		int price = Integer.parseInt(request.getParameter("price"));
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

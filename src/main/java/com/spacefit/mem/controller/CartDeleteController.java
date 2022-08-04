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
 * Servlet implementation class CartDeleteController
 */
@WebServlet("/cartDelete.me")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteController() {
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
		
		int result = new MemberService().deleteCart(memNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "보관함을 깨끗이 비웠습니다. 새로운 상품을 담아주세요!");
			response.sendRedirect(request.getContextPath() + "/cartList.me");
			
		}else {
			
			session.setAttribute("alertMsg", "보관함을 삭제하지 못했습니다.");
			response.sendRedirect(request.getContextPath() + "/cartList.me");
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

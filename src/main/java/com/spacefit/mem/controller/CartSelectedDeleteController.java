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
 * Servlet implementation class CartSelectedDeleteController
 */
@WebServlet("/cartSelectedDelete.me")
public class CartSelectedDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartSelectedDeleteController() {
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
		int spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
		
		int result = new MemberService().deleteSelectedCart(memNo, spaceNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "선택한 상품이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/cartList.me");
			
		}else {
			
			session.setAttribute("alertMsg", "선택한 상품을 삭제하지 못했습니다.");
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

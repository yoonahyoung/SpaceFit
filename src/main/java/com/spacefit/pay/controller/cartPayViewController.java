package com.spacefit.pay.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.pay.model.service.PayService;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class cartPayViewController
 */
@WebServlet("/pay.cart")
public class cartPayViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartPayViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int no = Integer.parseInt(request.getParameter("spaceNo"));
		
		Cart quickPay = new PayService().selectCart(no);
		Space s = new SpaceService().spaceDetailView(no);
		ArrayList<Mcp> list = new MemberService().selectMyCouponList(quickPay.getMemNo());
		
		int result = new PayService().deleteCart(no);
		
		if(result > 0) {
			request.setAttribute("quickPay", quickPay);
			request.setAttribute("s", s);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/user/pay/payView.jsp").forward(request, response);
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

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
		
		String cart = request.getParameter("cart");
		
		System.out.println(cart);
		String arr[] = cart.split(",");
		int memNo = Integer.parseInt(arr[0]);
		int spaceNo = Integer.parseInt(arr[1]);
		int limit = Integer.parseInt(arr[2]);
		String date = arr[3];
		String detailCI = arr[4];
		String detailCO = arr[5];
		String park = arr[6];
		String animal = arr[7];
		String stand = arr[8];
		String chair = arr[9];
		int discountAmount = Integer.parseInt(arr[10]);
		
		Cart quickPay = new Cart(memNo, spaceNo, limit, date, detailCI, detailCO, park, animal, stand, chair, discountAmount);
		Space s = new SpaceService().spaceDetailView(spaceNo);
		ArrayList<Mcp> list = new MemberService().selectMyCouponList(quickPay.getMemNo());
		
		if(s.getSpaceCategory().equals("practice")) {
			s.setSpaceCategory("연습실");
		} else if(s.getSpaceCategory().equals("studio")) {
			s.setSpaceCategory("스튜디오");
		}else if(s.getSpaceCategory().equals("party")) {
			s.setSpaceCategory("파티룸");
		}
		//int result = new PayService().deleteCart(quickPay);
		
		//if(result > 0) {
			request.setAttribute("quickPay", quickPay);
			request.setAttribute("s", s);
			request.setAttribute("list", list);
			//response.sendRedirect(request.getContextPath()+"/bolist.bo");
			request.getRequestDispatcher("views/user/pay/payView.jsp").forward(request, response);
		//}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
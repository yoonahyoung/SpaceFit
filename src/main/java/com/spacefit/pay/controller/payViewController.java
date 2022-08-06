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
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class payViewController
 */
@WebServlet("/pay.me")
public class payViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payViewController() {
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
		String park = request.getParameter("parking");
		String animal = request.getParameter("animal");
		String stand = request.getParameter("stand");
		String chair = request.getParameter("chair");
		String date = request.getParameter("date");
		String detailCI = request.getParameter("detailCI");
		String detailCO = request.getParameter("detailCO");
		int price = Integer.parseInt(request.getParameter("price"));
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Cart quickPay = new Cart(memNo, spNo, limit, date, detailCI, detailCO, park, animal, stand, chair, price);
		Space s = new SpaceService().spaceDetailView(spNo);
		ArrayList<Mcp> list = new MemberService().selectMyCouponList(memNo);
		
		if(s.getSpaceCategory().equals("practice")) {
			s.setSpaceCategory("연습실");
		} else if(s.getSpaceCategory().equals("studio")) {
			s.setSpaceCategory("스튜디오");
		}else if(s.getSpaceCategory().equals("party")) {
			s.setSpaceCategory("파티룸");
		}
		request.setAttribute("quickPay", quickPay);
		request.setAttribute("s", s);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/user/pay/payView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

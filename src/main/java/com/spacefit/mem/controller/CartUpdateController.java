package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class CartUpdateController
 */
@WebServlet("/cartUpdate.me")
public class CartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		int spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
		int cartLimit = Integer.parseInt(request.getParameter("cartLimit"));
		String cartParking = request.getParameter("cartParking");
		String cartAnimal = request.getParameter("cartAnimal");
		String cartStand = request.getParameter("cartStand");
		String cartChair = request.getParameter("cartChair");
		
		Cart c = new Cart(memNo, spaceNo, cartLimit, cartParking, cartAnimal, cartStand, cartChair);
		
		int result = new MemberService().updateCart(c);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

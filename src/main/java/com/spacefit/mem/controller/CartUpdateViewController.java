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
@WebServlet("/cartUpdateView.me")
public class CartUpdateViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdateViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		String spaceName = request.getParameter("spaceName");
		
		Cart c = new MemberService().selectCartUpdateView(memNo, spaceName);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(c, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

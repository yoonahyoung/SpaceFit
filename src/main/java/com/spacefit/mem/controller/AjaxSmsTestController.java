package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxSmsTestController
 */
@WebServlet("/smsTest.me")
public class AjaxSmsTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSmsTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String smsNoCheck = request.getParameter("smsNoCheck");
		String randomNo = request.getParameter("randomNo");
		int result = 0;
		if(smsNoCheck == randomNo) {
			result = 1;
		} else {
			System.out.println("사용자가 입력한 번호랑 안맞는다!");
			result = 0;
		}
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

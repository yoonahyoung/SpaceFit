package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.common.controller.TestSms;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class SmsAccountCheck
 */
@WebServlet("/sms.me")
public class AjaxSmsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSmsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memPhone = request.getParameter("memPhone");
		System.out.println("서비스에서 확인하는 memPhone" + memPhone);
		String randomNo = new TestSms().testMessage(memPhone);
		System.out.println("서비스 에서 확인하는 " + randomNo);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(randomNo, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

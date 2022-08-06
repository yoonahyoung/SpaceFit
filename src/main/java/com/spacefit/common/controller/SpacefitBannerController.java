package com.spacefit.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.event.model.vo.Banner;
import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class SpacefitBannerController
 */
@WebServlet("/spacefitBanner.co")
public class SpacefitBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpacefitBannerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String banImg1 = new MemberService().selectBannerOne();
		String banImg2 = new MemberService().selectBannerTwo();
		String banImg3 = new MemberService().selectBannerThree();
		
		ArrayList<String> list = new ArrayList<>();
		list.add(banImg1);
		list.add(banImg2);
		list.add(banImg3);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

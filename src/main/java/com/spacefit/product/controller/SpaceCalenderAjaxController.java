package com.spacefit.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.reservation.model.vo.Book;

/**
 * Servlet implementation class SpaceCalenderAjaxController
 */
@WebServlet("/calender.sp")
public class SpaceCalenderAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceCalenderAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int spNo = Integer.parseInt(request.getParameter("no"));
		// 캘린더에 뿌리기 위한 데이터 가져오기
		ArrayList<Book> bList = new SpaceService().selectCalBook(spNo);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(bList, response.getWriter());
		System.out.println(bList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

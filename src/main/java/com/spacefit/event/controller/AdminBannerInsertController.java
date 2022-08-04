package com.spacefit.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.event.model.service.EventService;
import com.spacefit.event.model.vo.Banner;


/**
 * Servlet implementation class AdminBannerInsertController
 */
@WebServlet("/adBannerInsert.ev")
public class AdminBannerInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String banName = request.getParameter("banName");
		String banStatus = request.getParameter("banStatus");
		String banImg = request.getParameter("banImg");
		String banURL = request.getParameter("banURL");
		
		Banner b = new Banner(banName, banStatus, banURL, banImg);
		
		int result = new EventService().adminInsertBanner(b);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			session.setAttribute("alertMsg", "배너가 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adBannerList.ev");
			
		}else {
			
			session.setAttribute("alertMsg", "배너 등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/adBannerInsertView.ev");
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

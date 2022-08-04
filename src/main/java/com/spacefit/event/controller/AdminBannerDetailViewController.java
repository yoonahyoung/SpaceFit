package com.spacefit.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.event.model.service.EventService;
import com.spacefit.event.model.vo.Banner;

/**
 * Servlet implementation class AdminBannerDetailViewController
 */
@WebServlet("/adBannerDetail.ev")
public class AdminBannerDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int banNo = Integer.parseInt(request.getParameter("banNo"));
		
		Banner b = new EventService().selectBannerDetail(banNo);
		
		if(b == null) {
			
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/admin/homepage/bannerDetailView.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("b", b);
			response.sendRedirect(request.getContextPath() + "/adBannerList.ev");
			
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

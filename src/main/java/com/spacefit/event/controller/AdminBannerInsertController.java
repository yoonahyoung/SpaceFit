package com.spacefit.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.spacefit.common.SpacefitFileRenamePolicy;
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
		
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = session.getServletContext().getRealPath("/resources/admin/homePage_upfiles/");
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpacefitFileRenamePolicy());
	
			String originName = multi.getOriginalFileName("banImg");
			String changeName = multi.getFilesystemName("banImg");
			String filePath = "resources/admin/homePage_upfiles/";
			String banImg = filePath + changeName;	
			
			String banName = multi.getParameter("banName");
			String banStatus = multi.getParameter("banStatus");
			String banURL = multi.getParameter("banURL");
			
			Banner b = new Banner(banName, banStatus, banURL, banImg);
			
			int result = new EventService().adminInsertBanner(b);
			
			
			if(result > 0) {
				
				session.setAttribute("originName", originName);
				session.setAttribute("alertMsg", "배너가 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adBannerList.ev");
				
			}else {
				
				session.setAttribute("alertMsg", "배너 등록에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/adBannerInsertView.ev");
			}
			
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

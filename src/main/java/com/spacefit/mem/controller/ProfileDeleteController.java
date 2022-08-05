package com.spacefit.mem.controller;

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
import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class ProfileDeleteController
 */
@WebServlet("/profileDelete.me")
public class ProfileDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
			
		Member updateMem = new MemberService().deleteProfile(memId);
	
			if(updateMem == null) {
				
				session.setAttribute("alertMsg", "프로필 사진을 삭제하지 못했습니다.");
				
			}else {
				
				session.setAttribute("alertMsg", "프로필 사진이 삭제되었습니다.");
				session.setAttribute("loginUser", updateMem);
				
			}
		
		response.sendRedirect(request.getContextPath() + "/updatePage.me");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

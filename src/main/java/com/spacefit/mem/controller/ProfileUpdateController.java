package com.spacefit.mem.controller;

import java.io.File;
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
 * Servlet implementation class ProfileUpdateController
 */
@WebServlet("/profileUpdate.me")
public class ProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateController() {
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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = session.getServletContext().getRealPath("/resources/user/mem_upfiles/");
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpacefitFileRenamePolicy());
	
			String originName = multi.getOriginalFileName("profile");
			String changeName = multi.getFilesystemName("profile");
			String filePath = "resources/user/mem_upfiles/";
			String memProfile = filePath + changeName;	
			
			Member updateMem = new MemberService().updateProfile(memProfile, memId);
	
			if(updateMem == null) {
				
				session.setAttribute("alertMsg", "프로필 사진 변경에 실패했습니다.");
				
			}else {
				
				if(memProfile != null) {
					new File(savePath + changeName).delete();
				}
				
				session.setAttribute("alertMsg", "프로필 사진이 변경되었습니다.");
				session.setAttribute("loginUser", updateMem);
				
			}
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

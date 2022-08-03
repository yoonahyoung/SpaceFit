package com.spacefit.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class SpaceDetailAdminController
 */
@WebServlet("/adDetail.sp")
public class SpaceDetailAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceDetailAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		if(loginUser == null || loginUser.getMemAdmFlag().equals("U") ) {
			session.setAttribute("alertMsg", "관리자 로그인이 필요합니다!");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}else {
			int spNo = Integer.parseInt(request.getParameter("no"));
			
			Space s = new SpaceService().spaceDetailView(spNo);
			ArrayList<Attachment> list = new SpaceService().selectAttach(spNo);
			request.setAttribute("s", s);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/space/spaceDetailManage.jsp").forward(request, response);
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

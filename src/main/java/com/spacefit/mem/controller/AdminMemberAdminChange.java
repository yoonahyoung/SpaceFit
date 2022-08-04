package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberReviewAdminChange
 */
@WebServlet("/changeAdm.me")
public class AdminMemberAdminChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberAdminChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strAdminNo = request.getParameter("strAdminNo");
		 System.out.println("서블릿에서 확인하는 strAdminNo " + strAdminNo);
		int howMany = new MemberService().adminCheck(strAdminNo);
		
		if(howMany > 0) {
			request.getSession().setAttribute("alertMsg", howMany + "명의 관리자 변경이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memManage.me");
		} else {
			request.setAttribute("errorMsg", "관리자 등록에 실패했습니다.");
			request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp").forward(request, response);
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

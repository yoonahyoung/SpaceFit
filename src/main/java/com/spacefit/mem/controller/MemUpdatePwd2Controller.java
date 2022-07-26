package com.spacefit.mem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.common.controller.PwdHashController;
import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class MemUpdatePwd2Controller
 */
@WebServlet("/memUpdatePwd.me")
public class MemUpdatePwd2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemUpdatePwd2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		String hashPwd = PwdHashController.encoding(updatePwd);
		
		int result1 = new MemberService().hashPwdChange(memId, hashPwd);
		int result2 = new MemberService().realPwdChange(memId, updatePwd);

		Member updateMem = new MemberService().loginMember(memId, updatePwd);
		HttpSession session = request.getSession();
		if(updateMem == null) {
			
			session.setAttribute("alertMsg", "비밀번호를 다시 확인해주세요.");
			
		}else {
			
			session.setAttribute("alertMsg", "비밀번호 변경에 성공했습니다.");
			session.setAttribute("loginUser", updateMem);
		}
		
		response.sendRedirect(request.getContextPath() + "/updatePwdForm.me");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

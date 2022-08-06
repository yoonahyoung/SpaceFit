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

/**
 * Servlet implementation class MemberPwdChangeResultController
 */
@WebServlet("/pwdChangeResult.me")
public class MemberPwdChangeResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdChangeResultController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memRealPwd = request.getParameter("memPwd");
		//int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memPhone = request.getParameter("memPhone");		
		String memPwd = PwdHashController.encoding(memRealPwd);
		//System.out.println("첫번째 서비스 전 memPwd" + memPwd);
		//System.out.println("첫번째 서비스 전 memRealPwd" + memRealPwd);
		
		MemberService service = new MemberService();
		//System.out.println("컨트롤러 실행전" + memRealPwd + "그리고" + memPwd);
		int result1 = service.updateUnknownPwd(memPwd, memPhone);
		
		//System.out.println("첫번째 서비스 후 memPwd" + memPwd);
		//System.out.println("첫번째 서비스 후 memRealPwd" + memRealPwd);

		//System.out.println("memPwd->" + memPwd);
		//System.out.println("memPhone->" + memPhone);
		MemberService service2 = new MemberService();

		//System.out.println("두번째 서비스 전 memPwd" + memPwd);
		//System.out.println("두번째 서비스 전 memRealPwd" + memRealPwd);
		//System.out.println("두번째 서비스 전 memPhone" + memPhone);
		int result2 = service2.updateRealUnknownPwd(memRealPwd, memPhone);

		System.out.println("두번째 서비스 전 memPwd" + memPwd);
		System.out.println("두번째 서비스 전 memRealPwd" + memRealPwd);
		System.out.println("두번째 서비스 전 memPhone" + memPhone);
		
		//System.out.println(result2 + "이후");
		//System.out.println("컨트롤러 실행후" + result1 + "그리고" + result2);
		int result3 = result2;
			
		if(result3 > 0) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.getRequestDispatcher("views/user/myPage/pwdChangeResult.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "비밀번호 변경 실패");
			request.getRequestDispatcher("views/user/myPage/pwdChangeResult.jsp").forward(request, response);
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

package com.spacefit.mem.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 요청을 받아 처리해주는 컨트롤러
		
		// 1) 전달값에 한글이 있으면 인코딩처리 (post 방식)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청시 전달값 뽑아서 변수 또는 객체에 기록하기
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		
		// 3) 요청처리 (db에 sql문 실행) => 해당 요청 처리하는 서비스 클래스 메소드 호출 결과 받기
		Member loginUser = new MemberService().loginMember(memId, memPwd);
		// System.out.println(loginUser);
		
		// 4) 돌려받은 결과를 가지고 사용자가 보게될 응답화면 제시
		/*
		 * 응답페이지에 전달할 값이 있다면 어딘가 담아야함
		 * (담을 수 있는 영역 == jsp 내장객체)
		 * 
		 * 1. application (ServletContext)
		 * 		여기에 담긴 데이터는 웹 어플리케이션 전역에서 다 꺼내서 쓸 수 있음
		 * 2. session (HttpSession)
		 * 		여기에 담긴 데이터는 내가 직접 지우거나, 세션이 만료되기 전 까지 
		 * 		어떤 jsp, servlet 이던 꺼내사용할 수 있음
		 * 		세션만료 == 서버멈춤, 브라우저 닫기시
		 * 3. request (HttpSession)
		 * 		여기에 담긴 데이터는 현재 이 request 객체를
		 * 		'포워딩한 응답 jsp'에서만 꺼내쓸 수 있음 > 일회성
		 * 4. page (PageContext)
		 * 		해당 jsp에서 담고 그 jsp에서만 사용 가능
		 * 
		 * 공통적으로 데이터를 담고자 한다면 .setAttribute("키", 벨류)
		 * 		   데이터를 꺼내고자 한다면 .getAttribute("키") : 밸류 (Objsect 형으로 반환)
		 * 		   데이터를 지우고자 한다면 .removeAttribute("키")
		 */
		
		if(loginUser == null) {
			// 조회결과 없이 로그인 실패 => 에러페이지
			RequestDispatcher view = request.getRequestDispatcher("views/user/common/loginErrorPage.jsp");
			request.setAttribute("errorMsg", "로그인 실패! 아이디와 비밀번호를 확인해주세요.");
			view.forward(request, response);
			// 포워딩방식 : 해당 경로로 선택된 뷰가 보여질 뿐 url은 변경되지 않음
			// 즉 요청했을 때 url이 여전히 남아있음
		} else {
			// 조회결과 있음 로그인 성공 => 메인페이지 응담 index.jsp
			// 로그인한 회원정보가 담겨있는 loginUser를 세션에 담아서 모두가 쓰게 하자!
			// 서블릿에서 session을 호출하려면 HttpSession 에서 session을 얻어와야 함
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			// url 재요청방식 redirect 방식 : 기존에 저 페이지를 응답하는 url이 존재할경우
			// localhost:0000/web
			response.sendRedirect(request.getContextPath());
			
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

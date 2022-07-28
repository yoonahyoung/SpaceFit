package com.spacefit.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class MemberIdSearchResultController
 */
@WebServlet("/idSearchResult.me")
public class MemberIdSearchResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdSearchResultController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memPhone = request.getParameter("memPhone");
		String memName = request.getParameter("memName");
		
		Member m = new Member();
		m.setMemPhone(memPhone);
		m.setMemName(memName);
		Member searchM = new MemberService().idSearch(m);
		if(searchM.getMemId() != null) {
			// 조회에 성공한것임, 즉 회원에 목록이 있는것임
			// 그렇다면 다음페이지로 넘겨야함! 넘길때 해당 데이터를 넣어서 넘기자?
			request.setAttribute("searchM", searchM);
			request.getRequestDispatcher("views/user/myPage/idSearchResult.jsp").forward(request, response);
		} else {
			// 조회에 실패한 것임
			RequestDispatcher view = request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp");
			request.setAttribute("errorMsg", "가입하지 않은 회원이거나 회원명과 핸드폰번호가 일치하지 않습니다! 다시 확인해주세요.");
			view.forward(request, response);
            
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

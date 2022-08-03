package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.review.model.service.CommentService;

/**
 * Servlet implementation class AjaxCommentDeleteController
 */
@WebServlet("/comDelete.com")
public class AjaxCommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int comNo = Integer.parseInt(request.getParameter("comNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int result = new CommentService().deleteComment(comNo, memNo);
		//System.out.println("컨트롤러에 다 넘어온 후 출력해보자 뎃글번호 : " + comNo + "  멤버번호 : " + memNo + "결과 : " + result);
		response.setContentType("application/json; charset=UTF-8");
		if(result > 0) {
			response.getWriter().print(result);
		} else {
			System.out.println("컨트롤러에서 에이젝스 실패");
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

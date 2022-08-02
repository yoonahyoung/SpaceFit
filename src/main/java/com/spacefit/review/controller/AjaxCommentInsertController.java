package com.spacefit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.review.model.service.CommentService;
import com.spacefit.review.model.vo.Comment;

/**
 * Servlet implementation class AjaxCommentInsertController
 */
@WebServlet("/coInsert.com")
public class AjaxCommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comContent = request.getParameter("comContent");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
//		int parentNo = Integer.parseInt(request.getParameter("parentNo"));
		int rvNo = Integer.parseInt(request.getParameter("rvNo"));
		
		Comment c = new Comment();
		c.setComContent(comContent);
		c.setMemNo(memNo);
//		c.setParentNo(parentNo);
		c.setRvNo(rvNo);
		
		int result = new CommentService().insertComment(c);
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

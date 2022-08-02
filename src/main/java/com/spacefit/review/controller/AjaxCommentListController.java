package com.spacefit.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.review.model.service.CommentService;
import com.spacefit.review.model.vo.Comment;

/**
 * Servlet implementation class CommentListController
 */
@WebServlet("/comList.com")
public class AjaxCommentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCommentListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rvNo = Integer.parseInt(request.getParameter("rvNo"));
		ArrayList <Comment> comList = new CommentService().selectComList(rvNo);
		if(comList.isEmpty()) {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(comList, response.getWriter());
		} else {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(comList, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

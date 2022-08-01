package com.spacefit.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.Category;

/**
 * Servlet implementation class QnAEnrollFormController
 */
@WebServlet("/enrollForm.qa")
public class QnAEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Category> partyList = new QnAService().selectCategoryList("party");
		ArrayList<Category> practiceList = new QnAService().selectCategoryList("practice");
		ArrayList<Category> studioList = new QnAService().selectCategoryList("studio");
		
		request.setAttribute("partyList", partyList);
		request.setAttribute("practiceList", practiceList);
		request.setAttribute("studioList", studioList);
		request.getRequestDispatcher("views/user/qna/qnaEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

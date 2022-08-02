package com.spacefit.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAReplyEnrollFormController
 */
@WebServlet("/reply.qa")
public class QnAReplyEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		QnA q = new QnAService().selectQnA(no);
		
		if(q.getSpaceCategory().equals("practice")) {
			q.setSpaceCategory("연습실");
		} else if(q.getSpaceCategory().equals("studio")) {
			q.setSpaceCategory("스튜디오");
		}else if(q.getSpaceCategory().equals("party")) {
			q.setSpaceCategory("파티룸");
		}
		
		request.setAttribute("qna", q);
		request.getRequestDispatcher("views/user/qna/qnaReplyEnrollForm.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

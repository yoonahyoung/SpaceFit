package com.spacefit.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAPwdCheckController
 */
@WebServlet("/pwdcheck.qa")
public class QnAPwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAPwdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qnaNo = Integer.parseInt(request.getParameter("no"));
		
		QnA q = new QnAService().selectQnA(qnaNo);
		Attachment at = new QnAService().selectAttachment(qnaNo);
		
		if(q.getQnaPublic().equals("N") && q.getQnaPwd() != null) {
			request.setAttribute("qna", q);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/user/qna/qnaPwdCheck.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/detail.qa?no=" + qnaNo);
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

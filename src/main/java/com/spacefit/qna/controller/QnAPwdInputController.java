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
 * Servlet implementation class QnAPwdInputController
 */
@WebServlet("/checkPwd.qa")
public class QnAPwdInputController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAPwdInputController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String inputPwd = request.getParameter("inputPwd");
		int qnaNo = Integer.parseInt(request.getParameter("no"));
		
		QnA q = new QnAService().selectQnA(qnaNo);
		Attachment at = new QnAService().selectAttachment(qnaNo);
		String pwd = q.getQnaPwd();
		
		if(inputPwd.equals(pwd)) { // 입력한 비밀번호와 일치하는지 확인
			
			int result = new QnAService().increaseCount(qnaNo);
			q = new QnAService().selectQnA(qnaNo);
			
			if(q.getSpaceCategory().equals("practice")) {
				q.setSpaceCategory("연습실");
			} else if(q.getSpaceCategory().equals("studio")) {
				q.setSpaceCategory("스튜디오");
			}else if(q.getSpaceCategory().equals("party")) {
				q.setSpaceCategory("파티룸");
			}
			
			if(result > 0) {
			request.setAttribute("qna", q);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/user/qna/qnaDetailView.jsp").forward(request, response);		
			}
		}else {
			session.setAttribute("alertMsg", "다시 입력해주세요");
			response.sendRedirect(request.getContextPath()+"/pwdcheck.qa?no=" + qnaNo);
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

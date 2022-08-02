package com.spacefit.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		int result = new QnAService().isSolved(no);
		QnA q = new QnAService().selectQnA(no);
		HttpSession session = request.getSession();
		request.setAttribute("qna", q);
				
		if(q.getSpaceCategory().equals("practice")) {
			q.setSpaceCategory("연습실");
		} else if(q.getSpaceCategory().equals("studio")) {
			q.setSpaceCategory("스튜디오");
		}else if(q.getSpaceCategory().equals("party")) {
			q.setSpaceCategory("파티룸");
		}
		
		if(result != 2) { // 답변완료된 글이 아니면(result가 2가 아니면) 답변글 작성 폼으로 이동
			request.getRequestDispatcher("views/admin/qna/qnaReplyEnrollForm.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/qnaDetailView.jsp");
		}else { // 답변완료된 글이면 alertMsg 담아서 다시 문의글 상세조회 페이지로 이동
			session.setAttribute("alertMsg", "이미 답변 완료된 문의글입니다.");
			//request.getRequestDispatcher("views/admin/qna/qnaDetailView.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/adminDetail.qa?no=" + no);
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

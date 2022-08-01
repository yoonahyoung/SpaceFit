package com.spacefit.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnADetailController
 */
@WebServlet("/detail.qa")
public class QnADetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnADetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("no"));
		
		// 1) 조회수 증가 (update)
		int result = new QnAService().increaseCount(qnaNo);
		
		if(result > 0) { // 조회수 증가 성공 => 조회가능한 공지사항 맞다
			// 2) 데이터 조회 (select)
			QnA q = new QnAService().selectQnA(qnaNo);
			
			if(q.getSpaceCategory().equals("practice")) {
				q.setSpaceCategory("연습실");
			} else if(q.getSpaceCategory().equals("studio")) {
				q.setSpaceCategory("스튜디오");
			}else if(q.getSpaceCategory().equals("party")) {
				q.setSpaceCategory("파티룸");
			}
			
			Attachment at = new QnAService().selectAttachment(qnaNo);
			
			request.setAttribute("qna", q);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/user/qna/qnaDetailView.jsp").forward(request, response);
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

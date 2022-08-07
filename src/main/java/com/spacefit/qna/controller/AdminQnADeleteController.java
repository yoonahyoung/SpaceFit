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
 * Servlet implementation class AdminQnADeleteController
 */
@WebServlet("/adminDelete.qa")
public class AdminQnADeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnADeleteController() {
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
		int result2 = new QnAService().deleteQnA(no);		
		
		if(result != 2 && result2 > 0) { // 삭제 후 목록으로 이동
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다!");
			request.getRequestDispatcher("/adminList.qa?cpage=1").forward(request, response);
					//response.sendRedirect(request.getContextPath()+"/qnaDetailView.jsp");
		}else { // 답변완료된 글이면 alertMsg 담아서 다시 문의글 상세조회 페이지로 이동
			//request.getRequestDispatcher("views/admin/qna/qnaDetailView.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/Admindetail.qa?no=" + no);
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

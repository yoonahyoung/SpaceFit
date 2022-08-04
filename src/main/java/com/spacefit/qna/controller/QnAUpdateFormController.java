package com.spacefit.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.Category;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAUpdateFormController
 */
@WebServlet("/updateForm.qa")
public class QnAUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("no"));
		
		// 카테고리목록리스트, 게시글정보, 첨부파일정보
		QnAService qService = new QnAService();
		
		ArrayList<Category> partyList = new QnAService().selectCategoryList("party");
		ArrayList<Category> practiceList = new QnAService().selectCategoryList("practice");
		ArrayList<Category> studioList = new QnAService().selectCategoryList("studio");
		
		request.setAttribute("partyList", partyList);
		request.setAttribute("practiceList", practiceList);
		request.setAttribute("studioList", studioList);
		
		QnA q = qService.selectQnA(qnaNo);
		Attachment at = qService.selectAttachment(qnaNo);
		
		// => boardUpdateForm.jsp 응답
		request.setAttribute("qna", q);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/user/qna/qnaUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

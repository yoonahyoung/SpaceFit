package com.spacefit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.notice.model.service.NoticeService;
import com.spacefit.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		String category = request.getParameter("category");
		
		
		Notice n = new Notice(noticeNo
							, category
							, noticeTitle
							, noticeContent);
		
		System.out.println(noticeNo);
		System.out.println(noticeTitle);
		System.out.println(noticeContent);
		System.out.println(category);
		System.out.println(n);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) { // 성공시 => 상세조회페이지 응답
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 공지사항 수정되었습니다!");
			response.sendRedirect(request.getContextPath()+"/adminDetail.no?no="+ noticeNo);
		}else { // 실패시 => 에러문구담아서 errorPage
			request.setAttribute("errorMsg", "공지사항 수정 실패했습니다");
			request.getRequestDispatcher("views/admin/common/errorManager.jsp").forward(request, response);
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

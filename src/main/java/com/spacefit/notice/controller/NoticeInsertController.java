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
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 
		등록하기 버튼 클릭시 /web/insert.no 요청하게끔
		
		해당 요청을 받아서 처리해주는 Servlet 클래스 만들기
			1) 인코딩처리, 요청시전달값 뽑기
			2) 요청처리 (sql문 실행)
				INSERT
				  INTO NOTICE
				  (
				    NOTICE_NO
				  , NOTICE_TITLE
				  , NOTICE_CONTENT
				  , NOTICE_WRITER
				  )
				  VALUES
				  (
				  	SEQ_NNO.NEXTVAL
				  , 사용자가입력한제목
				  , 사용자가입력한내용
				  , 로그인한 회원번호
				  )
			3) 처리된결과를 가지고 응답뷰
				> 성공시 => alert문구("성공적으로 공지사항 등록되었습니다!") 담아서 공지사항목록페이지 응답
				> 실패시 => 에러문구담아서 에러페이지 포워딩
				*/
		request.setCharacterEncoding("UTF-8");
		String userNo = request.getParameter("userNo");
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice n = new Notice(category, title, content, userNo);
		//System.out.println(n);
		int result = new NoticeService().insertNotice(userNo, n);
		
		if(result > 0) { // 성공했을 경우 => 공지사항목록페이지
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 공지사항 등록되었습니다!");
			
			response.sendRedirect(request.getContextPath()+"/adminList.no?cpage=1");
			
		}else { // 실패했을 경우 => 에러문구가 보여지는 에러페이지
			
			request.setAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
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

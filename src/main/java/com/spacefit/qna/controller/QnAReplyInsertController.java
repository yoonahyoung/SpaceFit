package com.spacefit.qna.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.common.SpacefitFileRenamePolicy;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAReplyInsertController
 */
@WebServlet("/replyInsert.qa")
public class QnAReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		// 비밀번호는 null로 초기화, 비밀글이면 생성(디폴트는 공개글)
		String password=null;
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath =  session.getServletContext().getRealPath("/resources/user/qna_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpacefitFileRenamePolicy());
			
			// 2. DB에 데이터 insert
						//    > 카테고리, 공간번호, 제목, 내용, 로그인한회원번호   => TB_QNA에 INSERT
			int refNo = Integer.parseInt(multiRequest.getParameter("refNo"));
			
			String userNo = multiRequest.getParameter("userNo");
			String spaceNo = multiRequest.getParameter("spaceNo");
			String qnaCategory = multiRequest.getParameter("qnaCategory");
			String replyTitle = "ㄴ답변입니다.";
			String replyContent = multiRequest.getParameter("replyContent");
			
			// 비밀글일시 생성
			password = multiRequest.getParameter("password");
			
			int result = 0;			
	
			//    > 첨부파일의 원본명, 수정명(업로드된파일명), 저장경로   => ATTACHMENT에 INSERT
			Attachment at = null; // 첨에는 null로 초기화, 넘어온 첨부파일이 있다면 생성
			
			// multiRequest.getOriginalFileName("키"); : 넘어온 첨부파일이 있을경우 "원본명" | 없을 경우 null
			if(multiRequest.getOriginalFileName("upfile") != null ) { // 넘어온 첨부파일이 있을 경우
				at = new Attachment();
				at.setFileOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setFileChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/user/qna_upfiles/");
			}
			
			QnA q = new QnA();
			
			if(password == null) {
				q.setQnaRefNo(refNo);
				q.setQnaCategory(qnaCategory);
				q.setQnaSpaceNo(spaceNo);
				q.setQnaTitle(replyTitle);
				q.setQnaContent(replyContent);
				q.setQnaWriter(userNo);
				result = new QnAService().insertPublicReply(q , at);
			}else {
				q.setQnaRefNo(refNo);
				q.setQnaCategory(qnaCategory);
				q.setQnaSpaceNo(spaceNo);
				q.setQnaTitle(replyTitle);
				q.setQnaContent(replyContent);
				q.setQnaWriter(userNo);
				q.setQnaPwd(password);
				result = new QnAService().insertSecretReply(q , at);
			}
			
			if(result > 0) { // 성공했을 경우 => QNA목록페이지
				
				session.setAttribute("alertMsg", "성공적으로 답변등록되었습니다!");
				
				response.sendRedirect(request.getContextPath()+"/adminList.qa?cpage=1");
				
			}else { // 실패했을 경우 => 에러문구가 보여지는 에러페이지
				
				// 첨부파일이 있었을 경우 업로드된 파일 찾아서 삭제시키기
				if(at != null) {
					new File(savePath + at.getFileChangeName()).delete();
				}
				
				request.setAttribute("errorMsg", "답변등록에 실패했습니다.");
				request.getRequestDispatcher("views/admin/common/backAlertErrorPage.jsp").forward(request, response);
				
				
			}
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

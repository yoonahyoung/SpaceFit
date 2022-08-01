package com.spacefit.review.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import com.spacefit.review.model.service.ReviewService;
import com.spacefit.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/rupdate.rv")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;				
			
			String savePath = session.getServletContext().getRealPath("/resources/user/review_upfiles/"); // 폴더안에 저장시킬 것이니까 끝에 "/" 써야함
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpacefitFileRenamePolicy());
						
			int reviewNo = Integer.parseInt(multiRequest.getParameter("reviewNo"));
			
			Review rv = new Review();			
			rv.setReviewNo(reviewNo);						
			rv.setReviewContent(multiRequest.getParameter("reviewContent"));
			rv.setReviewStar(Integer.parseInt(multiRequest.getParameter("star")));				
									
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) { 
					// 첨부파일이 존재할경우 (key값으로 첨부파일원본명이 뽑힌다면 파일존재하는거)
					// Attachment 생성 + 원본명, 수정명, 저장경로, 파일레벨 담아서
					// => list에 추가
					Attachment at = new Attachment();					
					at.setFileOriginName(multiRequest.getOriginalFileName(key));
					at.setFileChangeName(multiRequest.getFilesystemName(key)); // 실제저장된파일명
					at.setFilePath("resources/user/review_upfiles/");
					at.setRefBoardNo(rv.getReviewNo());
					
					if(i == 1) { // name=file1 대표이미지
								// Attachment setter메소드 fileLevle에 1
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
			}
			
			
			
				// 새로 넘어온 첨부파일이 없다면 at=null
				int result = new ReviewService().updateReview(rv, list);
				
				// 새로운 첨부파일O, 기존의 첨부파일 => b, fileNo가 담긴 at => review update, Attachment update
				// 새로운첨부파일O, 기존첨부파일X  => b, refBoardNo이 담긴 at => review update, Attachement update
				
				if(result > 0 ) { // 성공							
						session.setAttribute("alertMsg", "후기수정되었습니다.");
						response.sendRedirect(request.getContextPath() + "/rlist.rv?cpage=1");			
									
				}else { // 실패
					request.setAttribute("errorMsg", "후기수정에 실패했습니다.");
					request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp").forward(request, response);
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

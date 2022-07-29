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
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/rInsert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
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
			
			int bookNo = Integer.parseInt(multiRequest.getParameter("bookNo")); 
			
			Review rv = new Review(bookNo,					
								   multiRequest.getParameter("spaceNo"),
								   multiRequest.getParameter("memNo"),
								   multiRequest.getParameter("reviewContent"),
								   Integer.parseInt(multiRequest.getParameter("star"))				
					);
			
			String reviewValid = new ReviewService().selectReviewValid(rv);
			
			if(reviewValid.equals("Y")) { // 이미 해당예약번호로 유효한 리뷰를 등록했을 경우
				
				request.getSession().setAttribute("alertMsg", "이미 후기등록되어있습니다. 기존 후기를 삭제 후 다시 등록해주세요 :)");
				response.sendRedirect(request.getContextPath() + "/bdetail.bo?no=" + bookNo);
				
			}else {									
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
						
						if(i == 1) { // name=file1 대표이미지
									// Attachment setter메소드 fileLevle에 1
							at.setFileLevel(1);
						}else {
							at.setFileLevel(2);
						}
						
						list.add(at);
					}
				}
			
				// 넘어온 첨부파일 갯수만큼 list에 Attachment객체 있음
			
				int result = new ReviewService().insertReview(rv, list);
				
				if(result > 0 ) { // 성공		
					
						session.setAttribute("alertMsg", "후기등록되었습니다.");
						response.sendRedirect(request.getContextPath() + "/bdetail.bo?no=" + bookNo);			
									
				}else { // 실패
					request.setAttribute("errorMsg", "후기등록에 실패했습니다. 잠시후 다시 시도해주세요");
					request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp").forward(request, response);
				}
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

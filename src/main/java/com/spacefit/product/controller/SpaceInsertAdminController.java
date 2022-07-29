package com.spacefit.product.controller;

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
import com.spacefit.common.SpFileRenamePolicy;
import com.spacefit.product.model.service.SpaceService;
import com.spacefit.product.model.vo.Space;

/**
 * Servlet implementation class SpaceInsertAdminController
 */
@WebServlet("/adInsert.sp")
public class SpaceInsertAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceInsertAdminController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024; //10mbyte
			
			// 공간 등록 view에서 전달 받은 값
			String category = request.getParameter("category");
			String spName = request.getParameter("spName");
			int spLimit = Integer.parseInt(request.getParameter("spLimit"));
			String spContent = request.getParameter("spInfo");
			String spPic = request.getParameter("file1");
			int spPrice = Integer.parseInt(request.getParameter("spPrice"));
			
			// db에 기록할 값
			Space s = new Space();
			s.setSpaceCategory(category);
			s.setSpaceName(spName);
			s.setSpaceLimit(spLimit);
			s.setSpaceInfo(spContent);
			s.setSpacePic(spPic);
			s.setSpacePrice(spPrice);
			
			// 저장 시킬 폴더의 물리적인 경로
			String savePath = session.getServletContext().getRealPath("/resources/admin/space/" + category + "/");
			
			// 파일명 수정작업돼서 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpFileRenamePolicy());
			
			// Attachment에 여러행 insert할 데이터 뽑기
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이 존재할 경우 list에 추가
					Attachment at = new Attachment();
					at.setFileOriginName(multiRequest.getOriginalFileName(key));
					at.setFileChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/admin/space/" + category + "/");
					
					list.add(at);
				}
			}
			
			
			int result = new SpaceService().insertSpace(s, list);
			
			if(result > 0) { // 성공 => 공간목록페이지
				session.setAttribute("alertMsg", "성공적으로 공간이 추가되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adList.sp");
			}else { // 실패
				session.setAttribute("errorMsg", "공간 추가에 실패하였습니다.");
				response.sendRedirect("views/admin/common/errorManager.jsp");
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

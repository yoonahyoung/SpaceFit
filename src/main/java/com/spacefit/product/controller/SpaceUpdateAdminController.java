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
 * Servlet implementation class SpaceUpdateAdminController
 */
@WebServlet("/adUpdate.sp")
public class SpaceUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpaceUpdateAdminController() {
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
			// 저장 시킬 폴더의 물리적인 경로
			String savePath = session.getServletContext().getRealPath("/resources/admin/space_upfiles/");
			
			// 파일명 수정작업돼서 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new SpFileRenamePolicy());
			
			// 공간 수정 form에서 전달 받은 값
			int spNo = Integer.parseInt(multiRequest.getParameter("no"));
			String category = multiRequest.getParameter("category");
			String spName = multiRequest.getParameter("name");
			int spLimit = Integer.parseInt(multiRequest.getParameter("limit"));
			String spContent = multiRequest.getParameter("info");
			int spPrice = Integer.parseInt(multiRequest.getParameter("price"));
			
			// db에 수정할 값
			Space s = new Space();
			s.setSpaceNo(spNo);
			s.setSpaceCategory(category);
			s.setSpaceName(spName);
			s.setSpaceLimit(spLimit);
			s.setSpaceInfo(spContent);
			s.setSpacePrice(spPrice);
			
			
			if(multiRequest.getOriginalFileName("file1")!=null) {
				// 대표이미지가 다른 걸로 변경 됐을때(update)
				s.setSpacePic("resources/admin/space_upfiles/" + multiRequest.getFilesystemName("file1"));
				System.out.println("대표 변경");
				System.out.println("resources/admin/space_upfiles/" + multiRequest.getFilesystemName("file1"));
			}else {
				// 대표이미지가 다른 걸로 변경 안됐을때(update)
				s.setSpacePic(multiRequest.getParameter("originFile1"));
				System.out.println(multiRequest.getParameter("originFile1"));
				System.out.println("대표변경x");
			}
			
			// ------------------ 위에까지 공간수정, 밑에는 첨부파일 수정 ----------------------
			
			// Attachment에 여러행 insert할 데이터 뽑기
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=2; i<=3; i++) { // 첨부파일의 갯수만큼 돌것임
				String key = "file" + i;
				String oriKey = "originFileNo" + i;
				
				// 1) 새로 넘어온 첨부 파일 o, 기존의 파일 o
				if(multiRequest.getOriginalFileName(key) != null && multiRequest.getParameter(oriKey) != null) {
					
					Attachment at = new Attachment();
					at.setFileOriginName(multiRequest.getOriginalFileName(key));
					at.setFileChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/admin/space_upfiles/");
					// (기존의 첨부파일 번호 필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter(oriKey)));
					
					list.add(at);
				}else if(multiRequest.getOriginalFileName(key) != null && multiRequest.getParameter(oriKey) == null) {
					// 2) 새로 넘어온 첨부파일 o, 기존의 파일 x
					Attachment at = new Attachment();
					at.setFileOriginName(multiRequest.getOriginalFileName(key));
					at.setFileChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/admin/space_upfiles/");
					// (현재 게시글 번호)
					at.setRefBoardNo(spNo);
					
					list.add(at);
				}
			
		}
			
			// 새로 넘어온 첨부파일이 없었다면 at는 여전히 null
			int result = new SpaceService().updateSpace(s, list);
			// 새로운 첨부파일 x				=> s	 				=> SPACE UPDATE
			// 새로운 첨부파일 o, 기존첨부파일o	=> s, fileNo이 담긴 at	=> SPACE UPDATE, FILE UPDATE
			// 새로운 첨부파일 o, 기존첨부파일x	=> s, refBoardNo이 담긴 at => SPACE UPDATE, FILE INSERT
						
			
			if(result > 0) { // 성공 => 공간목록페이지
				session.setAttribute("alertMsg", "성공적으로 공간이 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adList.sp");
			}else {
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

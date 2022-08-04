package com.spacefit.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.qna.model.service.QnAService;
import com.spacefit.qna.model.vo.Category;
import com.spacefit.qna.model.vo.QnA;

/**
 * Servlet implementation class QnASearchController
 */
@WebServlet("/search.qa")
public class QnASearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnASearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<Category> allList = new QnAService().selectAllSpaceList();
		ArrayList<Category> partyList = new QnAService().selectCategoryList("party");
		ArrayList<Category> practiceList = new QnAService().selectCategoryList("practice");
		ArrayList<Category> studioList = new QnAService().selectCategoryList("studio");
		
		
		// 검색 결과 조회용
		String qnaCategory = request.getParameter("qnaCategory"); // 질문유형
		String spaceCategory = request.getParameter("spaceCategory"); // 공간분류
		String spaceNo = request.getParameter("spaceNo"); // 공간
		String spaceName = null;
		
		String studioSpaceNo = request.getParameter("studioSpaceNo"); // 공간
		String practiceSpaceNo = request.getParameter("practiceSpaceNo"); // 공간
		String partySpaceNo = request.getParameter("partySpaceNo"); // 공간
		
		if(!studioSpaceNo.equals("전체")) {spaceNo=studioSpaceNo;}
		if(!practiceSpaceNo.equals("전체")) {spaceNo=practiceSpaceNo;}
		if(!partySpaceNo.equals("전체")) {spaceNo=partySpaceNo;}
		
		if(spaceNo.equals("전체")) {
			spaceName ="전체";
			} else{
				spaceName = new QnAService().selectSpaceName(spaceNo);
			}
		
		
		// TB_SPACE에는 공간유형이 practice, studio, party로 되어있어서 화면에 출력하기위한 변환 작업
		String sc = "전체";
		
		if(spaceCategory.equals("practice")) {
			sc = "연습실";
		} else if(spaceCategory.equals("studio")) {
			sc = "스튜디오";
		}else if(spaceCategory.equals("party")) {
			sc = "파티룸";
		}
		

		
		String isSolved = request.getParameter("isSolved"); // 답변여부
		
		String keyword = "질문유형 [" + qnaCategory + "]   공간분류 [" + sc + "]   공간 [" + spaceName + "]   답변 [" + isSolved + "] 검색결과입니다.";
		
		boolean case1 = false; if(qnaCategory.equals("전체")) {case1 = true;}
		boolean case2 = false; if(spaceCategory.equals("전체")) {case2 = true;}
		boolean case3 = false; if(spaceNo.equals("전체")) {case3 = true;}
		boolean case4 = false; if(isSolved.equals("전체")) {case4 = true;}
		
		ArrayList<QnA> list = null;
		
		if(case1) { 
			if(case2) { 
				if(case3) { 
					if(case4) { // 전체 전체 전체 전체인 경우 1
						list = new QnAService().selectQnAListAll();
					}else {
						if(isSolved.equals("대기")) {// 전체 전체 전체 대기인 경우 2-1
							list = new QnAService().selectQnAList2Wait();
						}else {// 전체 전체 전체 완료인 경우 2-2
							list = new QnAService().selectQnAList2Solved(spaceNo);
						}
					}
				}else { 
					if(case4) { // 전체 전체 선택 전체인 경우 3
						list = new QnAService().selectQnAList3(spaceNo);
					}else {
						if(isSolved.equals("대기")) {// 전체 전체 선택 대기인 경우 4-1
							list = new QnAService().selectQnAList4Wait(spaceNo);
						}else {// 전체 전체 선택 완료인 경우 4-2
							list = new QnAService().selectQnAList4Solved(spaceNo);
						}
					}
				}
			}else { 
				if(case3) { 
					if(case4) { // 전체 선택 전체 전체인 경우 5
						list = new QnAService().selectQnAList5(spaceCategory);
					}else {
						if(isSolved.equals("대기")) {// 전체 선택 전체 대기인 경우 6-1
						list = new QnAService().selectQnAList6Wait(spaceCategory);
						}else {// 전체 선택 전체 완료인 경우 6-2
							list = new QnAService().selectQnAList6Solved(spaceCategory);
						}
					}
				}else { 
					if(case4) { // 전체 선택 선택 전체인 경우 7
						list = new QnAService().selectQnAList7(spaceCategory, spaceNo);
					}else {
						if(isSolved.equals("대기")) {// 전체 선택 선택 대기인 경우 8-1 == 전체 전체 선택 대기 4-1
							list = new QnAService().selectQnAList4Wait(spaceNo);
						}else {// 전체 선택 선택 완료인 경우 8-2 == 전체 전체 선택 완료 4-2
							list = new QnAService().selectQnAList4Solved(spaceNo);
						}
					}
				}
			}
		}
		
		if(case1 == false) { 
			if(case2) { 
				if(case3) { 
					if(case4) { // 선택 전체 전체 전체인 경우 9
						list = new QnAService().selectQnAList9(qnaCategory);
					}else {
						if(isSolved.equals("대기")) {// 선택 전체 전체 대기인 경우 10-1
							list = new QnAService().selectQnAList10Wait(qnaCategory);
						}else {// 선택 전체 전체 완료인 경우 10-2
							list = new QnAService().selectQnAList10Solved(qnaCategory);
						}
					}
				}else { 
					if(case4) { // 선택 전체 선택 전체인 경우 11
						list = new QnAService().selectQnAList11(qnaCategory, spaceNo);
					}else {
						if(isSolved.equals("대기")) {// 선택 전체 선택 대기인 경우 12-1
							list = new QnAService().selectQnAList12Wait(qnaCategory, spaceNo);
						}else {// 선택 전체 선택 완료인 경우 12-2
							list = new QnAService().selectQnAList12Solved(qnaCategory, spaceNo);
						}
					}
				}
			}else { 
				if(case3) { 
					if(case4) { // 선택 선택 전체 전체인 경우 13
						list = new QnAService().selectQnAList13(qnaCategory, spaceCategory);
					}else {
						if(isSolved.equals("대기")) {// 선택 선택 전체 대기인 경우 14-1
							list = new QnAService().selectQnAList14Wait(qnaCategory, spaceCategory);
						}else {// 선택 선택 전체 완료인 경우 14-2
							list = new QnAService().selectQnAList14Solved(qnaCategory, spaceCategory);
						}
					}
				}else { 
					if(case4) { // 선택 선택 선택 전체인 경우 15 == 선택 전체 선택 전체 11
						list = new QnAService().selectQnAList11(qnaCategory, spaceNo);
					}else {
						if(isSolved.equals("대기")) {// 선택 선택 선택 대기인 경우 16-1 == 선택 전체 선택 대기 12-1
							list = new QnAService().selectQnAList12Wait(qnaCategory, spaceNo);
						}else {// 선택 선택 선택 완료인 경우 16-2 == 선택 전체 선택 완료 12-2
							list = new QnAService().selectQnAList12Solved(qnaCategory, spaceNo);
						}
					}
				}
			}
		}
		
		request.setAttribute("allList", allList);
		request.setAttribute("partyList", partyList);
		request.setAttribute("practiceList", practiceList);
		request.setAttribute("studioList", studioList);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/qna/qnaSearchResultView.jsp").forward(request, response);
	}

	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

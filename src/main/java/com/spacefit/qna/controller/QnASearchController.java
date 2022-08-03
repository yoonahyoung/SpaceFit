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
		
		// -------- 페이징 처리 --------
		int listCount;   // 현재 총 게시글 갯수
		int currentPage; // 사용자가 보게될 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;   // 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit;  // 한 페이지당 보여질 게시글 최대갯수 (몇개 단위씩)
		
		// 위의 4개를 가지고 아래 3개의 값을 구해낼꺼임
		int maxPage;     // 가장 마지막 페이지 (총 페이지 수)
		int startPage;   // 페이징바의 시작수 
		int endPage;     // 페이징바의 끝수
		
		// * listCount : 현재 게시글 총갯수
		
		listCount = new QnAService().selectListCount();
		//System.out.println(listCount);
		
		// * currentPage : 사용자가 보게될 페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수 (몇개 단위씩)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지당 보여질 게시글의 최대 갯수 (몇개 단위씩)
		boardLimit = 10;
		maxPage = (int)Math.ceil( (double)listCount / boardLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		// startPage가 11이면 endPage는 20으로 됨 (근데 maxPage가 고작 13까지 밖에 안되면?)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// * 페이징바를 만들때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 검색 결과 조회용
		String qnaCategory = request.getParameter("qnaCategory"); // 질문유형
		String spaceCategory = request.getParameter("spaceCategory"); // 공간분류
		String spaceNo = request.getParameter("spaceNo"); // 공간
		String spaceName = null;
		if(spaceNo.equals("전체")) {
			spaceName ="전체";
			} else{
				spaceName = new QnAService().selectSpaceName(spaceNo);
			}
		String sc = "전체";
		
		if(spaceCategory.equals("practice")) {
			sc = "연습실";
		} else if(spaceCategory.equals("studio")) {
			sc = "스튜디오";
		}else if(spaceCategory.equals("party")) {
			sc = "파티룸";
		}
		
		String studioSpaceNo = request.getParameter("studioSpaceNo"); // 공간
		String practiceSpaceNo = request.getParameter("practiceSpaceNo"); // 공간
		String partySpaceNo = request.getParameter("partySpaceNo"); // 공간
		
		if(!studioSpaceNo.equals("전체")) {spaceNo=studioSpaceNo;}
		if(!practiceSpaceNo.equals("전체")) {spaceNo=practiceSpaceNo;}
		if(!partySpaceNo.equals("전체")) {spaceNo=partySpaceNo;}
		
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
						list = new QnAService().selectQnAListAll(pi);
					}else {// 전체 전체 전체 선택인 경우 2 미완
						list = new QnAService().selectQnAList2(pi, isSolved);
					}
				}else { 
					if(case4) { // 전체 전체 선택 전체인 경우 3
						list = new QnAService().selectQnAList3(pi, spaceNo);
					}else {// 전체 전체 선택 선택인 경우 4
						
					}
				}
			}else { 
				if(case3) { 
					if(case4) { // 전체 선택 전체 전체인 경우 5
						list = new QnAService().selectQnAList5(pi, spaceCategory);
					}else {// 전체 선택 전체 선택인 경우 6
						
					}
				}else { 
					if(case4) { // 전체 선택 선택 전체인 경우 7
						list = new QnAService().selectQnAList7(pi, spaceCategory, spaceNo);
					}else {// 전체 선택 선택 선택인 경우 8
						
					}
				}
			}
		}
		
		if(case1 == false) { 
			if(case2) { 
				if(case3) { 
					if(case4) { // 선택 전체 전체 전체인 경우 9
						list = new QnAService().selectQnAList9(pi, qnaCategory);
					}else {// 선택 전체 전체 선택인 경우 10
						
					}
				}else { 
					if(case4) { // 선택 전체 선택 전체인 경우 11
						list = new QnAService().selectQnAList11(pi, qnaCategory, spaceNo);
					}else {// 선택 전체 선택 선택인 경우 12
						
					}
				}
			}else { 
				if(case3) { 
					if(case4) { // 선택 선택 전체 전체인 경우 13
						list = new QnAService().selectQnAList13(pi, qnaCategory, spaceCategory);
					}else {// 선택 선택 전체 선택인 경우 14
						
					}
				}else { 
					if(case4) { // 선택 선택 선택 전체인 경우 15
						list = new QnAService().selectQnAList15(pi, qnaCategory, spaceCategory, spaceNo);
					}else {// 선택 선택 선택 선택인 경우 16 미완
						list = new QnAService().selectQnAList16(pi, qnaCategory, spaceCategory, spaceNo, isSolved);
					}
				}
			}
		}
		
		request.setAttribute("allList", allList);
		request.setAttribute("partyList", partyList);
		request.setAttribute("practiceList", practiceList);
		request.setAttribute("studioList", studioList);
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("pi", pi);
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

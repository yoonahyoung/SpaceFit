package com.spacefit.product.model.service;

import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.product.model.dao.SpaceDao;
import com.spacefit.product.model.vo.Space;
import com.spacefit.qna.model.dao.QnADao;
import com.spacefit.qna.model.vo.QnA;
import com.spacefit.reservation.model.vo.Book;
import com.spacefit.review.model.vo.Review;

public class SpaceService {
	
	// 공간 페이징바
	public int selectListCount(String selectSp) {
		Connection conn = getConnection();
		int listCount = new SpaceDao().selectListCount(conn, selectSp);
		close(conn);
		return listCount;
	}
	
	// 공간 리스트 불러오기
	public ArrayList<Space> selectList() {
		Connection conn = getConnection();
		ArrayList<Space> list = new SpaceDao().selectList(conn);
		close(conn);
		return list;
	}
	
	// 사용자 인기공간 불러오기
	public ArrayList<Space> selectTopList(){
		Connection conn = getConnection();
		ArrayList<Space> topList = new SpaceDao().selectTopList(conn);
		close(conn);
		return topList;
	}

	// 사용자 공간 상세보기
	public Space spaceDetailView(int spNo) {
		Connection conn = getConnection();
		Space s = new SpaceDao().spaceDetailView(conn, spNo);
		close(conn);
		return s;
	}
	
	// 관리자 공간 리스트 불러오기
	public ArrayList<Space> selectAdminList(PageInfo pi, String selectSp) {
		Connection conn = getConnection();
		ArrayList<Space> list = new SpaceDao().selectAdminList(conn, pi, selectSp);
		close(conn);
		return list;
	}
	
	// 관리자 공간 추가
	public int insertSpace(Space s, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		// 추가파일x
		int result1 = new SpaceDao().insertSpace(conn, s, list);
		// 추가파일o
		int result2 = new SpaceDao().insertAttach(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	// 관리자 추가사진 불러오기
	public ArrayList<Attachment> selectAttach(int spNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new SpaceDao().selectAttach(conn, spNo);
		close(conn);
		
		return list;
	}
	
	// 관리자 공간 수정
	public int updateSpace(Space s, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new SpaceDao().updateSpace(conn, s);
		
		int result2 = 1;
		for(int i=0; i<list.size(); i++) { 			
			if(!list.isEmpty() && list.get(i).getFileNo() != 0) {
				// 새로 넘어온 첨부파일 o, 기존의 파일 o
				result2 = new SpaceDao().updateFile(conn, list.get(i));
			}else if(!list.isEmpty() && list.get(i).getRefBoardNo() != 0) {
				// 새로 넘어온 첨부파일 o, 기존의 파일 x
				result2 = new SpaceDao().insertNewFile(conn, list.get(i));
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}

	// 관리자 공간 삭제
	public int deleteSpace(int spNo) {
		Connection conn = getConnection();
		int result = new SpaceDao().deleteSpace(conn, spNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Book> selectCalBook(int spNo, String date) {
		Connection conn = getConnection();
		ArrayList<Book> list = new SpaceDao().selectCalBook(conn, spNo, date);
		close(conn);
		return list;
	}
	
	// 검색결과 리스트
	public ArrayList<Space> searchResultList(String keyword) {
		Connection conn = getConnection();
		ArrayList<Space> list = new SpaceDao().searchResultList(conn, keyword);
		close(conn);
		return list;
	}

	// 상품 상세페이지에서 QnA리스트 불러오기
	public ArrayList<QnA> selectQnAList(PageInfo pi, int spNo) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new SpaceDao().selectQnAList(conn, pi, spNo);
		close(conn);
		
		return list;
	}
	
	// 상품 상세페이지 QnA리스트 페이징바
		public int selectListQnACount(int spNo) {
			Connection conn = getConnection();
			int listCount = new SpaceDao().selectListQnACount(conn, spNo);
			close(conn);
			return listCount;
		}

}

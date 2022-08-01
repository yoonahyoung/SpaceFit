package com.spacefit.product.model.service;

import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.product.model.dao.SpaceDao;
import com.spacefit.product.model.vo.Space;
import com.spacefit.reservation.model.vo.Book;
import com.spacefit.review.model.vo.Review;

public class SpaceService {
	
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

}

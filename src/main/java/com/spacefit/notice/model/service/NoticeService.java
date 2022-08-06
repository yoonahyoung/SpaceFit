package com.spacefit.notice.model.service;

import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.notice.model.dao.NoticeDao;
import com.spacefit.notice.model.vo.FAQ;
import com.spacefit.notice.model.vo.Notice;
import com.spacefit.notice.model.vo.Terms;

public class NoticeService {
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		close(conn);
		
		return list;
	}
	public int insertNotice(String userNo, Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// FAQ
	public ArrayList<FAQ> selectFAQList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<FAQ> list = new NoticeDao().selectFAQList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<FAQ> selectFAQUserList() {
		Connection conn = getConnection();
		ArrayList<FAQ> list = new NoticeDao().selectFAQUserList(conn);
		close(conn);
		return list;
	}
	
	// -------------- admin ------------------ //
	
	// 이용약관 목록 조회
	public ArrayList<Terms> adminTermsList(){
		Connection conn = getConnection();
		ArrayList<Terms> list = new NoticeDao().adminTermsList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Terms> adminTermsYList(){
		Connection conn = getConnection();
		ArrayList<Terms> list = new NoticeDao().adminTermsYList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Terms> adminTermsNList(){
		Connection conn = getConnection();
		ArrayList<Terms> list = new NoticeDao().adminTermsNList(conn);
		close(conn);
		return list;
	}
	
	// 이용약관 등록
	public int adminInsertTerms(Terms t) {
		Connection conn = getConnection();
		int result = new NoticeDao().adminInsertTerms(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 이용약관 상세페이지
	public Terms adminSelectTerms(int termsNo) {
		Connection conn = getConnection();
		
		Terms t = new NoticeDao().adminSelectTerms(conn, termsNo);
		close(conn);
		return t;
	}
	
	// 이용약관 수정
	public int adminUpdateTerms(Terms t) {
		Connection conn = getConnection();
		int result = new NoticeDao().adminUpdateTerms(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 이용약관 삭제
	public int adminDeleteTerms(int termsNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().adminDeleteTerms(conn, termsNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public FAQ adminDetailFAQ(int faNo) {
		Connection conn = getConnection();
		FAQ faq = new NoticeDao().adminDetailFAQ(conn, faNo);
		close(conn);
		return faq;
	}
	
	public int adminInsertFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = new NoticeDao().adminInsertFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int adminUpdateFAQ(FAQ f) {
		Connection conn = getConnection();
		int result = new NoticeDao().adminUpdateFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public ArrayList<Terms> selectTerm() {
		Connection conn = getConnection();
		ArrayList<Terms> tList =  new NoticeDao().adminTermsList(conn);
		close(conn);
		return tList;
	}
}





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
	
	
	// -------------- admin ------------------ //
	
	public ArrayList<Terms> adminTermsList(){
		Connection conn = getConnection();
		ArrayList<Terms> list = new NoticeDao().adminTermsList(conn);
		close(conn);
		return list;
	}
	
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
	
	public FAQ adminSelectFAQ(int faNo) {
		Connection conn = getConnection();
		FAQ faq = new NoticeDao().adminSelectFAQ(conn, faNo);
		close(conn);
		return faq;
	}
}

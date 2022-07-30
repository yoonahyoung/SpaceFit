package com.spacefit.notice.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.notice.model.dao.NoticeDao;
import com.spacefit.notice.model.vo.Notice;

public class NoticeService {
	public ArrayList<Notice> selectNoticeList(){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
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
}

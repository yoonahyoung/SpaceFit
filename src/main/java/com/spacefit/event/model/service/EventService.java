package com.spacefit.event.model.service;

import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;
import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.event.model.dao.EventDao;
import com.spacefit.event.model.vo.Banner;

public class EventService {
	
	public ArrayList<Banner> selectBannerList(){
		Connection conn = getConnection();
		ArrayList<Banner> list = new EventDao().selectBannerList(conn);
		close(conn);
		return list;
	}
	
	public int adminInsertBanner(Banner b){
		Connection conn = getConnection();
		int result = new EventDao().adminInsertBanner(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 배너 상세조회 
	public Banner selectBannerDetail(int banNo) {
		Connection conn = getConnection();
		Banner b = new EventDao().selectBannerDetail(conn, banNo);
		close(conn);
		return b;
		
	}
	
	// 배너 수정
	public int adminUpdateBanner(Banner b){
		Connection conn = getConnection();
		int result = new EventDao().adminUpdateBanner(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

}

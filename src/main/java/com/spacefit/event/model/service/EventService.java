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
	
	

}

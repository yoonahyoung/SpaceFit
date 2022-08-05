package com.spacefit.mem.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;
import com.spacefit.mem.model.dao.ReportDao;
import com.spacefit.mem.model.vo.Report;

public class ReportService {
	
	public ArrayList<Report> selectReportList(){
		
		Connection conn = getConnection();
		ArrayList<Report> rptList = new ReportDao().selectReportList();
		close(conn);
		return rptList;
		
	}
	
	public int reportCommentReview(Report rpt) {
		Connection conn = getConnection();
		int result = new ReportDao().reportCommentReview(conn, rpt);
		
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
			
			
	}
	
	public ArrayList<Report> adminSelectList(String selectSearch, String selectorderBy){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().adminSelectList(conn, selectSearch, selectorderBy);
		close(conn);
		return list;
	}
	
	public int todayRvCount() {
		Connection conn = getConnection();
		int todayRvCount = new ReportDao().todayRvCount(conn);
		close(conn);
		return todayRvCount;
	}
	
	public int totalRvCount() {
		Connection conn = getConnection();
		int totalRvCount = new ReportDao().totalRvCount(conn);
		close(conn);
		return totalRvCount;
	}
	
	public int todayCmCount() {
		Connection conn = getConnection();
		int todayCmCount = new ReportDao().todayCmCount(conn);
		close(conn);
		return todayCmCount;
	}
	
	public int totalCmCount() {
		Connection conn = getConnection();
		int totalCmCount = new ReportDao().totalCmCount(conn);
		close(conn);
		return totalCmCount;
	}
	
	public String maxMemId() {
		Connection conn = getConnection();
		String maxMemId = new ReportDao().maxMemId(conn);
		close(conn);
		return maxMemId;
	}
	

}

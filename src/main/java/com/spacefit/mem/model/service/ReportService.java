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
	
	public ArrayList<Report> adminSelectList(String selectSearch){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().adminSelectList(conn, selectSearch);
		close(conn);
		return list;
	}
	

}

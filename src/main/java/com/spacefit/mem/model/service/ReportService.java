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
	

}

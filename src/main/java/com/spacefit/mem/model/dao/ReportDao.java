package com.spacefit.mem.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.spacefit.common.JDBCTemplate.*;

import com.spacefit.mem.model.vo.Report;

public class ReportDao {

	private Properties prop = new Properties();
	
	public ReportDao() {
		String filePath = ReportDao.class.getResource("/db/sql/report-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Report> selectReportList(){
		ArrayList<Report> rvList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportList");
		
		
		return rvList;
	}
	
	public int reportCommentReview(Connection conn,Report rpt) {
		// insert => int (처리된행수)
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("reportCommentReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rpt.getMemNo());
			pstmt.setInt(2, rpt.getRptMemNo());
			pstmt.setInt(3, rpt.getRptReasonNo());
			pstmt.setInt(4, rpt.getRptRefNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
}

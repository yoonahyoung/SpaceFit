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
	
	public ArrayList<Report> adminSelectList(Connection conn, String selectSearch, String selectorderBy){
		// select => ResultSet => ArrayList<Report>
		ArrayList<Report> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminSelectList1");
		sql += selectSearch;
		sql += prop.getProperty("adminSelectList2");
		sql += selectorderBy;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list.add(new Report( rset.getString("RPT_MEM_ID"),
 									 rset.getString("category"),
									 rset.getInt("RPT_REF_NO"),
									 rset.getInt("count"),
									 rset.getString("RV_STATUS"),
									 rset.getString("COM_STATUS")
						));
			}
			
			//System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	// 오늘 후기신고건수
	public int todayRvCount(Connection conn) {
		// select => ResultSet (int)
		int todayRvCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("todayRvCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayRvCount = rset.getInt("TODAY_REVIEW_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return todayRvCount;				
				
	}
	
	// 총 후기신고건수
	public int totalRvCount(Connection conn) {
		// select => ResultSet (int)
		int totalRvCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("totalRvCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalRvCount = rset.getInt("TOTAL_REVIEW_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return totalRvCount;				
				
	}
	
	// 오늘 댓글 신고 건수
	public int todayCmCount(Connection conn) {
		// select => ResultSet (int)
		int todayCmCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("todayCmCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayCmCount = rset.getInt("TODAY_COMMENT_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return todayCmCount;				
				
	}
	
	// 총 댓글 신고 건수
	public int totalCmCount(Connection conn) {
		// select => ResultSet (int)
		int totalCmCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("totalCmCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCmCount = rset.getInt("TOTAL_COMMECT_COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return totalCmCount;				
				
	}
	
	public String maxMemId(Connection conn) {
		String maxMemId = "";
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("maxMemId");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				maxMemId = rset.getString("MEM_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return maxMemId;
	}
	
	
}

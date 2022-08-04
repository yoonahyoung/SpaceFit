package com.spacefit.review.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.review.model.vo.Comment;

public class CommentDao {
	
	private Properties prop = new Properties();
	
	public CommentDao() {
		try {
			prop.loadFromXML(new FileInputStream(CommentDao.class.getResource("/db/sql/comment-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Comment> selectComList(Connection conn, int rvNo) {
		
		ArrayList<Comment> comList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectComList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				comList.add(new Comment(
							rset.getInt("com_no"),
							rset.getInt("rv_no"),
							rset.getInt("mem_no"),
							rset.getString("mem_id"),
							rset.getString("com_content"),
							rset.getDate("com_enroll_date"),
							rset.getDate("com_modify_date"),
							rset.getInt("com_parent_no"),
							rset.getString("com_status")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return comList;
	}
	
	
	public int insertComment(Connection conn, Comment c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getRvNo());
			pstmt.setInt(2, c.getMemNo());
			pstmt.setInt(3, c.getMemNo());
			pstmt.setString(4, c.getComContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteComment(Connection conn, int comNo, int memNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			pstmt.setInt(2, memNo);
			result = pstmt.executeUpdate();
			//System.out.println("다오에서 출력해보자 뎃글번호 : " + comNo + "  멤버번호 : " + memNo + "결과 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateComment(Connection conn, int comNo, int memNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			pstmt.setInt(2, memNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
	
	
	
}

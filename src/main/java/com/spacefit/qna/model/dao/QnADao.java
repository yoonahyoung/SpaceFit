package com.spacefit.qna.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.notice.model.vo.Notice;
import com.spacefit.qna.model.vo.Category;
import com.spacefit.qna.model.vo.QnA;



public class QnADao {
	private Properties prop = new Properties();
	
	public QnADao() {
		try {
			prop.loadFromXML(new FileInputStream( QnADao.class.getResource("/db/sql/qna-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<QnA> selectQnAList(Connection conn, PageInfo pi){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt("QNA_NO"),
									rset.getString("QNA_CATEGORY"),
									rset.getString("SPACE_CATEGORY"),
									rset.getString("SPACE_NAME"),
									rset.getString("QNA_TITLE"),
									rset.getString("MEM_ID"),
									rset.getInt("QNA_COUNT"),
									rset.getDate("QNA_CREATE_DATE")
									));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectListCount(Connection conn) {
		// select문 => ResultSet(숫자한개) => int
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Category> selectCategoryList(Connection conn, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Category>
		ArrayList<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceCategory);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("SPACE_NO"),
									  rset.getString("SPACE_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}
	
	public int insertPublicQnA(Connection conn, QnA q) {
		// board에 insert => 처리된 행수 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPublicQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaCategory());
			pstmt.setString(2, q.getQnaSpaceNo());
			pstmt.setString(3, q.getQnaTitle());
			pstmt.setString(4, q.getQnaContent());
			pstmt.setString(5, q.getQnaWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertSecretQnA(Connection conn, QnA q) {
		// board에 insert => 처리된 행수 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSecretQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQnaCategory());
			pstmt.setString(2, q.getQnaSpaceNo());
			pstmt.setString(3, q.getQnaTitle());
			pstmt.setString(4, q.getQnaContent());
			pstmt.setString(5, q.getQnaWriter());
			pstmt.setString(6, q.getQnaPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		// attachment에 insert => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getFileOriginName());
			pstmt.setString(2, at.getFileChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int increaseCount(Connection conn, int qnaNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  qnaNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public QnA selectQnA(Connection conn, int qnaNo) {
		// select문 => ResultSet (한행) => Notice
		QnA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA(rset.getInt("QNA_NO"),
						rset.getString("QNA_CATEGORY"),
						rset.getString("SPACE_CATEGORY"),
						rset.getString("SPACE_NAME"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getString("MEM_ID"),
						rset.getInt("QNA_COUNT"),
						rset.getDate("QNA_CREATE_DATE")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}
	
	public Attachment selectAttachment(Connection conn, int qnaNo) {
		// attachment로부터 select => ResultSet(한행) => Attachment
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setFileOriginName(rset.getString("FILE_ORIGIN_NAME"));
				at.setFileChangeName(rset.getString("FILE_CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
	
	}
}

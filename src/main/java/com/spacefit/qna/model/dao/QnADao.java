package com.spacefit.qna.model.dao;

import static com.spacefit.common.JDBCTemplate.*;

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
	
	public String selectSpaceName(Connection conn, String spaceNo) {
		// select문 => ResultSet(숫자한개) => int
		String spaceName = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSpaceName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				spaceName = rset.getString("SPACE_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return spaceName;
		
	}
	
	public ArrayList<Category> selectAllSpaceList(Connection conn){
		// select문 => ResultSet(여러행) => ArrayList<Category>
		ArrayList<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllSpaceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	public int insertPublicReply(Connection conn, QnA q) {
		// board에 insert => 처리된 행수 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPublicReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getQnaRefNo()-1);
			pstmt.setString(2, q.getQnaCategory());
			pstmt.setString(3, q.getQnaSpaceNo());
			pstmt.setString(4, q.getQnaTitle());
			pstmt.setString(5, q.getQnaContent());
			pstmt.setString(6, q.getQnaWriter());
			pstmt.setInt(7, q.getQnaRefNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertSecretReply(Connection conn, QnA q) {
		// board에 insert => 처리된 행수 
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSecretReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQnaRefNo()-1);
			pstmt.setString(2, q.getQnaCategory());
			pstmt.setString(3, q.getQnaSpaceNo());
			pstmt.setString(4, q.getQnaTitle());
			pstmt.setString(5, q.getQnaContent());
			pstmt.setString(6, q.getQnaWriter());
			pstmt.setInt(7, q.getQnaRefNo());
			pstmt.setString(8, q.getQnaPwd());
			
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
	
	public int insertRelpyAttachment(Connection conn, Attachment at, int refNo) {
		// attachment에 insert => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRelpyAttachment");
		int refBno = refNo -1; // 답변글 번호(ex 58)는 참조번호 -1(ex 57) 이니까
								 // 첨부파일 참조글번호(REF_BNO) == 답변글번호 == 참조번호 -1
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, refBno);
			pstmt.setString(2, at.getFileOriginName());
			pstmt.setString(3, at.getFileChangeName());
			pstmt.setString(4, at.getFilePath());
			
			
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
						rset.getString("SPACE_NO"),
						rset.getString("SPACE_NAME"),
						rset.getString("QNA_TITLE"),
						rset.getString("QNA_CONTENT"),
						rset.getString("MEM_ID"),
						rset.getInt("QNA_GROUP"),
						rset.getInt("QNA_COUNT"),
						rset.getDate("QNA_CREATE_DATE"),
						rset.getString("QNA_PWD"),
						rset.getString("QNA_PUBLIC")
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
	
	public int isSolved(Connection conn, int qnaNo) {
		// select문 => ResultSet(숫자한개) => int
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("isSolved");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  qnaNo);
			pstmt.setInt(2,  qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int changeSolvedStatus(Connection conn, int refNo) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeSolvedStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, refNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int selectMyListCount(Connection conn, int memNo) {
		// select문 => ResultSet(숫자한개) => int
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  memNo);
			pstmt.setInt(2,  memNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}
	//내 글 리스트 + 답글 조회
	public ArrayList<QnA> selectMyQnAList(Connection conn, PageInfo pi, int memNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyQnAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, memNo);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
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
	
	public int deleteQnA(Connection conn, int qnaNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteQnA");
		
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
	
	// 여기서부터 검색 메소드
	// 전체 전체 전체 전체 1
	public ArrayList<QnA> selectQnAListAll(Connection conn){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAListAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
	//전체 전체 전체 답변대기 2-1
	public ArrayList<QnA> selectQnAList2Wait(Connection conn){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList2Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);

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
	
	//전체 전체 전체 답변완료 2-2
	public ArrayList<QnA> selectQnAList2Solved(Connection conn, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList2Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

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
	
	// 전체 전체 선택 전체 3
	public ArrayList<QnA> selectQnAList3(Connection conn, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList3");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceNo);
			
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
	// 전체 전체 선택 대기 4-1
	public ArrayList<QnA> selectQnAList4Wait(Connection conn, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList4Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceNo);
			
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
	// 전체 전체 선택 완료 4-2
	public ArrayList<QnA> selectQnAList4Solved(Connection conn, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList4Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceNo);
			pstmt.setString(2, spaceNo);
			
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
	// 전체 선택 전체 전체 5
	public ArrayList<QnA> selectQnAList5(Connection conn, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList5");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceCategory);
			
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
	// 전체 선택 전체 대기 6-1
	public ArrayList<QnA> selectQnAList6Wait(Connection conn, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList6Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceCategory);
			
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
	// 전체 선택 전체 완료 6-2
	public ArrayList<QnA> selectQnAList6Solved(Connection conn, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList6Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceCategory);
			pstmt.setString(2, spaceCategory);
			
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
	// 전체 선택 선택 전체 7
	public ArrayList<QnA> selectQnAList7(Connection conn, String spaceCategory, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList7");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, spaceCategory);
			pstmt.setString(2, spaceNo);
			
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
	// 선택 전체 전체 전체 9
	public ArrayList<QnA> selectQnAList9(Connection conn, String qnaCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList9");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			
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
	// 선택 전체 전체 대기 10-1
	public ArrayList<QnA> selectQnAList10Wait(Connection conn, String qnaCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList10Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			
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
	// 선택 전체 전체 완료 10-2
	public ArrayList<QnA> selectQnAList10Solved(Connection conn, String qnaCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList10Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, qnaCategory);
			
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
	// 선택 전체 선택 전체 11
	public ArrayList<QnA> selectQnAList11(Connection conn, String qnaCategory, String spaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList11");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, spaceNo);
			
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
	// 선택 전체 선택 대기 12-1
	public ArrayList<QnA> selectQnAList12Wait(Connection conn, String spaceCategory, String SpaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList12Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceCategory);
			pstmt.setString(2, SpaceNo);
			
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
	// 선택 전체 선택 완료 12-2
	public ArrayList<QnA> selectQnAList12Solved(Connection conn, String qnaCategory, String SpaceNo){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList12Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, SpaceNo);
			pstmt.setString(3, qnaCategory);
			pstmt.setString(4, SpaceNo);
			
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

	// 선택 전체 선택 전체 13
	public ArrayList<QnA> selectQnAList13(Connection conn, String qnaCategory, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList13");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, spaceCategory);
			
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
	// // 선택 선택 전체 대기 14-1
	public ArrayList<QnA> selectQnAList14Wait(Connection conn, String qnaCategory, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList14Wait");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, spaceCategory);
			
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
	// // 선택 선택 전체 완료 14-2
	public ArrayList<QnA> selectQnAList14Solved(Connection conn, String qnaCategory, String spaceCategory){
		// select문 => ResultSet(여러행) => ArrayList<Notice>객체
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList14Solved");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qnaCategory);
			pstmt.setString(2, spaceCategory);
			pstmt.setString(3, qnaCategory);
			pstmt.setString(4, spaceCategory);
			
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

}
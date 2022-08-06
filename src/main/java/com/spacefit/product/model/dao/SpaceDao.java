package com.spacefit.product.model.dao;

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
import com.spacefit.mem.model.dao.MemberDao;
import com.spacefit.product.model.vo.Space;
import com.spacefit.qna.model.vo.QnA;
import com.spacefit.reservation.model.vo.Book;

public class SpaceDao {
	
	private Properties prop = new Properties();
	
	public SpaceDao() {
		String filePath = MemberDao.class.getResource("/db/sql/space-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String selectSp) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount") + selectSp;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Space> selectList(Connection conn) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Space(rset.getInt("space_no"),
								   rset.getString("space_name"),
								   rset.getInt("space_limit"),
								   rset.getString("space_category"),
								   rset.getString("space_pic"),
								   rset.getDate("space_en_date"),
								   rset.getInt("space_price")
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
	
	public ArrayList<Space> selectTopList(Connection conn){
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTopList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Space(rset.getInt("space_no"),
								   rset.getString("space_name"),
								   rset.getInt("space_limit"),
								   rset.getString("space_category"),
								   rset.getString("space_pic"),
								   rset.getInt("space_price")
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

	public Space spaceDetailView(Connection conn, int spNo) {
		Space s = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("spaceDetailView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				s = new Space(rset.getInt("space_no"),
							  rset.getString("space_name"),
							  rset.getInt("space_limit"),
							  rset.getString("space_info"),
							  rset.getString("space_category"),
							  rset.getString("space_pic"),
							  rset.getDate("space_en_date"),
							  rset.getInt("space_price"));
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return s;
	}
	
	public ArrayList<Space> selectAdminList(Connection conn, PageInfo pi, String selectSp) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql1 = prop.getProperty("selectAdminList1");
		String sql2 = prop.getProperty("selectAdminList2");
		String sql = sql1 + selectSp + sql2;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Space(rset.getInt("space_no"),
								   rset.getString("space_name"),
								   rset.getInt("space_limit"),
								   rset.getString("space_category"),
								   rset.getString("space_pic"),
								   rset.getDate("space_en_date"),
								   rset.getInt("space_price")
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

	public int insertSpace(Connection conn, Space s, ArrayList<Attachment> at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSpace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getSpaceName());
			pstmt.setInt(2, s.getSpaceLimit());
			pstmt.setString(3, s.getSpaceInfo());
			pstmt.setString(4, s.getSpaceCategory());
			pstmt.setString(5, s.getSpacePic());
			pstmt.setInt(6, s.getSpacePrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttach(Connection conn, ArrayList<Attachment> list) {
		System.out.println(list);
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttach");
		
		try {
			if(list.isEmpty()) {
				result = 1;
			}else {
				for(int i=0; i<list.size(); i++) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, list.get(i).getFileOriginName());
					pstmt.setString(2, list.get(i).getFileChangeName());
					pstmt.setString(3, list.get(i).getFilePath());
					
					result = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectAttach(Connection conn, int spNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = new ArrayList<>();
		String sql = prop.getProperty("selectAttach");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getInt("file_no"),
									  rset.getInt("ref_bno"),
									  rset.getString("file_origin_name"),
									  rset.getString("file_change_name"),
									  rset.getString("file_path")
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

	public int deleteSpace(Connection conn, int spNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSpace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int updateSpace(Connection conn, Space s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateSpace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getSpaceName());
			pstmt.setInt(2, s.getSpaceLimit());
			pstmt.setString(3, s.getSpaceInfo());
			pstmt.setString(4, s.getSpaceCategory());
			pstmt.setString(5, s.getSpacePic());
			pstmt.setInt(6, s.getSpacePrice());
			pstmt.setInt(7, s.getSpaceNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateFile(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getFileOriginName());
			pstmt.setString(2, at.getFileChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
				
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int insertNewFile(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBoardNo());
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
	
	
	
	
	
	public ArrayList<Book> selectCalBook(Connection conn, int spNo, String date) {
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCalBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			pstmt.setString(2, date);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book b = new Book();
				b.setBookNo(rset.getInt("book_no"));
				b.setBookDate(rset.getString("book_date"));
				b.setBookInTime(rset.getString("book_in"));
				b.setBookOutTime(rset.getString("book_out"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 검색결과 리스트
	public ArrayList<Space> searchResultList(Connection conn, String keyword) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchResultList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Space(rset.getInt("space_no"),
								   rset.getString("space_name"),
								   rset.getInt("space_limit"),
								   rset.getString("space_category"),
								   rset.getString("space_pic"),
								   rset.getDate("space_en_date"),
								   rset.getInt("space_price")
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

	//상품 상세 페이지에서 QnA불러오기
	public ArrayList<QnA> selectQnAList(Connection conn, PageInfo pi, int spNo) {
		ArrayList<QnA> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQnAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, spNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				QnA q = new QnA();
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaWriter(rset.getString("mem_id"));
				q.setQnaContent(rset.getString("qna_content"));
				q.setQnaCreateDate(rset.getDate("qna_create_date"));
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}

	//상품 상세 페이지에서 QnA 페이징
	public int selectListQnACount(Connection conn, int spNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListQnACount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, spNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	
	
}

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

	public ArrayList<Space> selectList(Connection conn, PageInfo pi) {
		ArrayList<Space> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
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

	
	
	
	
}

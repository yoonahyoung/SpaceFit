package com.spacefit.mem.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Love;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.review.model.dao.CommentDao;

public class MemberDao {
   
   private Properties prop = new Properties();
   
 
   
   
   public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
   
   public Member loginMember(Connection conn, String memId, String memPwd) {
      
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("loginMember");
      
      try {
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memId);
         pstmt.setString(2, memPwd);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            m = new Member(
                  rset.getInt("mem_no"),
                  rset.getInt("gr_no"),
                  rset.getString("mem_id"),
                  rset.getString("mem_pwd"),
                  rset.getString("mem_name"),
                  rset.getString("mem_idno"),
                  rset.getString("mem_phone"),
                  rset.getString("mem_mail"),
                  rset.getString("mem_profile"),
                  rset.getDate("mem_enroll_date"),
                  rset.getDate("mem_modify_date"),
                  rset.getString("mem_status"),
                  rset.getString("mem_adm_flag")
                  );   
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
         close(conn);
      }
      return m;
   }
   
   
   public int idCheck(Connection conn, String memId) {
      
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("idCheck");
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memId);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            count = rset.getInt("count");
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }   
      // System.out.println(count);
      return count;
   }
   
   
   public int insertMember(Connection conn, Member m) {
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertMember");
      int result = 0;
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, m.getMemId());
         pstmt.setString(2, m.getMemPwd());
         pstmt.setString(3, m.getMemName());
         pstmt.setString(4, m.getMemIdNo());
         pstmt.setString(5, m.getMemPhone());
         pstmt.setString(6, m.getMemMail());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
      
   }
   
   public Member idSearch(Connection conn, Member m) {
      
      String memId = "";
      Member searchM = new Member();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("idSearch");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, m.getMemName());
         pstmt.setString(2, m.getMemPhone());
         rset = pstmt.executeQuery();
         if(rset.next()) {
            memId = rset.getString("mem_id");
            searchM.setMemId(memId);
            searchM.setMemName(m.getMemName());
            searchM.setMemPhone(m.getMemPhone());
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
         close(rset);
      }
      return searchM;
      
   }
   
   public int updateMember(Connection conn, Member m) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("updateMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, m.getMemName());
         pstmt.setString(2, m.getMemMail());
         pstmt.setString(3, m.getMemPhone());
         pstmt.setString(4, m.getMemId());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      System.out.println(result);
      return result;
   }
   
   public Member selectMember(Connection conn, String memId) {
      
      Member m = null;
      ResultSet rset = null;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("selectMember");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memId);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            m = new Member(rset.getInt("mem_no"),
                        rset.getInt("gr_no"),
                        rset.getString("mem_id"),
                        rset.getString("mem_pwd"),
                        rset.getString("mem_name"),
                        rset.getString("mem_idno"),
                        rset.getString("mem_phone"),
                        rset.getString("mem_mail"),
                        rset.getString("mem_profile"),
                        rset.getDate("mem_enroll_date"),
                        rset.getDate("mem_modify_date"),
                        rset.getString("mem_status"),
                        rset.getString("mem_adm_flag")
                        );
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
   
      return m;
      
   }

   public int updatePwdMember(Connection conn, String memId, String memPwd, String updatePwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
   public String selectGrade(Connection conn, String memId) {
	   
	   String grName = null;
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("selectGrade");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			grName = rset.getString("gr_name");
		}
	   } catch (SQLException e) {
		e.printStackTrace();
	   } finally {
		   close(rset);
		   close(pstmt);
	   }
	   
	   return grName;
	   
   }
   
   public ArrayList<Mcp> selectCouponList(Connection conn, int memNo) {
	   
	   ArrayList<Mcp> list = new ArrayList<>();
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("selectCouponList");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			list.add( new Mcp(rset.getString("cp_name"),
							  rset.getInt("cp_discount"),
							  rset.getString("mcp_use"),
							  rset.getDate("mcp_end_date")
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
   
   public int insertMemCoupon(Connection conn, String cpCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setString(1, cpName);
//			pstmt.setInt(2, cpDiscount);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
   public int updateMemberStatus(Connection conn, String memId, String memPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
   public ArrayList<Mcp> selectDownCoupon(Connection conn){
		
		ArrayList<Mcp> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDownCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Mcp(rset.getInt("cp_no"),
								 rset.getString("cp_name"),
								 rset.getInt("cp_discount"),
								 rset.getDate("cp_end_date")
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
   
   public int updateProfile(Connection conn, String memProfile, String memId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memProfile);
			pstmt.setString(2, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
   public int insertCart(Connection conn, Cart cart) {
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("insertCart");;
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cart.getMemNo());
		pstmt.setInt(2, cart.getSpaceNo());
		pstmt.setInt(3, cart.getCartLimit());
		pstmt.setString(4, cart.getCartDate());
		pstmt.setString(5, cart.getCartIn());
		pstmt.setString(6, cart.getCartOut());
		pstmt.setString(7, cart.getCartParking());
		pstmt.setString(8, cart.getCartAnimal());
		pstmt.setString(9, cart.getCartStand());
		pstmt.setString(10, cart.getCartChair());
		pstmt.setInt(11, cart.getCartPrice());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	   return result;
   }
   
   public ArrayList<Cart> selectCartList(Connection conn, int memNo){
		
		ArrayList<Cart> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cart(
							rset.getInt("mem_no"),
							rset.getInt("space_no"),
							rset.getInt("cart_limit"),
							rset.getString("cart_date"),
							rset.getString("cart_in"),
							rset.getString("cart_out"),
							rset.getString("cart_parking"),
							rset.getString("cart_animal"),
							rset.getString("cart_stand"),
							rset.getString("cart_chair"),
							rset.getInt("cart_price"),
							rset.getString("space_name"),
							rset.getInt("space_limit"),
							rset.getString("space_pic")
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
   
   public int updateCart(Connection conn, Cart c) {
	   
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("updateCart");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, c.getMemNo());
		pstmt.setInt(2, c.getSpaceNo());
		pstmt.setInt(3, c.getCartLimit());
		pstmt.setString(4, c.getCartParking());
		pstmt.setString(5, c.getCartAnimal());
		pstmt.setString(6, c.getCartStand());
		pstmt.setString(7, c.getCartChair());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	   
	   return result;
   }
   
   public Cart selectCartUpdateView(Connection conn, int memNo, String spaceName){
		
	    Cart c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCartUpdateView");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setString(2, spaceName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cart(
							rset.getInt("mem_no"),
							rset.getInt("space_no"),
							rset.getInt("cart_limit"),
							rset.getString("cart_date"),
							rset.getString("cart_in"),
							rset.getString("cart_out"),
							rset.getString("cart_parking"),
							rset.getString("cart_animal"),
							rset.getString("cart_stand"),
							rset.getString("cart_chair"),
							rset.getInt("cart_price"),
							rset.getString("space_name"),
							rset.getInt("space_limit"),
							rset.getString("space_pic")
						);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
   
   // wishList
   public int loveInsert(Connection conn, int spNo, int memNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("loveInsert");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, spNo);
		pstmt.setInt(2, memNo);
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	   return result;
   }
   
   public int loveDelete(Connection conn, int spNo, int memNo) {
	   PreparedStatement pstmt = null;
	   int result = 0;
	   String sql = prop.getProperty("loveDelete");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, spNo);
		pstmt.setInt(2, memNo);
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	   return result;
   }
   
   public ArrayList<Love> selectLove(Connection conn, int memNo) {
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   ArrayList<Love> list = new ArrayList<>();
	   String sql = prop.getProperty("selectLove");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Love l = new Love();
			l.setSpaceNo(rset.getInt("space_no"));
			l.setMemNo(rset.getInt("mem_no"));
			list.add(l);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	 return list;  
   }
   
   public int loveCheck(Connection conn, int spNo, int memNo) {
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   int count = 0;
	   String sql = prop.getProperty("loveCheck");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, spNo);
		pstmt.setInt(2, memNo);
		
		rset = pstmt.executeQuery();
		if(rset.next()) {
			count = rset.getInt("count");
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}  
	   return count;
   }
   
   public ArrayList<Love> selectLoveList(Connection conn, int memNo){
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   ArrayList<Love> list = new ArrayList<>();
	   String sql = prop.getProperty("selectLoveList");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		
		rset = pstmt.executeQuery();
		while(rset.next()) {
			list.add(new Love(rset.getInt("space_no"),
							  rset.getInt("mem_no"),
							  rset.getString("love_date"),
							  rset.getString("space_name"),
							  rset.getInt("space_limit"),
							  rset.getString("space_pic")));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	 return list;  
   }
   
   //---------ADMIN-----------//
	

   public int allMemberCount(Connection conn) {
      
      int allMemberCount = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("allMemberCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            allMemberCount = rset.getInt("MEM_ALL_COUNT");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return allMemberCount;
      
   }


	public ArrayList<Member> adminMemberManageListSelect(Connection conn){
		
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminMemberManageListSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(
							rset.getInt("mem_no"),
							rset.getString("mem_id"),
							rset.getString("mem_name"),
							rset.getString("mem_idno"),
							rset.getString("mem_phone"),
							rset.getString("mem_mail"),
							rset.getString("gr_name"),
							rset.getInt("book_count_all"),
							rset.getInt("book_count_month"),
							rset.getInt("book_amount_all"),
							rset.getInt("book_amount_month"),
							rset.getInt("rpt_count"),
							rset.getInt("like_count"),
							rset.getString("mem_status"),
							rset.getString("mem_adm_flag"),
							rset.getDate("mem_enroll_date"),
							rset.getDate("mem_modify_date")
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
	
	public Member adminMemberManageDetailListSelect(Connection conn, int memNo){
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminMemberManageDetailListSelect");
				
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(
							rset.getInt("mem_no"),
							rset.getString("mem_id"),
							rset.getString("mem_name"),
							rset.getString("mem_idno"),
							rset.getString("mem_phone"),
							rset.getString("mem_mail"),
							rset.getString("gr_name"),
							rset.getInt("book_count_all"),
							rset.getInt("book_count_month"),
							rset.getInt("book_amount_all"),
							rset.getInt("book_amount_month"),
							rset.getInt("rpt_count"),
							rset.getInt("like_count"),
							rset.getString("mem_status"),
							rset.getString("mem_adm_flag"),
							rset.getDate("mem_enroll_date"),
							rset.getDate("mem_modify_date")
						);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public ArrayList<Member> selectMemberListOrderBy(Connection conn, String addSql) {
		ArrayList<Member> memList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminMemberManageListSelect") + addSql;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				memList.add(new Member(
							rset.getInt("mem_no"),
							rset.getString("mem_id"),
							rset.getString("mem_name"),
							rset.getString("mem_idno"),
							rset.getString("mem_phone"),
							rset.getString("mem_mail"),
							rset.getString("gr_name"),
							rset.getInt("book_count_all"),
							rset.getInt("book_count_month"),
							rset.getInt("book_amount_all"),
							rset.getInt("book_amount_month"),
							rset.getInt("rpt_count"),
							rset.getInt("like_count"),
							rset.getString("mem_status"),
							rset.getString("mem_adm_flag"),
							rset.getDate("mem_enroll_date"),
							rset.getDate("mem_modify_date")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memList;
		
	}
	
	
	
	
	
	public ArrayList<Mcp> selectAdminCouponList(Connection conn){
		
		ArrayList<Mcp> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdminCouponList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Mcp(rset.getInt("cp_no"),
								 rset.getString("cp_name"),
								 rset.getInt("cp_discount"),
								 rset.getDate("cp_enroll_date")
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
	
	public int adminInsertGroupCoupon(Connection conn, int cpNo, String grNo, String mcpEndDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertGroupCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, mcpEndDate);
			pstmt.setString(3, grNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminInsertCoupon(Connection conn, String cpName, int cpDiscount, String cpEndDate) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cpName);
			pstmt.setInt(2, cpDiscount);
			pstmt.setString(3, cpEndDate);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminInsertOneCoupon(Connection conn, int cpNo, String memId, String mcpEndDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertOneCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, mcpEndDate);
			pstmt.setString(3, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminInsertAllCoupon(Connection conn, int cpNo, String mcpEndDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertAllCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cpNo);
			pstmt.setString(2, mcpEndDate);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	

}

















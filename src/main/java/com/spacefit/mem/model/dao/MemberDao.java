package com.spacefit.mem.model.dao;

import static com.spacefit.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Love;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.review.model.vo.Review;

public class MemberDao {
   
   private Properties prop = new Properties();
   
 
   
   
   public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
   
   public Member loginMember(Connection conn, String memId, String memRealPwd) {
      
      Member m = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("loginMember");
      
      try {
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memId);
         pstmt.setString(2, memRealPwd);
         
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
    	  close(rset);
         close(pstmt);
        // close(conn);
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
         pstmt.setString(7, m.getMemRealPwd());
         
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
    	 close(rset);
         close(pstmt);
      }
      return searchM;
      
   }
   
   public int selectPhone(Connection conn, String memPhone) {
	   int memNo = 0;
	   PreparedStatement pstmt = null;
	   ResultSet rset = null;
	   String sql = prop.getProperty("selectPhone");
	   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memPhone);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memNo = rset.getInt("mem_no");
			} else {
				memNo = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	       
		   return memNo;
   }
   
   public int updateUnknownPwd(Connection conn, String memPwd, String memPhone) {
	   int result1 = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("updateUnknownPwd");
	   try {
		   System.out.println("가짜비번 실행중 다오");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memPwd);
		pstmt.setString(2, memPhone);
		result1 = pstmt.executeUpdate();
		System.out.println("dao result" + result1);
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
       
	   return result1;
	   

   }
   
   public int updateRealUnknownPwd(Connection conn, String memRealPwd, String memPhone) {
	   int result2 = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("updateRealUnknownPwd");
	   try {
		 System.out.println("진짜비번 실행중 다오");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memRealPwd);
		pstmt.setString(2, memPhone);
		result2 = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
       
	   return result2;
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
   
   public int selectCouponCount(Connection conn, int memNo) {
	   
	   int cpCount = 0;
	   ResultSet rset = null;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("selectCouponCount");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			cpCount = rset.getInt("count(*)");
		}
	   } catch (SQLException e) {
		e.printStackTrace();
	   } finally {
		   close(rset);
		   close(pstmt);
	   }
	   
	   return cpCount;
	   
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
   
   public int insertMemCoupon(Connection conn, int memNo, String cpName) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setString(2, cpName);
			
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
   
	public int insertDownCoupon(Connection conn, String cpName, int memNo, String cpEndDate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDownCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setString(2, cpEndDate);
			pstmt.setString(3, cpName);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
   
	// 프로필사진 변경
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
   
   public int deleteProfile(Connection conn, String memId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			
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
		pstmt.setInt(1, c.getCartLimit());
		pstmt.setString(2, c.getCartParking());
		pstmt.setString(3, c.getCartAnimal());
		pstmt.setString(4, c.getCartStand());
		pstmt.setString(5, c.getCartChair());
		pstmt.setInt(6, c.getMemNo());
		pstmt.setInt(7, c.getSpaceNo());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	   
	   return result;
   }
   
   public int deleteCart(Connection conn, int memNo) {
	   
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("deleteCart");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	   
	   return result;
   }
   
   public int deleteSelectedCart(Connection conn, int memNo, int spaceNo) {
	   
	   int result = 0;
	   PreparedStatement pstmt = null;
	   String sql = prop.getProperty("deleteSelectedCart");
	   
	   try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memNo);
		pstmt.setInt(2, spaceNo);
		
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
	
	public int todayMem(Connection conn) {
		int todayMem = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("todayMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				todayMem = rset.getInt("TODAY_MEM");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return todayMem;
	}
	
	

	public int goldMem(Connection conn) {
		int goldMem = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("goldMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				goldMem = rset.getInt("GOLD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return goldMem;
	}
	
	
	public int adminCheck(Connection conn, String addSql) {
		
		int howMany = 0;
		PreparedStatement pstmt = null;
		//ResultSet rset = null;
		String sql = prop.getProperty("adminCheck") + addSql;
		try {
			pstmt = conn.prepareStatement(sql);
			howMany = pstmt.executeUpdate(); //2개 선택시 2
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return howMany;
	}
	
public int generalCheck(Connection conn, String addSql) {
		
		int howMany = 0;
		PreparedStatement pstmt = null;
		//ResultSet rset = null;
		String sql = prop.getProperty("generalCheck") + addSql;
		try {
			pstmt = conn.prepareStatement(sql);
			howMany = pstmt.executeUpdate(); //2개 선택시 2
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return howMany;
	}

public int gradeUp(Connection conn, String addSql) {
	
	int howMany = 0;
	PreparedStatement pstmt = null;
	//ResultSet rset = null;
	String sql = prop.getProperty("gradeUp") + addSql;
	try {
		pstmt = conn.prepareStatement(sql);
		howMany = pstmt.executeUpdate(); //2개 선택시 2
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	} return howMany;
}

public int gradeDown(Connection conn, String addSql) {
	
	int howMany = 0;
	PreparedStatement pstmt = null;
	//ResultSet rset = null;
	String sql = prop.getProperty("gradeDown") + addSql;
	try {
		pstmt = conn.prepareStatement(sql);
		howMany = pstmt.executeUpdate(); //2개 선택시 2
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	} return howMany;
}

public int blackCheck(Connection conn, String addSql) {
	
	int howMany = 0;
	PreparedStatement pstmt = null;
	//ResultSet rset = null;
	String sql = prop.getProperty("blackCheck") + addSql;
	try {
		pstmt = conn.prepareStatement(sql);
		howMany = pstmt.executeUpdate(); //2개 선택시 2
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	} return howMany;
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
	
	public int adminInsertCoupon(Connection conn, String cpName, int cpDiscount, String cpEndDate, String cpDown) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cpName);
			pstmt.setInt(2, cpDiscount);
			pstmt.setString(3, cpEndDate);
			pstmt.setString(4, cpDown);
			
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

















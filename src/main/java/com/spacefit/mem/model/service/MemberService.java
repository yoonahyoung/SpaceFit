package com.spacefit.mem.model.service;


import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.mem.model.dao.MemberDao;
import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Love;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;


public class MemberService {
   
   public Member loginMember(String memId, String memRealPwd) {
      
      Connection conn = getConnection();
      Member m = new MemberDao().loginMember(conn, memId, memRealPwd);
      close(conn);
      return m;
   
   }
   
   
   public int idCheck(String memId) {
      Connection conn = getConnection();
      // System.out.println(memId);
      int count = new MemberDao().idCheck(conn, memId);
      close(conn);
      return count;
   }
   
   
   public int insertMember(Member m) {
      
      Connection conn = getConnection();
      int result = new MemberDao().insertMember(conn, m);
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      return result;
      
   }
   
   public Member idSearch(Member m) {
	      Connection conn = getConnection();
	      Member searchM = new MemberDao().idSearch(conn, m);
	      close(conn);
	      return searchM;
	   }
	   
   public Member updateMember(Member m) {
      Connection conn = getConnection();
      int result = new MemberDao().updateMember(conn, m);
      
      Member updateMem = null;
      if(result > 0) {
         commit(conn);
         updateMem = new MemberDao().selectMember(conn, m.getMemId());
         
      }else {
         rollback(conn);
      }
      
      close(conn);
      return updateMem;
   }
	   
   public Member updatePwdMember(String memId, String memPwd, String updatePwd) {

		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, memId, memPwd, updatePwd);

		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}

		close(conn);
		return updateMem;
	}
   
   // 배너 첫번째이미지
   public String selectBannerOne() {
	   Connection conn = getConnection();
	   String banImg1 = new MemberDao().selectBannerOne(conn);
	   close(conn);
	   return banImg1;
   }
   
   public String selectBannerTwo() {
	   Connection conn = getConnection();
	   String banImg2 = new MemberDao().selectBannerTwo(conn);
	   close(conn);
	   return banImg2;
   }
   
   public String selectBannerThree() {
	   Connection conn = getConnection();
	   String banImg3 = new MemberDao().selectBannerThree(conn);
	   close(conn);
	   return banImg3;
   }
   
   public String selectGrade(String memId) {
	   Connection conn = getConnection();
	   String grName = new MemberDao().selectGrade(conn, memId);
	   close(conn);
	   return grName;
   }
   
   public int selectCouponCount(int memNo) {
	   Connection conn = getConnection();
	   int cpCount = new MemberDao().selectCouponCount(conn, memNo);
	   close(conn);
	   return cpCount;
	   
   }
   
   public ArrayList<Mcp> selectCouponList(int memNo) {
	   Connection conn = getConnection();
	   ArrayList<Mcp> list = new MemberDao().selectCouponList(conn, memNo);
	   close(conn);
	   return list;
   }
   
   public int insertMemCoupon(int memNo, String cpName) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMemCoupon(conn, memNo, cpName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
   
   public int deleteCoupon(int cpNo) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteCoupon(conn, cpNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
   
   public int updateMemberStatus(String memId, String memPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMemberStatus(conn, memId, memPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
   
   public ArrayList<Mcp> selectDownCoupon() { 
	   Connection conn = getConnection();
	   ArrayList<Mcp> list = new MemberDao().selectDownCoupon(conn);
	   close(conn);
	   return list;
   }
   
	public int insertDownCoupon(String cpName, int memNo, String cpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().insertDownCoupon(conn, cpName, memNo, cpEndDate);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
   
	// 프로필사진 변경
   public Member updateProfile(String memProfile, String memId) {
	   Connection conn = getConnection();
		int result = new MemberDao().updateProfile(conn, memProfile, memId);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println(updateMem);
		
		return updateMem;
   }
   
   public Member deleteProfile(String memId) {
	   Connection conn = getConnection();
		int result = new MemberDao().deleteProfile(conn, memId);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
   }
   
   public int selectPhone(String memPhone) {
	   Connection conn = getConnection();
	   int memNo = new MemberDao().selectPhone(conn,memPhone);
	   if(memNo > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return memNo;
   }
   
   public int updateUnknownPwd(String memPwd, String memPhone) {
	   Connection conn = getConnection();
	   //System.out.println("가짜비번 실행중 서비스");
	   int result1 = new MemberDao().updateUnknownPwd(conn, memPwd, memPhone);
	   if(result1 == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
	
		return result1;
   }
   
   public int updateRealUnknownPwd(String memRealPwd, String memPhone) {
	   Connection conn = getConnection();
	   //System.out.println("진짜비번 실행중 서비스");
	   int result2 = new MemberDao().updateRealUnknownPwd(conn, memRealPwd, memPhone);
	   if(result2 == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
	
		return result2;
   }
   
   
   public int hashPwdChange(String memId, String hashPwd) {
	   Connection conn = getConnection();
	   int result1 = new MemberDao().hashPwdChange(conn, memId, hashPwd);
	   
	   if(result1 == 1) {
		   commit(conn);
	   } else {
		   rollback(conn);
	   }
	   
	   close(conn);
	   return result1;
   }
   
   public int realPwdChange(String memId, String updatePwd) {
	   Connection conn = getConnection();
	   int result2 = new MemberDao().realPwdChange(conn, memId, updatePwd);
	   if(result2 == 1) {
		   commit(conn);
	   } else {
		   rollback(conn);
	   } return result2;
   }
  
   
   /*
   public Member SHupdatePwdMember(String memId, String updatePwd, String hashPwd) {
	   Connection conn = getConnection();
	   Member updateMem = new MemberDao().SHupdatePwdMember(conn, memId,  updatePwd, hashPwd);
	   if(result2 == 1) {
		   commit(conn);
	   } else {
		   rollback(conn);
	   } return result2;
   }
   */
   // 보관함(장바구니)
   public int insertCart(Cart cart) {
	   Connection conn = getConnection();
	   int result = new MemberDao().insertCart(conn, cart);
	   if(result > 0) {
		   commit(conn);
	   }else {
		   rollback(conn);
	   }
	   close(conn);
	   return result;
   }
   
   public ArrayList<Cart> selectCartList(int memNo){
	   Connection conn = getConnection();
	   ArrayList<Cart> list = new MemberDao().selectCartList(conn, memNo);
	   close(conn);
	   return list;
   }
   
   public int updateCart(Cart c) {
	   Connection conn = getConnection();
	   int result = new MemberDao().updateCart(conn, c);
	   if(result > 0) {
		   commit(conn);
	   }else {
		   rollback(conn);
	   }
	   close(conn);
	   return result;
   }
   
   public int deleteCart(int memNo) {
	   Connection conn = getConnection();
	   int result = new MemberDao().deleteCart(conn, memNo);
	   if(result > 0) {
		   commit(conn);
	   }else {
		   rollback(conn);
	   }
	   close(conn);
	   return result;
   }
   
   // 찜하기(위시리스트)
   public int loveList(int spNo, int memNo, String status) {
	   Connection conn = getConnection();
	   int result = 0;
	   // status = n일시 찜추가, y일시 찜해제
	   if(status.equals("n")) {
		   result = new MemberDao().loveInsert(conn, spNo, memNo);   
	   }else {
		   result = new MemberDao().loveDelete(conn, spNo, memNo);
	   }
	   // 커밋롤백처리
	   if(result > 0) {
		   commit(conn);
	   }else {
		   rollback(conn);
	   }
	   close(conn);
	   
	   return result;
   }
   
   public ArrayList<Love> selectLove(int memNo){
	   Connection conn = getConnection();
	   ArrayList<Love> list = new MemberDao().selectLove(conn,memNo);
	   close(conn);
	   return list;
   }
   
   public int loveCheck(int spNo, int memNo) {
	   Connection conn = getConnection();
	   int count = new MemberDao().loveCheck(conn, spNo, memNo);
	   close(conn);
	   return count;
	   
   }
   
   public ArrayList<Love> selectLoveList(int memNo){
	   Connection conn = getConnection();
	   ArrayList<Love> list = new MemberDao().selectLoveList(conn,memNo);
	   close(conn);
	   return list;
   }
   
   public Cart selectCartUpdateView(int memNo, String spaceName) {
		Connection conn = getConnection();
		Cart c = new MemberDao().selectCartUpdateView(conn, memNo, spaceName);
		close(conn);
		return c;
	}
   
   
   
    // ----------------------- admin ------------------------- //

	public ArrayList<Member> adminMemberManageListSelect() {
		Connection conn = getConnection();
		//nt allMemberCount = new MemberDao().allMemberCount(conn);
		ArrayList <Member> list = new MemberDao().adminMemberManageListSelect(conn/*, allMemberCount*/);
		close(conn);
		return list;
	}
	
	public Member adminMemberManageDetailListSelect(int memNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().adminMemberManageDetailListSelect(conn, memNo);
		close(conn);
		return m;
	}
	
	
	public ArrayList<Member> selectMemberListOrderBy(String orderBy, String search1, String search2){
		Connection conn = getConnection();
		String addSql = "";
		
		
		if(orderBy.equals("newest") || orderBy.equals("bestOrder") || orderBy.equals("reported") || orderBy.equals("like")) {
			switch(orderBy) {
				case "newest" : addSql = search1 + "ORDER BY MEM_ENROLL_DATE DESC"; break;
				case "bestOrder" : addSql = search1 + "ORDER BY BOOK_AMOUNT_MONTH"; break;
				case "reported" : addSql = search1 + "ORDER BY RPT_COUNT DESC"; break;
				case "like" : addSql = search1 + "ORDER BY LIKE_COUNT DESC"; break;
				default : addSql = "ORDER BY MEM_ENROLL_DATE ASC"; break;
			}
		} else {
			switch(orderBy) {
				case "adminOnly" : addSql = "WHERE MEM_ADM_FLAG = 'A'" + search2; break;
				case "userOnly" : addSql = "WHERE MEM_ADM_FLAG = 'U'" + search2; break;
				case "black" : addSql = "WHERE MEM_STATUS = 'B'" + search2; break;
				default : addSql = "ORDER BY MEM_ENROLL_DATE ASC"; break;
			}
		}

		ArrayList<Member> memList = new MemberDao().selectMemberListOrderBy(conn, addSql);
		close(conn);
		return memList;
	}
	
	
	public int adminCheck(String strAdminNo) {
		Connection conn = getConnection();
		String addSql = "WHERE MEM_NO IN (" + strAdminNo + ")";
		int howMany = new MemberDao().adminCheck(conn, addSql);
		
		if(howMany > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return howMany;
	}
	
	public int generalCheck(String strGenNo) {
		Connection conn = getConnection();
		String addSql = "WHERE MEM_NO IN (" + strGenNo + ")";
		int howMany = new MemberDao().generalCheck(conn, addSql);
		
		if(howMany > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return howMany;
	}
	
	public int gradeUp(String strGradeUpNo) {
		Connection conn = getConnection();
		String addSql = "WHERE MEM_NO IN (" + strGradeUpNo + ")";
		int howMany = new MemberDao().gradeUp(conn, addSql);
		
		if(howMany > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return howMany;
	}
	
	public int gradeDown(String strGradeDownNo) {
		Connection conn = getConnection();
		String addSql = "WHERE MEM_NO IN (" + strGradeDownNo + ")";
		int howMany = new MemberDao().gradeDown(conn, addSql);
		
		if(howMany > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return howMany;
	}
	
	public int blackCheck(String strBlackNo) {
		Connection conn = getConnection();
		String addSql = "WHERE MEM_NO IN (" + strBlackNo + ")";
		int howMany = new MemberDao().blackCheck(conn, addSql);
		
		if(howMany > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		close(conn);
		
		return howMany;
	}
	
	public int todayMem() {
		Connection conn = getConnection();
		int todayMem  = new MemberDao().todayMem(conn);
		close(conn);
		return todayMem;
	}
	
	
	public int goldMem() {
		Connection conn = getConnection();
		int goldMem  = new MemberDao().goldMem(conn);
		close(conn);
		return goldMem;
	}

	public ArrayList<Mcp> selectAdminCouponList(){
		Connection conn = getConnection();
		ArrayList<Mcp> list = new MemberDao().selectAdminCouponList(conn);
		close(conn);
		return list;
	}

	public int adminInsertCoupon(String cpName, int cpDiscount, String cpEndDate , String cpDown) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertCoupon(conn, cpName, cpDiscount, cpEndDate, cpDown);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int adminInsertGroupCoupon(int cpNo, String grNo, String mcpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertGroupCoupon(conn, cpNo, grNo, mcpEndDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int adminInsertOneCoupon(int cpNo, String memId, String mcpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertOneCoupon(conn, cpNo, memId, mcpEndDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int adminInsertAllCoupon(int cpNo, String mcpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertAllCoupon(conn, cpNo, mcpEndDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
       // 민주작성 - 사용가능한 쿠폰 조회
	   public ArrayList<Mcp> selectMyCouponList(int memNo) {
		   Connection conn = getConnection();
		   ArrayList<Mcp> list = new MemberDao().selectMyCouponList(conn, memNo);
		   close(conn);
		   return list;
	   }
}

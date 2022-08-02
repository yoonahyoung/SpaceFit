package com.spacefit.mem.model.service;


import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.mem.model.dao.MemberDao;
import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Mcp;
import com.spacefit.mem.model.vo.Member;


public class MemberService {
   
   public Member loginMember(String memId, String memPwd) {
      
      Connection conn = getConnection();
      Member m = new MemberDao().loginMember(conn, memId, memPwd);
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
   
   public String selectGrade(String memId) {
	   Connection conn = getConnection();
	   String grName = new MemberDao().selectGrade(conn, memId);
	   close(conn);
	   return grName;
   }
   
   public ArrayList<Mcp> selectCouponList(int memNo) {
	   Connection conn = getConnection();
	   ArrayList<Mcp> list = new MemberDao().selectCouponList(conn, memNo);
	   close(conn);
	   return list;
   }
   
   public int insertMemCoupon(String cpCode) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMemCoupon(conn, cpCode);
		
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

	public ArrayList<Mcp> selectAdminCouponList(){
		Connection conn = getConnection();
		ArrayList<Mcp> list = new MemberDao().selectAdminCouponList(conn);
		close(conn);
		return list;
	}

	public int adminInsertCoupon(String cpName, int cpDiscount, String cpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertCoupon(conn, cpName, cpDiscount, cpEndDate);
		
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
}

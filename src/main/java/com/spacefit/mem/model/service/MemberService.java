package com.spacefit.mem.model.service;


import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.mem.model.dao.MemberDao;
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

	public int adminInsertCoupon(String cpName, int cpDiscount) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertCoupon(conn, cpName, cpDiscount);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int adminInsertGroupCoupon(int cpNo, int grNo, String mcpEndDate) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertGroupCoupon(conn, cpNo, grNo, mcpEndDate);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
}

package com.spacefit.mem.model.service;


import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.mem.model.dao.MemberDao;
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
	
	public ArrayList<Member> adminMemberManageDetailListSelect() {
		Connection conn = getConnection();
		int allMemberCount = new MemberDao().allMemberCount(conn);
		ArrayList <Member> list = new MemberDao().adminMemberManageDetailListSelect(conn, allMemberCount);
		close(conn);
		return list;
	}
	
	public ArrayList <Member> adminMemberManageDetailListSelect(int memNo) {
		Connection conn = getConnection();
		ArrayList <Member> list = new MemberDao().adminMemberManageDetailListSelect(conn, memNo);
		close(conn);
		return list;
	}



}

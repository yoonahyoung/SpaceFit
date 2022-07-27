package com.spacefit.mem.model.service;


import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;

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


}

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

}
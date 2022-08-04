package com.spacefit.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.review.model.dao.LikeDao;
import com.spacefit.review.model.vo.Like;
import static com.spacefit.common.JDBCTemplate.*;

public class LikeService {
	
	public int checkLikeOnce(int memNo, int rvNo) {
		Connection conn = getConnection();
		int idCheckCount = new LikeDao().checkLikeOnce(conn, memNo, rvNo);
		close(conn);
		return idCheckCount;
	}
	
	public int updateLike(int memNo, int rvNo) {
		Connection conn = getConnection();
		int updateLike = new LikeDao().updateLike(conn, memNo, rvNo);
		if(updateLike > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return updateLike;
	}
	
	public int howManyRvPerSpace(int spNo) {
		Connection conn = getConnection();
		int howManyRvPerSpace = new LikeDao().howManyRvPerSpace(conn, spNo);
		close(conn);
		return howManyRvPerSpace;
	}
}

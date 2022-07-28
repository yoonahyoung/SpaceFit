package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;

import com.spacefit.review.model.dao.ReviewDao;

public class ReviewService {
	
	public int selectSpaceNo(String spaceName) {
		
		Connection conn = getConnection();
		int spaceNo = new ReviewDao().selectSpaceNo(conn, spaceName);
		close(conn);
		return spaceNo;
		
	}

}

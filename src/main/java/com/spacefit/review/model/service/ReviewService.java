package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.*;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.review.model.dao.ReviewDao;
import com.spacefit.review.model.vo.Review;

public class ReviewService {
	
	public int selectSpaceNo(String spaceName) {
		
		Connection conn = getConnection();
		int spaceNo = new ReviewDao().selectSpaceNo(conn, spaceName);
		close(conn);
		return spaceNo;
		
	}
	
	public int insertReview(Review rv, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, rv);
		int result2 = new ReviewDao().insertAttachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}

}

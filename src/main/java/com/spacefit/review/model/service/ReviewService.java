package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.*;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.review.model.dao.ReviewDao;
import com.spacefit.review.model.vo.Review;

public class ReviewService {
	
	// 후기등록1
	public int selectSpaceNo(String spaceName) {
		
		Connection conn = getConnection();
		int spaceNo = new ReviewDao().selectSpaceNo(conn, spaceName);
		close(conn);
		return spaceNo;
		
	}
	
	// 후기등록 2
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
	
	// 후기등록 3
	public String selectReviewValid(Review rv) {
		
		Connection conn = getConnection();		
		String reviewValid = new ReviewDao().selectReviewValid(conn, rv);
		close(conn);
		return reviewValid;
		
	}
	
	// 후기내역리스트조회
	public ArrayList<Review> selectReviewList(int memNo){
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, memNo);
		close(conn);
		return list;
		
	}
	
	// 특정 후기 조회용
	public Review selectReview(int reviewNo) {
		Connection conn = getConnection();
		Review rv = new ReviewDao().selectReview(conn, reviewNo);
		close(conn);
		return rv;
	}
	
	// 등록된 후기의 첨부파일
	public ArrayList<Attachment> selectAttachmentList(int reviewNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ReviewDao().selectAttachmentList(conn, reviewNo);
		close(conn);
		return list;
	}

}

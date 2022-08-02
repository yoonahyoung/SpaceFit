package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.*;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.review.model.dao.CommentDao;
import com.spacefit.review.model.vo.Comment;

public class CommentService {
	
	public ArrayList<Comment> selectComList(int rvNo) {
		Connection conn = getConnection();
		ArrayList <Comment> comList = new CommentDao().selectComList(conn, rvNo);
		close(conn);
		return comList;
	}
	
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		int result = new CommentDao().insertComment(conn, c);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

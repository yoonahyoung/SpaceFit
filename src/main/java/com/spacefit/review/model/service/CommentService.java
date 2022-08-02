package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.review.model.dao.CommentDao;
import com.spacefit.review.model.vo.Comment;

public class CommentService {
	
	public ArrayList<Comment> selectComList(int rvNo) {
		Connection conn = getConnection();
		ArrayList <Comment> comList = new CommentDao().selectComList(conn, rvNo);
		System.out.println("서비스에서 확인 : " + comList);
		close(conn);
		return comList;
	}

}

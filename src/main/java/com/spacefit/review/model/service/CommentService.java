package com.spacefit.review.model.service;

import static com.spacefit.common.JDBCTemplate.*;
import static com.spacefit.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.review.model.dao.CommentDao;
import com.spacefit.review.model.vo.Comment;

public class CommentService {
	
	/**
	 * @param rvNo
	 * @return AjaxCommentListComtroller
	 */
	public ArrayList<Comment> selectComList(int rvNo) {
		Connection conn = getConnection();
		ArrayList <Comment> comList = new CommentDao().selectComList(conn, rvNo);
		close(conn);
		return comList;
	}
	
	/**
	 * @param c
	 * @return AjaxCommentInsertController
	 */
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
	
	/**
	 * @param comNo
	 * @return AjaxCommentDeleteController
	 */
	public int deleteComment(int comNo, int memNo) {
		Connection conn = getConnection();
		int result = new CommentDao().deleteComment(conn, comNo, memNo);
		//System.out.println("서비스에서 출력해보자 뎃글번호 : " + comNo + "  멤버번호 : " + memNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateComment(int comNo, int memNo) {
		Connection conn = getConnection();
		int result = new CommentDao().deleteComment(conn, comNo, memNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

}

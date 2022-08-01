package com.spacefit.qna.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.qna.model.dao.QnADao;
import com.spacefit.qna.model.vo.Category;
import com.spacefit.qna.model.vo.QnA;

public class QnAService {
	public ArrayList<QnA> selectQnAList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectQnAList(conn, pi);
		close(conn);
		
		return list;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new QnADao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Category> selectCategoryList(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<Category> list = new QnADao().selectCategoryList(conn, spaceCategory);
		close(conn);
		return list;
	}
}

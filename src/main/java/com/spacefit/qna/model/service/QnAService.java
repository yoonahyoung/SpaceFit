package com.spacefit.qna.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.common.model.vo.PageInfo;
import com.spacefit.notice.model.dao.NoticeDao;
import com.spacefit.notice.model.vo.Notice;
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
	
	public int insertPublicQnA(QnA q, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new QnADao().insertPublicQnA(conn, q); // QnA에 INSERT
		
		int result2 = 1;
		if(at != null) { // 첨부파일이 있을 경우 
			result2 = new QnADao().insertAttachment(conn, at);
		}
		
		
		if(result1 > 0 && result2 > 0 ) { // 성공
			commit(conn);
		}else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int insertSecretQnA(QnA q, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new QnADao().insertSecretQnA(conn, q); // QnA에 INSERT
		
		int result2 = 1;
		if(at != null) { // 첨부파일이 있을 경우 
			result2 = new QnADao().insertAttachment(conn, at);
		}
		
		
		if(result1 > 0 && result2 > 0 ) { // 성공
			commit(conn);
		}else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int increaseCount(int qnaNo) {
		Connection conn = getConnection();
		
		int result = new QnADao().increaseCount(conn, qnaNo);
		
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public QnA selectQnA(int qnaNo) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectQnA(conn, qnaNo);
		close(conn);
		return q;
	}
	
	public Attachment selectAttachment(int qnaNo) {
		Connection conn = getConnection();
		Attachment at = new QnADao().selectAttachment(conn, qnaNo);
		close(conn);
		return at;
	}
}

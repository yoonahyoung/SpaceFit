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
	public ArrayList<QnA> selectQnAListAll(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectQnAListAll(conn, pi);
		close(conn);
		
		return list;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new QnADao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Category> selectAllSpaceList( ){
		Connection conn = getConnection();
		ArrayList<Category> list = new QnADao().selectAllSpaceList(conn);
		close(conn);
		return list;
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
	
	public int insertPublicReply(QnA q, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new QnADao().insertPublicReply(conn, q); // QnA에 INSERT
		int refNo = q.getQnaRefNo();
		int result2 = 1;
		if(at != null) { // 첨부파일이 있을 경우 
			result2 = new QnADao().insertRelpyAttachment(conn, at, refNo);
		}
		
		
		if(result1 > 0 && result2 > 0 ) { // 성공
			commit(conn);
		}else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int insertSecretReply(QnA q, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new QnADao().insertSecretReply(conn, q); // QnA에 INSERT
		int refNo = q.getQnaRefNo();
		int result2 = 1;
		if(at != null) { // 첨부파일이 있을 경우 
			result2 = new QnADao().insertRelpyAttachment(conn, at, refNo);
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
	
	public String selectSpaceName(String spaceNo) {
		Connection conn = getConnection();
		
		String spaceName = new QnADao().selectSpaceName(conn, spaceNo);
		close(conn);
		return spaceName;
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
	public int isSolved(int qnaNo) {
		Connection conn = getConnection();
		int result = new QnADao().isSolved(conn, qnaNo);
		close(conn);
		return result;
	}
	
	// 전체 전체 전체 선택 미완
	public ArrayList<QnA> selectQnAList2(PageInfo pi, String isSolved){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		if(isSolved.equals("대기")) {//답변대기인경우
			list = new QnADao().selectQnAList2Wait(conn, pi);
		}else {//답변완료인경우
			//ArrayList<QnA> list = new QnADao().selectQnAList16(conn, pi, qnaCategory, spaceCategory, spaceNo);
		}

		close(conn);
		
		return list;
	}
	// 전체 전체 선택 전체
	public ArrayList<QnA> selectQnAList3(PageInfo pi, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList3(conn, pi, spaceNo);

		close(conn);
		
		return list;
	}
	// 전체 선택 전체 전체
	public ArrayList<QnA> selectQnAList5(PageInfo pi, String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList5(conn, pi, spaceCategory);

		close(conn);
		
		return list;
	}
	// 전체 선택 선택 전체
	public ArrayList<QnA> selectQnAList7(PageInfo pi, String spaceCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList7(conn, pi, spaceCategory, spaceNo);

		close(conn);
		
		return list;
	}
	// 선택 전체 전체 전체
	public ArrayList<QnA> selectQnAList9(PageInfo pi, String qnaCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList9(conn, pi, qnaCategory);

		close(conn);
		
		return list;
	}
	// 선택 전체 선택 전체
	public ArrayList<QnA> selectQnAList11(PageInfo pi, String qnaCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList11(conn, pi, qnaCategory, spaceNo);

		close(conn);
		
		return list;
	}
	// 선택 선택 전체 전체
	public ArrayList<QnA> selectQnAList13(PageInfo pi, String qnaCategory, String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList13(conn, pi, qnaCategory, spaceCategory);

		close(conn);
		
		return list;
	}
	// 선택 선택 선택 전체
	public ArrayList<QnA> selectQnAList15(PageInfo pi, String qnaCategory, String spaceCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList15(conn, pi, qnaCategory, spaceCategory, spaceNo);

		close(conn);
		
		return list;
	}
	// 선택 선택 선택 선택 미완
	public ArrayList<QnA> selectQnAList16(PageInfo pi, String qnaCategory, String spaceCategory, String spaceNo, String isSolved){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		if(isSolved.equals("대기")) {//답변대기인경우
			list = new QnADao().selectQnAList16Wait(conn, pi, qnaCategory, spaceCategory, spaceNo);
		}else {//답변완료인경우
			//ArrayList<QnA> list = new QnADao().selectQnAList16(conn, pi, qnaCategory, spaceCategory, spaceNo);
		}

		close(conn);
		
		return list;
	}
}

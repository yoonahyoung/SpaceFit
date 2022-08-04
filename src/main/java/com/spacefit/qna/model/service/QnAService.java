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
	
	public int changeSolvedStatus(int refNo) {
		Connection conn = getConnection();
		int result = new QnADao().changeSolvedStatus(conn, refNo);
		close(conn);
		return result;
	}
	public int selectMyListCount(int memNo) {
		Connection conn = getConnection();
		int result = new QnADao().selectMyListCount(conn, memNo);
		close(conn);
		return result;
	}
	// 내 글 리스트 + 답글 조회
	public ArrayList<QnA> selectMyQnAList(PageInfo pi, int memNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectMyQnAList(conn, pi, memNo);
		close(conn);
		
		return list;
	}
	// 여기서부터 검색 메소드
	// 전체 전체 전체 전체 1
	public ArrayList<QnA> selectQnAListAll(){
		Connection conn = getConnection();
		ArrayList<QnA> list = new QnADao().selectQnAListAll(conn);
		close(conn);
		
		return list;
	}
	// 전체 전체 전체 대기 2-1
	public ArrayList<QnA> selectQnAList2Wait(){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		
		list = new QnADao().selectQnAList2Wait(conn);

		close(conn);
		
		return list;
	}
	
	// 전체 전체 전체 완료 2-2
	public ArrayList<QnA> selectQnAList2Solved(String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		
		list = new QnADao().selectQnAList2Solved(conn, spaceNo);

		close(conn);
		
		return list;
	}
	// 전체 전체 선택 전체 3
	public ArrayList<QnA> selectQnAList3(String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList3(conn, spaceNo);

		close(conn);
		
		return list;
	}
	// 전체 전체 선택 대기 4-1
	public ArrayList<QnA> selectQnAList4Wait(String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList4Wait(conn, spaceNo);

		close(conn);
		
		return list;
	}
	
	// 전체 전체 선택 완료 4-2
	public ArrayList<QnA> selectQnAList4Solved(String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList4Solved(conn, spaceNo);

		close(conn);
		
		return list;
	}
	// 전체 선택 전체 전체 5
	public ArrayList<QnA> selectQnAList5(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList5(conn, spaceCategory);

		close(conn);
		
		return list;
	}
	// 전체 선택 전체 대기 6-1
	public ArrayList<QnA> selectQnAList6Wait(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList4Wait(conn, spaceCategory);

		close(conn);
		
		return list;
	}
	
	// 전체 선택 전체 완료 6-2
	public ArrayList<QnA> selectQnAList6Solved(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList4Solved(conn, spaceCategory);

		close(conn);
		
		return list;
	}

	// 전체 선택 선택 전체 7
	public ArrayList<QnA> selectQnAList7(String spaceCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList7(conn, spaceCategory, spaceNo);

		close(conn);
		
		return list;
	}
	// 선택 전체 전체 전체 9
	public ArrayList<QnA> selectQnAList9(String qnaCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList9(conn, qnaCategory);

		close(conn);
		
		return list;
	}
	// 선택 전체 전체 대기 10-1
	public ArrayList<QnA> selectQnAList10Wait(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList10Wait(conn, spaceCategory);

		close(conn);
		
		return list;
	}
	
	// 선택 전체 전체 완료 10-2
	public ArrayList<QnA> selectQnAList10Solved(String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList10Solved(conn, spaceCategory);

		close(conn);
		
		return list;
	}
	
	// 선택 전체 선택 전체 11
	public ArrayList<QnA> selectQnAList11(String qnaCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList11(conn, qnaCategory, spaceNo);

		close(conn);
		
		return list;
	}
	
	// 선택 전체 선택 대기 12-1
	public ArrayList<QnA> selectQnAList12Wait(String qnaCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList12Wait(conn, qnaCategory, spaceNo);

		close(conn);
		
		return list;
	}
	
	// 선택 전체 선택 완료 12-2
	public ArrayList<QnA> selectQnAList12Solved(String qnaCategory, String spaceNo){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList12Solved(conn, qnaCategory, spaceNo);

		close(conn);
		
		return list;
	}

	// 선택 선택 전체 전체 13
	public ArrayList<QnA> selectQnAList13(String qnaCategory, String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList13(conn, qnaCategory, spaceCategory);

		close(conn);
		
		return list;
	}
	// 선택 선택 전체 대기 14-1
	public ArrayList<QnA> selectQnAList14Wait(String qnaCategory, String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList14Wait(conn, qnaCategory, spaceCategory);

		close(conn);
		
		return list;
	}
	
	// 선택 선택 전체 완료 14-2
	public ArrayList<QnA> selectQnAList14Solved(String qnaCategory, String spaceCategory){
		Connection conn = getConnection();
		ArrayList<QnA> list = null;
		list = new QnADao().selectQnAList14Solved(conn, qnaCategory, spaceCategory);

		close(conn);
		
		return list;
	}


}

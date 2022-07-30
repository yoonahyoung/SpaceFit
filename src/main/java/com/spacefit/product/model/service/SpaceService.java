package com.spacefit.product.model.service;

import static com.spacefit.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.spacefit.attachment.model.vo.Attachment;
import com.spacefit.product.model.dao.SpaceDao;
import com.spacefit.product.model.vo.Space;

public class SpaceService {
	
	public ArrayList<Space> selectList() {
		Connection conn = getConnection();
		ArrayList<Space> list = new SpaceDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Space> selectTopList(){
		Connection conn = getConnection();
		ArrayList<Space> topList = new SpaceDao().selectTopList(conn);
		close(conn);
		return topList;
	}

	public Space spaceDetailView(int spNo) {
		Connection conn = getConnection();
		Space s = new SpaceDao().spaceDetailView(conn, spNo);
		close(conn);
		return s;
	}

	public int insertSpace(Space s, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		// 추가파일x
		int result1 = new SpaceDao().insertSpace(conn, s, list);
		// 추가파일o
		int result2 = new SpaceDao().insertAttach(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	public ArrayList<Attachment> selectAttach(int spNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new SpaceDao().selectAttach(conn, spNo);
		close(conn);
		
		return list;
	}

}

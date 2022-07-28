package com.spacefit.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.spacefit.common.JDBCTemplate.*;

import com.spacefit.product.model.dao.SpaceDao;
import com.spacefit.product.model.vo.Space;

public class SpaceService {
	
	public ArrayList<Space> selectList() {
		Connection conn = getConnection();
		ArrayList<Space> list = new SpaceDao().selectList(conn);
		close(conn);
		return list;
	}

}

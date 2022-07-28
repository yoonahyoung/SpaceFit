package com.spacefit.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.spacefit.reservation.model.dao.BookDao;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

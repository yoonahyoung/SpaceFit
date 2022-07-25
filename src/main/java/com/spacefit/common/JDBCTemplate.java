package com.spacefit.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	public static void main(String[] args) {
		getConnection();
	}
	
	// 1. Connection 객체 생성 후 해당 Connection 객체 반환 (get Connection)
	public static Connection getConnection() {
		
		Connection conn = null;
		Properties prop = new Properties(); //Map 계열 컬랙션 키:밸류가 문자열로 담김
		
		// driver.properties 파일 읽기 (src/main/webapp/WEB-INF/classes)
		// 해당 파일을 찾아서 물리적인 경로 알아내기
		String filePath = JDBCTemplate.class.getResource("/db/driver/driver.properties").getPath();
		
		try {
			prop.load(new FileInputStream(filePath));
			
			
			try {
				// 1) jdbc driver 등록
				Class.forName(prop.getProperty("driver"));
				
				// 2) 접속하고자 하는 db의 url, 계정명, 비번 제시로 Connection 생성
				conn = DriverManager.getConnection(prop.getProperty("url"),
												   prop.getProperty("username"),
												   prop.getProperty("password"));
			
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	// 2. Connection 객체 전달받아서 commit, rollback 시켜주는 메소드 생성
	public static void commit(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 3. Connection, Statement, ResultSet close 하는 메소
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}

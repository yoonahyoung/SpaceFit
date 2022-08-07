package com.spacefit.pay.model.dao;

import static com.spacefit.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.spacefit.mem.model.vo.Cart;
import com.spacefit.notice.model.vo.Notice;
import com.spacefit.reservation.model.vo.Book;


public class PayDao {
private Properties prop = new Properties();
	
	public PayDao() {
		try {
			prop.loadFromXML(new FileInputStream( PayDao.class.getResource("/db/sql/pay-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getDiscount(Connection conn, String cpNo) {
		// update문 => 처리된 행수
		int discount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDiscount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				discount = rset.getInt("CP_DISCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return discount;
	}
	
	// 쿠폰 x
	public int insertPayListNo(Connection conn, int memNo, int amount) { 
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayListNo"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, amount);
			pstmt.setInt(3, amount);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 쿠폰 o
	public int insertPayListCoupon(Connection conn, int memNo, String cpNo, int amount, int discountAmount) {
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayListCoupon"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, cpNo);
			pstmt.setInt(3, amount);
			pstmt.setInt(4, discountAmount);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 요청 x
	public int insertBookNo(Connection conn, Cart quickpay, Book book) {
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBookNo"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quickpay.getSpaceNo()); // 공간번호
			pstmt.setInt(2, quickpay.getMemNo()); // 회원번호
			pstmt.setInt(3, quickpay.getCartLimit()); // 인원
			pstmt.setString(4, quickpay.getCartDate()); // 예약날짜
			pstmt.setString(5, quickpay.getCartIn()); // 입실
			pstmt.setString(6, quickpay.getCartOut()); // 퇴실
			pstmt.setInt(7, quickpay.getCartPrice()); // 총가격
			pstmt.setString(8, book.getBookName()); // 이름
			pstmt.setString(9, book.getBookPhone()); // 번호
			pstmt.setString(10, book.getBookEmail()); // 이메일
			pstmt.setString(11, book.getBookPurpose()); // 목적
			pstmt.setString(12, quickpay.getCartParking()); // 차
			pstmt.setString(13, quickpay.getCartAnimal()); // 동물
			pstmt.setString(14, quickpay.getCartChair()); // 의자
			pstmt.setString(15, quickpay.getCartStand()); // 보면대
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 요청 o
	public int insertBookContent(Connection conn, Cart quickpay, Book book) {
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBookContent"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quickpay.getSpaceNo()); // 공간번호
			pstmt.setInt(2, quickpay.getMemNo()); // 회원번호
			pstmt.setInt(3, quickpay.getCartLimit()); // 인원
			pstmt.setString(4, quickpay.getCartDate()); // 예약날짜
			pstmt.setString(5, quickpay.getCartIn()); // 입실
			pstmt.setString(6, quickpay.getCartOut()); // 퇴실
			pstmt.setInt(7, quickpay.getCartPrice()); // 총가격
			pstmt.setString(8, book.getBookName()); // 이름
			pstmt.setString(9, book.getBookPhone()); // 번호
			pstmt.setString(10, book.getBookEmail()); // 이메일
			pstmt.setString(11, book.getBookPurpose()); // 목적
			pstmt.setString(12, book.getBookAddContent()); // 요청
			pstmt.setString(13, quickpay.getCartParking()); // 차
			pstmt.setString(14, quickpay.getCartAnimal()); // 동물
			pstmt.setString(15, quickpay.getCartChair()); // 의자
			pstmt.setString(16, quickpay.getCartStand()); // 보면대
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteCoupon(Connection conn, int memNo, String cpNo) { 
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCoupon"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, cpNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Cart selectCart(Connection conn, int spaceNo) {
		// select문 => ResultSet (한행) => Notice
		Cart cartPay = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  spaceNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cartPay = new Cart(rset.getInt("MEM_NO"),
						       rset.getInt("SPACE_NO"),
								rset.getInt("CART_LIMIT"),
								rset.getString("CART_DATE"),
								rset.getString("CART_IN"),
								rset.getString("CART_OUT"),
								rset.getString("CART_PARKING"),
								rset.getString("CART_ANIMAL"),
								rset.getString("CART_STAND"),
								rset.getString("CART_CHAIR"),
								rset.getInt("CART_PRICE")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cartPay;
	}
	
	public int deleteCart(Connection conn, Cart quickPay) { 
		// update문 => 처리된 행수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCart"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quickPay.getMemNo());
			pstmt.setInt(2, quickPay.getSpaceNo());
			pstmt.setInt(3, quickPay.getCartLimit());
			pstmt.setString(4, quickPay.getCartDate());
			pstmt.setString(5, quickPay.getCartIn());
			pstmt.setString(6, quickPay.getCartOut());
			pstmt.setString(7, quickPay.getCartParking());
			pstmt.setString(8, quickPay.getCartAnimal());
			pstmt.setString(9, quickPay.getCartStand());
			pstmt.setString(10, quickPay.getCartChair());
			pstmt.setInt(11, quickPay.getCartPrice());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}

package com.spacefit.pay.model.service;

import static com.spacefit.common.JDBCTemplate.close;
import static com.spacefit.common.JDBCTemplate.commit;
import static com.spacefit.common.JDBCTemplate.getConnection;
import static com.spacefit.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.spacefit.mem.model.vo.Cart;
import com.spacefit.pay.model.dao.PayDao;
import com.spacefit.reservation.model.vo.Book;

public class PayService {
	
	public int getDiscount(String cpNo) {
		Connection conn = getConnection();
		int result = new PayDao().getDiscount(conn, cpNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 쿠폰 x, 요청 x
	public int insertBook1(Cart quickPay, Book book, int amount) { 
		Connection conn = getConnection();
		
		int result = 1;
		int result1 = new PayDao().insertPayListNo(conn, quickPay.getMemNo(), amount); // 쿠폰 x
		int result2 = new PayDao().insertBookNo(conn, quickPay, book); // 요청 x
		
		result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 쿠폰 x, 요청 o
	public int insertBook2(Cart quickPay, Book book, int amount) { 
		Connection conn = getConnection();
		
		int result = 1;
		int result1 = new PayDao().insertPayListNo(conn, quickPay.getMemNo(), amount); // 쿠폰 x
		int result2 = new PayDao().insertBookContent(conn, quickPay, book); // 요청 o
		
		result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 쿠폰 o, 요청 x
	public int insertBook3(String cpNo, Cart quickPay, Book book, int amount, int discountAmount) { 
		Connection conn = getConnection();
		
		int result = 1;
		int result1 = new PayDao().insertPayListCoupon(conn, quickPay.getMemNo(), cpNo, amount, discountAmount); // 쿠폰 o
		int result2 = new PayDao().insertBookNo(conn, quickPay, book); // 요청 x
		int result3 = new PayDao().deleteCoupon(conn, quickPay.getMemNo(), cpNo); // 쿠폰 사용하고 삭제
		result = result1 * result2 * result3;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 쿠폰 o, 요청 o
	public int insertBook4(String cpNo, Cart quickPay, Book book, int amount, int discountAmount) { 
		Connection conn = getConnection();
		
		int result = 1;
		int result1 = new PayDao().insertPayListCoupon(conn, quickPay.getMemNo(), cpNo, amount, discountAmount); // 쿠폰 o
		int result2 = new PayDao().insertBookContent(conn, quickPay, book); // 요청 o
		int result3 = new PayDao().deleteCoupon(conn, quickPay.getMemNo(), cpNo); // 쿠폰 사용하고 삭제
		result = result1 * result2 * result3;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Cart selectCart(int spaceNo) {
		Connection conn = getConnection();
		
		Cart cartPay = new PayDao().selectCart(conn, spaceNo);
		close(conn);
		return cartPay;
	}
	
	// 결제 후 장바구니에서 삭제
	public int deleteCart(int spaceNo) { 
		Connection conn = getConnection();
		
		int result = 0;
		result = new PayDao().deleteCart(conn, spaceNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}

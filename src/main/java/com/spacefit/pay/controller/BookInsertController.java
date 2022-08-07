package com.spacefit.pay.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.vo.Cart;
import com.spacefit.mem.model.vo.Member;
import com.spacefit.pay.model.service.PayService;
import com.spacefit.reservation.model.vo.Book;

/**
 * Servlet implementation class BookInsertController
 */
@WebServlet("/insert.book")
public class BookInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
        
		// payView에서 cart 객체 만들값들
		int spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		
		String date = request.getParameter("date");
		String arr[] = date.split("-");
		date = arr[0]+"."+arr[1]+"."+arr[2];
		
		String detailCI = request.getParameter("in");
		String detailCO = request.getParameter("out");
		String park = request.getParameter("park");
		String animal = request.getParameter("animal");
		String stand = request.getParameter("stand");
		String chair = request.getParameter("chair");

		int amount = Integer.parseInt(request.getParameter("beforeDiscount"));
		int discountAmount = amount;
		String name = request.getParameter("name");
		String cpNo = request.getParameter("cpNo");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String purpose = request.getParameter("purpose");
		String bookContent = request.getParameter("bookContent");
		
		// 쿠폰 사용하는 경우 총 금액 변경해줌
		if( !cpNo.equals("")) {
			int discount = new PayService().getDiscount(cpNo);
			discountAmount -= discount;
		}
		//
		
		Cart quickPay = new Cart(memNo, spaceNo, limit, date, detailCI, detailCO, park, animal, stand, chair, discountAmount);
		
		Book book = new Book();
		book.setBookName(name);
		book.setBookPhone(phone);
		book.setBookEmail(email);
		book.setBookPurpose(purpose);
		if( !bookContent.equals("")) {
			book.setBookAddContent(bookContent);
		}
		//
		int result = 1;
		
		if(cpNo.equals("")) {
				if(bookContent.equals("")) { // 쿠폰 x, 요청 x 1
					result = new PayService().insertBook1(quickPay, book, amount);
				}else { // 쿠폰 x,요청 o 2
					result = new PayService().insertBook2(quickPay, book, amount);
				}
			//result = new PayService().insertBook(memNo);

		}else {
			
			if(bookContent.equals("")) { // 쿠폰 o, 요청 x 3
				result = new PayService().insertBook3(cpNo, quickPay, book, amount, discountAmount);
			}else { // 쿠폰 o,요청 o 4
				result = new PayService().insertBook4(cpNo, quickPay, book, amount, discountAmount);
			}
			
		}
		
		
		int result2 = new PayService().deleteCart(quickPay);
		
		if(result * result2 > 0) {
			request.getRequestDispatcher("views/user/myPage/reservationListView.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/bolist.bo");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
package com.spacefit.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spacefit.mem.model.vo.Member;

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
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String spaceNo = request.getParameter("spaceNo");
		String cpNo = request.getParameter("cpNo");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String rsvFor = request.getParameter("rsvFor");
		String bookContent = request.getParameter("bookContent");
		String beforeDiscount = request.getParameter("beforeDiscount");
		
		
		if(rsvFor.equals("") || bookContent.equals("") || cpNo.equals("")) {
			System.out.println("미입력");
			//int result = new PayService().insertPaylist(memNo);
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

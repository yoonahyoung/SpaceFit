package com.spacefit.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spacefit.reservation.model.service.BookService;
import com.spacefit.reservation.model.vo.Book;

/**
 * Servlet implementation class BookUpdateController
 */
@WebServlet("/bupdate.bo")
public class BookUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		request.setCharacterEncoding("UTF-8");
		
		int bookNo = Integer.parseInt(request.getParameter("no"));
		int bookCount = Integer.parseInt(request.getParameter("bookCount"));
		String bookCar = request.getParameter("bookCar");
		String bookAnimal = request.getParameter("bookAnimal");
		String bookChair = request.getParameter("bookChair");
		String bookStand = request.getParameter("bookStand");
		String bookName = request.getParameter("bookName");
		String bookPhone = request.getParameter("bookPhone");
		String bookEmail = request.getParameter("bookEmail");
		String bookPurpose = request.getParameter("bookPurpose");
		String bookContent = request.getParameter("bookContent");
		
		Book b = new Book(bookNo, bookCount, bookName, bookPhone, bookEmail, bookPurpose, bookContent, bookCar, bookAnimal, bookChair, bookStand);
		
		int result = new BookService().updateBook(b);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/bdetail.bo?no=" + bookNo);
			
		}else {
			// request.setAttribute("errorMsg", "일반게시글 수정에 실패했습니다");
			//request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
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

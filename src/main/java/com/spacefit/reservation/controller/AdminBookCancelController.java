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
 * Servlet implementation class AdminBookCancelController
 */
@WebServlet("/abdelete.bo")
public class AdminBookCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int bookNo = Integer.parseInt(request.getParameter("no"));
		String bookCancelReason = request.getParameter("bCancelReason");
		String bookCancelContent = request.getParameter("bCancelContent");
		
		Book b = new Book();
		b.setBookNo(bookNo);
		b.setBookCancleReason(bookCancelReason);
		b.setBookCancelContent(bookCancelContent);
		
		int result = new BookService().deleteBook(b);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "예약삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/aBookList.bo");
		} else {
			request.setAttribute("errorMsg", "후기삭제에 실패했습니다. 고객센터에 연락해주십시오");
			request.getRequestDispatcher("views/user/common/backAlertErrorPage.jsp").forward(request, response);
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

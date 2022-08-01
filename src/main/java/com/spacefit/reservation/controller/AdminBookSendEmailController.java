package com.spacefit.reservation.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminBookSendEmailController
 */
@WebServlet("/sendEmail.bo")
public class AdminBookSendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookSendEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		String bookName = request.getParameter("bookName");
		String bookEmail = request.getParameter("bookEmail");
		String spaceNo = request.getParameter("spaceNo");
		String bookDate = request.getParameter("bookDate");
		String bookDateTime = request.getParameter("bookDateTime");
		String bookCount = request.getParameter("bookCount");
		String sendContent = request.getParameter("sendContent");
		
		 try {
	            String mail_from =  "<wwlaal0512@gmail.com>";
	            String mail_to =   bookEmail;
	            String title =     "안녕하세요. spaceFit입니다.";
	            String contents =   "공간 : " + spaceNo + " , 날짜 : " 
	            					+ bookDate + " " + bookDateTime + "으로 예약해주셨습니다. "
	            					+ "  당부의 말씀으로 " + sendContent; 
	            			
	 
	            mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
	            mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
	 
	            Properties props = new Properties();
	            props.put("mail.transport.protocol", "smtp");
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "465");
	            props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.socketFactory.port", "465");
	            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            props.put("mail.smtp.socketFactory.fallback", "false");
	            props.put("mail.smtp.auth", "true");
	 
	            Authenticator auth = new SMTPAuthenticator();
	 
	            Session sess = Session.getDefaultInstance(props, auth);
	 
	            MimeMessage msg = new MimeMessage(sess);
	 
	            msg.setFrom(new InternetAddress(mail_from));
	            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
	            msg.setSubject(title, "UTF-8");
	            msg.setContent(contents, "text/html; charset=UTF-8");
	            msg.setHeader("Content-type", "text/html; charset=UTF-8");
	 
	            Transport.send(msg);
	 
	            response.sendRedirect(request.getContextPath() + "/abdetail.bo?no=" + bookNo);
	        } catch (Exception e) {
	            
	        } finally {
	        	
	        }
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

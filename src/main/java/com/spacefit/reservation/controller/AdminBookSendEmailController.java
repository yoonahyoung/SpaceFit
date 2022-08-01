package com.spacefit.reservation.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



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
				
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		String bookName = request.getParameter("bookName");
		String bookEmail = request.getParameter("bookEmail");
		String spaceNo = request.getParameter("spaceNo");
		String bookDate = request.getParameter("bookDate");
		String bookDateTime = request.getParameter("bookDateTime");
		String bookCount = request.getParameter("bookCount");
		String sendContent = request.getParameter("sendContent");
		
		
		//mail server 설정
        String host = "smtp.naver.com";
        String user = "spacefit49@naver.com"; //자신의 네이버 계정
        String password = "YFH9Y1U6LSJB";//자신의 네이버 패스워드
        
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
		
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "spacefit"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(bookEmail));
            
            //메일 제목
            msg.setSubject("안녕하세요. "+ bookName + "님 spaceFit입니다.");
            //메일 내용
            msg.setText("공간 : " + spaceNo 
            			+ "\n인원 : " + bookCount
            			+ "\n날짜 : " + bookDate + " " + bookDateTime + " 으로 예약해주셨습니다. \n\n"
            			+ "당부의 말씀으로 \n" + sendContent);
            
            Transport.send(msg);
            //System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
          
        response.sendRedirect(request.getContextPath() + "/abdetail.bo?no=" + bookNo);
		
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

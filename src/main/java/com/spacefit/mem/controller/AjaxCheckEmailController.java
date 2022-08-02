package com.spacefit.mem.controller;

import java.io.IOException;
import java.util.Properties;

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

import com.spacefit.common.controller.TestSms;

/**
 * Servlet implementation class AjaxCheckEmailController
 */
@WebServlet("/checkEmail.me")
public class AjaxCheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memMail = request.getParameter("memMail");
		String randomNo = new TestSms().testMail();

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
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(memMail));
            
            //메일 제목
            msg.setSubject("SpaceFit 회원가입을 위한 인증메일입니다.");
            //메일 내용
            msg.setText("안녕하세요. SpaceFit입니다. \n\n"
            			+ "회원님께서는 SpaceFit에 가입하고 계십니다."
            			+ "SpaceFit에 가입하시면 좋은 혜택과 쿠폰이 회원님을 기다리고 있어요!"
            			+ "혹시라도 가입중이 아니시라면 070-8847-9500 SpaceFit으로 연락부탁드립니다."
            			+ "회원가입 창에 인증번호를 적어주세요"
            			+  randomNo
            			+ "\n\n"
            			+ "회원가입해주셔서 감사합니다. \n\n\n"
            			+ "------------------------------------------------\n"
            			+ "서울시 금천구 가산디지털2로 115 (대륭테크노타운 3차) 1109-1호\r\n"
            			+ "Tel 070-8847-9500(9513) Mobile +82 010-123-4567\r\n"
            			+ "Mail esy@goodee.co.kr Fax 02-2108-5909\r\n"
            			+ "Homepage http://localhost:8200/SpaceFit \r\n"        			
            		
            		);
            
            Transport.send(msg);
            //System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        response.getWriter().print(randomNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

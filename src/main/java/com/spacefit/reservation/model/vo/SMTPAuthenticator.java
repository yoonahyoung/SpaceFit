package com.spacefit.reservation.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator  extends Authenticator {
	
	public SMTPAuthenticator() {
	
		}
		
	public PasswordAuthentication getPasswordAuthentication() {
	String username = "spacefit49@naver.com";
	String password = "YFH9Y1U6LSJB";
	return new PasswordAuthentication(username, password);
	    }
		
}

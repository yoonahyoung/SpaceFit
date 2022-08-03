package com.spacefit.common.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwdHashController {
	
	public static String encoding(String beforeMemPwd) {
		
		String memPwd = "";
		
		try {
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(beforeMemPwd.getBytes());
			
			byte[] encodeData = md.digest();
			for(int i=0; i<encodeData.length; i++) {
				memPwd += Integer.toHexString(encodeData[i]&0xFF);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return memPwd;
	}

}

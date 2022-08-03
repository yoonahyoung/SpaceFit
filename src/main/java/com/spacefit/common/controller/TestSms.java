package com.spacefit.common.controller;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import com.spacefit.mem.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class TestSms {
	
  public String testMessage(String memPhone) {
	  Random rand = new Random();
	  String randomNo = "";
	  for(int i=0; i<6; i++) {
		  String ran = Integer.toString(rand.nextInt(10));
		  randomNo += ran;
	  }
	  System.out.println("TestSms에서 확인하는 randomNo" +randomNo);
	  //=> 실제 회원가입할때만 사용!
	  //certifiedPhoneNumber(memPhone, randomNo);
	  return randomNo;
	  
  }
  
  public String testMail() {
	  Random rand = new Random();
	  String randomNo = "";
	  for(int i=0; i<6; i++) {
		  String ran = Integer.toString(rand.nextInt(10));
		  randomNo += ran;
	  }
	  System.out.println("TestMail에서 확인하는 randomNo" +randomNo);
	  return randomNo;
	  
  }
  
  
  public static void certifiedPhoneNumber(String memPhone, String  randomNo) {
    String api_key = "NCSGPPD1D13FRKZH";
    String api_secret = "TJXBIIKXZSHZBK6TZINODIDSDC28EX0G";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", memPhone);
    params.put("from", "01026732246");
    params.put("type", "SMS");
    params.put("text", "스페이스핏 인증 메시지 : 인증번호는 [" +  randomNo + "] 입니다.");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }

}
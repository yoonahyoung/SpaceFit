<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 비밀번호 재설정</title>
<style>
		
</style>
</head>
<body>
	<!-- MENUBAR MEMBER CSS 연동 -->
	<%@ include file="../common/userMenubar.jsp" %>
	<link rel="stylesheet" href="<%=contextPath %>/resources/user/css/member.css?ver=1">
	
	<div style="height : 200px"></div>
        
    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">
                        	<a href="<%=contextPath %>/idSearch.me" id="idSearch" class="find">아이디 찾기&nbsp</a>
                    		<span>|</span>
                    		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="find" style="color:#0D6EFD;">&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <br>
                        
                        <form class="agreement">
                    	
                    		
                            <table align="center">
		                           <tr>
		                           	<td class="phone">
		                           		<div class="phone box">
				                            <span class="material-icons">
				                                phone_iphone
				                            </span>
				                            <br>
				                            <span class="picon-span">  
				                                휴대전화인증
				                            </span>
	                       				 </div>
		                           	</td>
		                           </tr>
		                           <tr>
		                          	<td class="phone">
		                          	<div style="height : 20px"></div>
		                           		<label for="agree">
				                            	<div class="agreeInput">
				                            		  <input type="checkbox" name="phoneAgree" value="4">
				                                	  <span>휴대폰 인증 이용약관 동의<strong>(필수)</strong></span>
				                            	</div>
												<div class="agreeBox">
				                                    <div>1. 수집항목
- 이용자의 성명, 이동전화번호, 가입한 이동전화 회사, 생년월일, 성별
- 연계정보(CI), 중복가입확인정보(DI)
- 이용자가 이용하는 웹사이트 또는 Application 정보, 이용일시
- 내외국인 여부
- 가입한 이동전화회사 및 이동전화브랜드

2. 이용목적
- 이용자가 웹사이트 또는 Application에 입력한 본인확인정보의 정확성 여부 확인(본인확인서비스 제공)
- 해당 웹사이트 또는 Application에 연계정보(CI)/중복가입확인정보(DI) 전송
- 서비스 관련 상담 및 불만 처리 등
- 이용 웹사이트/Application 정보 등에 대한 분석 및 세분화를 통한, 이용자의 서비스 이용 선호도 분석

3. 개인정보의 보유기간 및 이용기간
- 이용자가 서비스를 이용하는 기간에 한하여 보유 및 이용. 다만, 아래의 경우는 제외
- 법령에서 정하는 경우 해당 기간까지 보유(상세 사항은 회사의 개인정보취급방침에 기재된 바에 따름)

4. 본인확인서비스 제공을 위한 개인정보의 취급위탁
수탁자 : (주)다날, (주)드림시큐리티, (주)케이지모빌리언스, (주)한국사이버결제, 한국모바일인증(주), 수미온(주), SK플래닛(주), NICE평가정보(주), 서울신용평가정보(주)
취급위탁 업무 : 본인확인정보의 정확성 여부 확인(본인확인서비스 제공), 연계정보(CI)/중복가입확인정보(DI) 생성 및 전송, 서비스 관련 상담 및 불만 처리, 휴대폰인증보호 서비스, 이용자의 서비스 이용 선호도 분석정보 제공관련 시스템 구축·광고매체 연동 및 위탁영업 등
※ 수탁자의 상세 개인정보 취급 위탁 내용은 각 수탁자가 정하는 절차와 방법에 따라 수탁자 홈페이지 등에 게시된 수탁자의 개인정보 취급방침 및 제3자 제공 동의 방침 등에 따릅니다.

5. 위 개인정보 수집·이용 및 취급위탁에 동의하지 않으실 경우, 서비스를 이용하실 수 없습니다.</div>
				                                </div>
	                            		</label>
		                           	</td>
		                           </tr>
                            </table>
           
                    	</form>
                    	
	                    <br>
                        <form class="signInForm" action="<%=contextPath%>/pwdChangeTwo.me">
                        	<div class="inputs">
                        	
                        		<label for="#phoneNameCheck" class="signInLabel">이름</label> <span class="memName"  style="text-align:rignt"></span>
                                <input type="text" placeholder="가입하셨던 이름을 입력해주세요." class="signInInput" id="memName" name="memName" required>
                        		<br><br>
                        		
                        		<label for="#phoneIdNo" class="signInLabel">핸드폰번호</label> <span class="pHoneAnswer" style="text-align:rignt"></span>
                                <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="signInInput" id="memPhone" name="memPhone" required>
                                <button type="button" class="btn btn-secondary getIdNoBtn" onclick="phoneSearch();">인증번호 받기</button><br><br>
                                <input type="hidden" id="hideRandomNo" name="hideRandomNo">
								<input type="hidden" id="hideMemNo" name="hideMemNo">
								
                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 작성</label> <span class="accountAnswer"  style="text-align:rignt"></span>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="smsNoCheck" name="smsNoCheck" required>
                                <button type="button" class="btn btn-primary getIdNoBtn" name="phoneIdNoCheck" onclick="checkSms();">확인</button><br><br>
                            	
                        	</div>
                        <hr>
	                        <span class="already">본인확인이 되셨다면 비밀번호를 바꿔볼까요?</span>
	                        <div style="height : 10px"></div>
	                        <button class="btn btn-primary nextBtn" type="submit">비밀번호 재설정하러 가기!</button><br>
	                        <script>
	                        
	                        	
	                        	 
	                        	 
	                        	 function phoneSearch(){
	                        		 let memPhoneVal = document.getElementById("memPhone").value;
	                        		 
	                        		 
	                        		 $.ajax({
                        	    		 url:"phoneSearch.me",
                        	    		 data:{
                        	    			 memPhone:memPhoneVal //$("#memPhone").val()
                        	    		 },
                        	    		 type:"post",
                        	    		 success:function(memNo){
                        	    			if (memNo > 0) {
                        	    				// 비밀번호 재설정할 때 memNo 가 필요함!
                        	    				let value= memNo
	                        	    			$('input[name=hideMemNo]').attr('value',value);
                        	    				sms()
                        	    			} else {
                        	    				alert("일치하는 회원이 없습니다. 다시 확인해주세요.");
                        	    			}
                        	    		 },
                        	    		 error:function(){
                        	    			console.log("인증번호 전송통신 ajax 실패")
                        	    		 }
                        	    		 
                        	    	 })
	                        	 }
	                        	 
	                        	 function sms(){
	                        		
	                        		 
	                        		 let memPhoneVal = document.getElementById("memPhone").value;
	                        		// let memNoInputVal = document.getElementById("memNoInput").value;
	                        		 const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	                        		 
	                        	     if (regPhone.test(memPhoneVal) === true) {
	                        	    	let value=" <span id='validPhone' style='font-size:11px;'>핸드폰으로 인증문자 전송완료!</span>"
	                        			$(".signInForm .pHoneAnswer").html(value)
	                        	    	 
	                        	    	 
	                        	    	 $.ajax({
	                        	    		 url:"sms.me",
	                        	    		 data:{
	                        	    			 memPhone:memPhoneVal //$("#memPhone").val()
	                        	    			 
	                        	    		 },
	                        	    		 type:"post",
	                        	    		 success:function(randomNo){
	                        	    			let value= randomNo
	                        	    			$('input[name=hideRandomNo]').attr('value',value);
	                        	    		 },
	                        	    		 error:function(){
	                        	    			console.log("인증번호 전송통신 ajax 실패")
	                        	    		 }
	                        	    		 
	                        	    	 })
	                        	    	$("#memPhone").removeAttr("disabled");
	                        	    	$("#memPhone").attr("readOnly", true);
	                        	    	 
	                        	     } else {
	                        	    	 let value=" <span id='validPhone' style='font-size:11px; color : red;'>올바른 형태의 핸드폰번호를 입력해주세요!</span>"
	                        	         $(".signInForm .pHoneAnswer").html(value)
	                        	         $("#memPhone").focus();
	                        	     }

	                        	 }
	                        	 
	                        	 
	                        	 
	                        </script>
	                   </form>
            	</div> 
          	</div>	
          </div>
          <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
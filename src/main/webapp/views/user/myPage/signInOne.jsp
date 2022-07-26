<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import ="com.spacefit.mem.model.vo.Member" %> 
<%
	Member m = (Member)request.getAttribute("m");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 회원가입</title>
<style>
		
</style>
</head>
<body>
	<!-- MENUBAR MEMBER CSS 연동 -->
	<%@ include file="../common/userMenubar.jsp" %>
	<link rel="stylesheet" href="<%=contextPath %>/resources/user/css/member.css?ver=1">

        
    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입</h4><br>
                    	<form class="agreement">
                    	
                    		<div>
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span>모두 동의합니다</span><br><hr>
                            </div>
                            <table align="center">
                            	<tr>
		                           	<td>
		                           		<label for="agree">
		                           			<div class="agreeInput">
		                           				 <input type="checkbox" name="agree1" id="agree1" value="1">
		                                    	 <span>이용약관 동의<strong>(필수)</strong></span>
		                           			</div>
		                                    <div class="agreeBox">
		                                    	<span>나중에 민아님 페이지에서 얻어올 이용약관 1</span>
		                                   	</div>
		                            	</label>
		                           	</td>
		                           </tr>
		                           <tr>
		                           	<td>
		                           		<label for="agree">
			                            	<div class="agreeInput">
				                                <input type="checkbox" name="agree" id="agree2" value="2">
				                                <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
				                            </div>
			                                <div class="agreeBox">
			                                    <span>나중에 민아님 페이지에서 얻어올 이용약관 2</span>
			                                </div>
		                            	</label>
		                           	</td>
		                           </tr>
		                           <script>
		                           if (document.getElementById('agree1').checked == false) {
		                        	   alert('체크하셔야 합니다.');
		                        	 return false;
		                        	 }
		                           
		                           if (document.getElementById('agree2').checked == false) {
		                        	   alert('체크하셔야 합니다.');
		                        	 return false;
		                        	 }
		                           </script>
		                           <!-- 
			                           <tr>
			                           	<td>
			                           		<label for="agree">
				                            	<div class="agreeInput">
				                            		 <input type="checkbox" name="agree" value="3">
				                                	<span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
				                            	</div>
				                                <div class="agreeBox">
				                                   <span>나중에 민아님 페이지에서 얻어올 이용약관 3</span>
				                                </div>
			                            	</label>
			                           	</td>
			                           </tr>
			                        -->
			                       <tr style="height:20px;"></tr>
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
		                            <tr style="height:10px;"></tr>
		                           </tr>
		                          	<td class="phone">
		                           		<label for="agree">
				                            	<div class="agreeInput">
				                            		  <input type="checkbox" name="phoneAgree" value="4">
				                                	  <span>휴대폰 인증 이용약관 동의<strong>(필수)</strong></span>
				                            	</div>
												<div class="agreeBox">
				                                    <span>나중에 민아님 페이지에서 얻어올 휴대폰 이용약관</span>    
				                                </div>
	                            		</label>
		                           	</td>
		                           </tr>
                            </table>
                    	</form>
                    	
	                    <br>
                        <form class="signInForm">
                        	<div class="inputs">
                        	
                        		<label for="#phoneIdNo" class="signInLabel">핸드폰번호</label>
                                <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="signInInput" id="memPhone" name="memPhone">
                                <button type="submit" class="btn btn-secondary getIdNoBtn" onclick="sms();">인증번호 받기</button><br><br>
                                <script>
						         
							         // ajax로 인증번호 보내고 회원폰번호, 전송된 인증번호 기록
							         function sms(){
							        	 $.ajax({
							        		 url:"<%=contextPath%>/sms.me",
							        		 data:{
							        			 memPhone:$("#memPhone").val()
							        		 },
							        		 type:"post",
							        		 success:function(m){
							        			console.log(m.getMemPhone())
							        			console.log(m.getRandomNo())
							        		 },
							        		 error:function(){
							        			console.log("인증번호 전송통신 ajax 실패")
							        		 }
							        		 
							        	 })
							         }
						         </script>
                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 작성</label>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="smsNoCheck" name="smsNoCheck">
                                <button type="submit" class="btn btn-primary getIdNoBtn" name="phoneIdNoCheck" onclick="checkSms();">확인</button><br><br>
                                <div class="accountAnswer"></div>
                                
                                 <script>
						         
							         // ajax로 인증번호 보내고 회원폰번호, 전송된 인증번호 기록
							         function checkSms(){
							        	 $.ajax({
							        		 url:"<%=contextPath%>/smsTest.me",
							        		 data:{
							        			 smsNoCheck:$("#smsNoCheck").val(),
							        			 randomNo:m.getRandomNo()
							        		 },
							        		 type:"post",
							        		 // 여기까지 하면 현재 jsp에 있는 전달받은 랜덤번호랑 사용자가 적은 번호를 서블릿으로 보내게 됨
							        		 success:function(result){
							        			if(result > 0){
							        				console.log("인증번호 확인 완료")
							        				let value=" <span id='validMessage'>인증번호 확인 완료!</span>"
							        				$(".signInForm .accountAnswer").html(value)
							         				}
							         				
							        			}
							        		 },
							        		 error:function(){
							        			console.log("인증번호 전송통신 ajax 실패");
							        		 }
							         
							        	 })
							         }
						         </script>
                            
                        	</div>
                        <hr>
	                        <span class="already">인증을 축하드립니다! 거의 다 왔어요!</span>
	                        <button class="btn btn-primary nextBtn" type="button">다음 단계로 이동</button><br>
	                   </form>
	                  </div>
                </div>
          </div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
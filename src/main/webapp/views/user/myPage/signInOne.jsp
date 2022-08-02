<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 


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

     <div style="height : 50px"></div>

    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입</h4><br>
                    	<form class="agreement"  method="post">
                    	
                    		<div>
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span>모두 동의합니다</span><br><hr>
                            </div>
                            <table align="center">
                            	<tr>
		                           	<td>
		                           		<label for="agree">
		                           			<div class="agreeInput">
		                           				 <input type="checkbox" name="agree" id="agree1" value="1" required>
		                                    	 <span style="font-size:13px;">이용약관 동의<strong>(필수)</strong></span>
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
				                                <input type="checkbox" name="agree" id="agree2" value="2" required>
				                                <span style="font-size:13px;">개인정보 수집, 이용 동의<strong>(필수)</strong></span>
				                            </div>
			                                <div class="agreeBox">
			                                    <span>나중에 민아님 페이지에서 얻어올 이용약관 2</span>
			                                </div>
		                            	</label>
		                           	</td>
		                           </tr>
		                         
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
				                            		  <input type="checkbox" name="phoneAgree" value="3" required>
				                                	  <span style="font-size:13px;">휴대폰 인증 이용약관 동의<strong>(필수)</strong></span>
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
                        <form class="signInForm"  method="post">
                        	<div class="inputs">
                        		
                        		<label for="#phoneNameCheck" class="signInLabel">이름</label> <span class="memName"  style="text-align:rignt"></span>
                                <input type="text" placeholder="가입하실 이름을 입력해주세요." class="signInInput" id="memName" name="memName" required>
                        		<br><br>
                        	
                        		<label for="#phoneIdNo" class="signInLabel">핸드폰번호</label> <span class="pHoneAnswer" style="text-align:rignt"></span>
                                <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="signInInput" id="memPhone" name="memPhone" required>
                                <button type="button" class="btn btn-secondary getIdNoBtn" onclick="sms();">인증번호 받기</button><br><br>
                                <input type="hidden" id="hideRandomNo" name="hideRandomNo">
                                <script>
						         // js1
						         </script>

                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 작성</label> <span class="accountAnswer"  style="text-align:rignt"></span>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="smsNoCheck" name="smsNoCheck" required>
                                <button type="button" class="btn btn-primary getIdNoBtn" name="phoneIdNoCheck" onclick="checkSms();">확인</button><br><br>

                                 <script>
						  		// js2
						         </script>
                            
                        	</div>
                        <hr>
	                        <span class="already">힘내요! 이제 거의 다 왔어요!</span>
							<div style="height:10px;"></div>
	                        <button class="btn btn-primary nextBtn" type="button" onclick="signInTwo();">다음 단계로 이동</button><br>
	                       <script>
								// js3
	                        </script>
	                   </form>
                        <form action="<%=contextPath %>/signInTwo.me" method="post" id="phoneForm">
                        	<input type="hidden" name="memPhone" value="" id="memPhoneSubmit">
                        	<input type="hidden" name="memName" value="" id="memNameSubmit">
                        </form>
          <div style="height : 100px"></div>
          <%@ include file="../common/userFooter.jsp" %>
          
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
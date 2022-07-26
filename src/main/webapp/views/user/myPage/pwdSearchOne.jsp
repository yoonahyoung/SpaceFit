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
                        	<a href="" id="idSearch" class="find">아이디 찾기&nbsp</a>
                    		<span>|</span>
                    		<a href="" id="pwdSearch" class="find" style="color:#0D6EFD;">&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <br>
                        
                        <form class="agreement">
                    	
                    		
                            <table align="center">
		                           <tr>
		                           	<td class="phone">
		                           		<div  class="mail box">
				                            <span class="material-icons">
				                                mail_outline
				                                </span>
				                            <br>
				                            <span class="micon-span">  
				                                이메일 인증
				                            </span>
				                            <br>
				                        </div>
		                           	</td>
		                           </tr>
			                          	<td>
			                           		<label for="agree">
					                            	<div class="agreeInput">
					                            		  <input type="checkbox" name="emailAgree" value="">
					                                	  <span>이메일 인증 이용약관 동의<strong>(필수)</strong></span>
					                            	</div>
													<div class="agreeBox">
					                                    <span>나중에 민아님 페이지에서 얻어올 이메일 이용약관</span>    
					                                </div>
		                            		</label>
			                           	</td>
		                           </tr>
                            </table>
           
                    	</form>
                    	
	                    <br>
                        <form class="signInForm">
                        	<div class="inputs">
                        	
                        		<label for="#phoneIdNo" class="signInLabel">이메일주소</label>
                                <input type="text" placeholder="이메일주소를 입력해주세요" class="signInInput" id="email" name="email">
                                <button type="submit" class="btn btn-secondary getIdNoBtn" name="email">인증번호 받기</button><br><br>
                                
                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 확인</label>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="emailNoCheck" name="emailNoCheck">
                                <button type="submit" class="btn btn-primary getIdNoBtn" name="emailNoCheckBtn">확인</button><br><br>
                            
                        	</div>
                        <hr>
	                        <span class="already">인증을 축하드립니다! 비밀번호를 바꿔볼까요?</span>
	                        <button class="btn btn-primary nextBtn" type="button">비밀번호 재설정하러 가기!</button><br>
	                   </form>
            	</div> 
          	</div>	
          </div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
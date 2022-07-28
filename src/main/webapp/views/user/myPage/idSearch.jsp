<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 아이디찾기</title>
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
                        <h4 class="h4forLgnNSign">
                        	<a href="<%=contextPath %>/idSearch.me" id="idSearch" class="find" style="color:#0D6EFD;">아이디 찾기&nbsp</a>
                    		<span>|</span>
                    		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="find">&nbsp비밀번호 재설정</a>
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
                        	
                        		<label for="#phoneNameCheck" class="signInLabel">이름</label> <span class="memName"  style="text-align:rignt"></span>
                                <input type="text" placeholder="가입하셨던 이름을 입력해주세요." class="signInInput" id="memName" name="memName" required>
                        		<br><br>
                        		
                        		<label for="#phoneIdNo" class="signInLabel">핸드폰번호</label> <span class="pHoneAnswer" style="text-align:rignt"></span>
                                <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="signInInput" id="memPhone" name="memPhone" required>
                                <button type="button" class="btn btn-secondary getIdNoBtn" onclick="sms();">인증번호 받기</button><br><br>
                                <input type="hidden" id="hideRandomNo" name="hideRandomNo">

                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 작성</label> <span class="accountAnswer"  style="text-align:rignt"></span>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="smsNoCheck" name="smsNoCheck" required>
                                <button type="button" class="btn btn-primary getIdNoBtn" name="phoneIdNoCheck" onclick="checkSms();">확인</button><br><br>
                            
                        	</div>
                        <hr>
	                        <span class="already">인증을 축하드립니다! 아이디를 확인하러 가요!</span>
	                        <div style="height:10px;"></div>
	                        <button class="btn btn-primary nextBtn" type="button" onclick="signInTwo();">아이디 확인하기!</button><br>
	                   </form>
	                   <form action="<%=contextPath %>/idSearchResult.me" method="post" id="phoneForm">
                        	<input type="hidden" name="memPhone" value="" id="memPhoneSubmit">
                        	<input type="hidden" name="memName" value="" id="memNameSubmit">
                       </form>
            	</div> 
          	</div>	
          </div>
	<div style="height : 100px"></div>
    <%@ include file="../common/userFooter.jsp" %>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
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
		                           				 <input type="checkbox" name="agree" value="1">
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
				                                <input type="checkbox" name="agree" value="2">
				                                <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
				                            </div>
			                                <div class="agreeBox">
			                                    <span>나중에 민아님 페이지에서 얻어올 이용약관 2</span>
			                                </div>
		                            	</label>
		                           	</td>
		                           </tr>
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
                        	
                        		<label for="#phoneIdNo" class="signInLabel">핸드폰번호</label>
                                <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="signInInput" id="phoneIdNo">
                                <button type="submit" class="btn btn-secondary getIdNoBtn" name="phoneIdNo">인증번호 받기</button><br><br>
                                
                                <label for="#phoneIdNoCheck" class="signInLabel">인증번호 받기</label>
                                <input type="text" placeholder="인증번호를 입력해주세요" class="signInInput" id="phone">
                                <button type="submit" class="btn btn-primary getIdNoBtn" name="phoneIdNoCheck">확인</button><br><br>
                            
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
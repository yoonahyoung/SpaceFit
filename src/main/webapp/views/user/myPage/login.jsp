<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit 로그인</title>
<link rel="stylesheet" href="../../../resources/user/css/userLoginAndSignIn.css">
<style>
	
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp" %>
	
	<div style="height : 200px"></div>
        
       <div class="outer">
       	<div class="blueShadow text-center">
         <div class="forPadding">
                    <form action="<%=contextPath %>/login.me" method="post" class="login">
                        <h4 class="h4forLgnNSign">로그인</h4>
                        <input type="text" placeholder="아이디" class="login-input" name="memId" required><br>
                        <input type="password" placeholder="비밀번호" class="login-input" name="memPwd" required><br>
                        <button class="btn btn-primary basicLogin" type="submit">로그인</button><br>
                        <input type="radio" id="always-login"><label for="always-login" class="always-login">&nbsp 로그인 상태 유지</label><br>
                        <hr style="color:  #0D6EFD;">
                        <h4>
                        <br>	
                        	<a href="" id="idSearch" class="find" style="color:grey; font-size:16px;">아이디 찾기&nbsp</a>
                    		<span style="color:grey; font-size:16px;">|</span>
                    		<a href="" id="pwdSearch" class="find" style="color:grey; font-size:16px;"s>&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <hr style="color:  #0D6EFD;"><br>
                    </form>
                    <div class="easy-login">
                        <h4 class="h4forLgnNSign">SNS 간편로그인</h4>
                        <button class="goggle-login btn" type="button">구글 로그인</button><br>
                        <button class="kakao-login btn" type="button">카카오 로그인</button>
                        <br><br>
                        <hr style="color:  #0D6EFD;">
                        <br>
                    </div>
                    <div class="sign-in">
                        <span>스페이스핏이 처음이신가요?</span><br>
                        <button class="btn btn-primary signInBtn" type="button">회원가입</button><br>
                    </div>
                </div>
            </div>
          </div>
<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="../../../resources/user/js/userLoginAndSignIn.js"></script>
</body>
</html>
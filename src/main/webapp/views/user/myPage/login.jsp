<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit 로그인</title>
</head>
<body>
	<!-- MENUBAR MEMBER CSS 연동 -->
	<%@ include file="../common/userMenubar.jsp" %>
	<link rel="stylesheet" href="<%=contextPath %>/resources/user/css/member.css?ver=1">
	<div style="height : 50px"></div>
        
       <div class="outer">
       	<div class="blueShadow text-center">
         <div class="forPadding">
                    <form action="<%=contextPath %>/login.me" method="post" class="login">
                        <h4 class="h4forLgnNSign">로그인</h4>
                        <input type="text" placeholder="아이디" class="login-input" name="memId" required><br>
                        <input type="password" placeholder="비밀번호" class="login-input" name="memPwd" required><br>
                        <button class="btn btn-primary basicLogin" type="submit">로그인</button><br>
                        <!--  <input type="radio" id="always-login"><label for="always-login" class="always-login">&nbsp 로그인 상태 유지</label><br> -->
                        <hr style="color:  #0D6EFD;">
                        <h4>
                        <br>	
                        	<a href="<%=contextPath %>/idSearch.me" id="idSearch" class="find" style="color:grey; font-size:16px;">아이디 찾기&nbsp</a>
                    		<span style="color:grey; font-size:16px;">|</span>
                    		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="find" style="color:grey; font-size:16px;">&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <hr style="color:  #0D6EFD;"><br>
                    </form>
                    
                    <div class="easy-login">
                     
                    </div>
                    <div class="sign-in">
                        <span style="color: #0D6EFD;">스페이스핏이 처음이신가요?</span><br>
                        <button class="btn btn-primary signInBtn" type="button" onclick="signIn();">회원가입</button><br>
                        <script>
	                       function signIn(){
	                        	location.href="<%=contextPath %>/signInOne.me"
	                        }
                        </script>
                    </div>
                </div>
            </div>
          </div>
          </div> </div>
          <div style="height : 100px"></div>
          <%@ include file="../common/userFooter.jsp" %>
          
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
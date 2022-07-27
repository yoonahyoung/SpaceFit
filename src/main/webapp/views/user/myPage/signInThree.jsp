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
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입을 축하합니다!</h4><br>
                        		<span class="material-icons giftCard">
                        			card_giftcard
                    			</span>
	                   			<div>
	                   				<span class="welcomeSpan">
	                   					회원가입을 축하합니다! <br>
			                        	로그인 후<br>내 쿠폰함으로 가셔서 <br>
			                        	스페이스핏이 준비한<br> 
			                        	선물을 확인해보세요!<br><br>
	                   				</span>
	                   			</div>
	                   			<br>
	                   			<button class="btn btn-primary nextBtn" type="button" onclick="loginForm();">로그인</button><br>
            	</div> 
          	</div>	
          </div>
          
     <div style="height : 100px"></div>
     <%@ include file="../common/userFooter.jsp" %>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
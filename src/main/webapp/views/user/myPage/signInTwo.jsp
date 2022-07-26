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
	
	<div style="height : 200px"></div>
        
    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입</h4><br>
                        
                        <form class="signInForm">
                        	<div class="inputs">
                        	
                        		<br>
	                                <label for="#userId">아이디</label>
	                                <input type="text" placeholder="아이디를 입력해주세요" class="account-input" id="userId">
	                                <span>아이디는 영문 소문자로 6자 이상 입력해주세요.</span>
	                            <br><br>
	                                <label for="#password">비밀번호</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="password">
	                                <span>비밀번호는 영문 대소문자+숫자+특수문자로 10자 이상입니다.</span>
	                            <br><br>
	                                <label for="#password-check">비밀번호</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="password-check">
	                                <span>비밀번호를 한번 더 입력해주세요.</span>
	                            <br><br>
	                                <label for="#userName">이름</label>
	                                <input type="text" placeholder="이름을 입력해주세요" class="account-input" id="userName">
	                            <br><br><br>
	                                <label for="#userIdNo">주민번호</label>
	                                <div class="row">
	                                    <div class="col-sm">
	                                        <input type="text" placeholder="주민번호 입력" class="account-input" id="userIdNo">
	                                    </div>
	                                    <span>&nbsp-&nbsp</span>
	                                    <div class="col-sm">
	                                        <input type="password" class="account-input" id="userIdNo">
	                                    </div>
	                                </div>
	                            <br><br>
	                                <label for="#phone">전화번호</label>
	                                <input type="text" placeholder="이름을 입력해주세요" class="account-input" id="phone" value="이미 휴대폰 인증받은 번호">   
	                                <br><br>             
	                                <hr>
	                                <br><br>
	                                <span>추가 입력사항입니다!</span>
	                                 <label for="#email">이메일</label>
			                            <input type="email" placeholder="이메일을 입력해주세요" class="account-input" id="email">
			                            <button class="btn btn-secondary">이메일 인증하기</button>
			                        <br><br>
			                        <hr>
			                        <br><br>
			                        <span class="welcome">짜잔 이제 확인만 하세요!<br></span>
		                        	<button class="btn btn-primary nextBtn" type="button">회원가입</button>
		                        	<br><br><br>
	                           </div>
	                   </form>
            	</div> 
          	</div>	
          </div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
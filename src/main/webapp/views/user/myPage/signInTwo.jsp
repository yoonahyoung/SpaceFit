<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.spacefit.mem.model.vo.Member" %> 
<%
	String memPhone = (String)request.getAttribute("memPhone");
	String memName = (String)request.getAttribute("memName");
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
    <div style="height : 50px"></div>   
    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입</h4><br>
                        
                        <form class="signInForm" method="post" action="<%=contextPath%>/insert.me">
                        	<div class="inputs">

                        		<br>
	                                <label for="#memId">아이디</label>
	                                <input type="text" placeholder="아이디를 입력해주세요" class="account-input" id="memId" name="memId" required>
	                                <input type="button" class="btn btn-primary" value="중복확인" style="color:white"  onclick="idCheck();">
	                               <!-- <button type="button" class="btn btn-primary" style="color:white" onclick="idCheck();">중복확인</button> -->
	                                <span id="idSpan">아이디는 4~12자의 영문 대소문자와 숫자로만 입력해주세요</span>
	                            <br><br>
	                                <label for="#memPwd">비밀번호</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="memPwd" name="memPwd" required>
	                                <span>비밀번호는 영문 대소문자+숫자+특수문자로 10자 이상입니다.</span>
	                            <br><br>
	                                <label for="#memPwd-check">비밀번호 확인</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="memPwd-check" required>
	                                <span>비밀번호를 한번 더 입력해주세요.</span>
	                            <br><br>
	                                <label for="#memName">이름</label>
	                                <input type="text" placeholder="이름을 입력해주세요" class="account-input" id="memName" name="memName"  value="<%=memName%>" required readOnly>
	                            <br><br>
	                                <label for="#memIdNo">생년월일</label>
	                                <input type="text" placeholder="생년월일 6자리를 입력하세요." class="account-input" id="memIdNo" name="memIdNo" required>
	                            <br><br>
	                                <label for="#memPhone">핸드폰번호</label>
	                                <input type="text" placeholder="핸드폰번호를 입력해주세요" class="account-input" id="memPhone" name ="memPhone" value="<%=memPhone%>" required readOnly>   
	                                <br><br><br><br>           
	                                <hr>
	                                <br><br>
	                                <div class="addMessege">추가 입력사항입니다! <br>이메일을 등록하면 예약정보를 받아보실 수 있어요!</div>
	                                <label for="#memEmail">이메일</label>
			                        <input type="email" placeholder="이메일을 입력해주세요" class="account-input" id="memMail" name="memMail">
			                        <input type="button" class="btn btn-secondary" style="color:white;" value="이메일 인증하기">
			                        <br><br><br><br>
			                        <hr>
			                        <br><br>
			                        <div class="addMessege">짜잔 이제 확인만 하세요!</div><br>
		                        	<input type="submit" class="btn btn-primary nextBtn" type="submit" style="color:white;" value="회원가입">
		                        	<br><br><br>
	                           </div>
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
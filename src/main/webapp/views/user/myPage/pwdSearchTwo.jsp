<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 아이디찾기</title>
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
			                           	<td>
			                           		<hr>
			                           		<form class="signInForm" style="padding:20px;">
									        	<div class="inputs">
									        		<br><br>
						                                <label for="#password">비밀번호</label>
						                                <input type="password" placeholder="새 비밀밀번호를 입력해주세요" class="account-input" id="password">
						                                <span>비밀번호는 영문 대소문자+숫자+특수문자로 10자 이상입니다.</span>
						                            <br><br>
						                                <label for="#password-check">비밀번호</label>
						                                <input type="password" placeholder="새 비밀번호를 다시 입력해주세요" class="account-input" id="password-check">
						                                <span>비밀번호를 한번 더 입력해주세요.</span>
						                            <br><br>
									        	</div>
								       		</form>
	                        				<hr>
			                           	</td>
		                           </tr>
                            </table>
                    	</form>
                    	
	                    <br>
                        <form class="signInForm">
                        	<div class="inputs">
		                        <label for="#pwdBtn" class="inputLabel">이제는 잊지마세요! :)</label>
		                        <button type="submit" class="btn btn-primary" id="pwdBtn">비밀번호 재설정</button><br>
		                        <br>
                            
                        	</div>
	                   </form>
            	</div> 
          	</div>	
          </div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="../../../resources/user/js/userLoginAndSignIn.js"></script>
</body>
</html>
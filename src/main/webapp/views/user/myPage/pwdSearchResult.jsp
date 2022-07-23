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
			                           		<div id="idMessage">
					                           비밀번호 변경이 완료되었습니다!
	                        				</div>
	                        				<hr>
			                           	</td>
		                           </tr>
                            </table>
                    	</form>
                    	
	                    <br>
                        <form class="signInForm">
                        	<div class="inputs">
                        	
                        		<label for="#pwdBtn" class="inputLabel">혹시 아이디도 모르시나요?</label>
		                        <button type="submit" class="btn btn-secondary" id="pwdBtn">아이디 찾기</button><br>
		                        <br>
		
		                        <label for="#pwdBtn" class="inputLabel">이제 로그인하러 가요!</label>
		                        <button type="submit" class="btn btn-primary" id="pwdBtn">로그인</button><br>
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
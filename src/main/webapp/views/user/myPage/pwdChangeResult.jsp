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
	
	
	<div style="height : 100px"></div>
        
    <div class="outer">
        <div class="blueShadow text-center">
                    <div class="forPadding">
                        <h4 class="h4forLgnNSign">
                        	<a href="<%=contextPath %>/idSearch.me" id="idSearch" class="find">아이디 찾기&nbsp</a>
                    		<span>|</span>
                    		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="find" style="color:#0D6EFD;">&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <br>
                        
                        <form class="agreement">
                            <table align="center">
		                           <tr>
			                           	<td>
			                           		<hr>
			                           		<div id="idMessage">
					                           비밀번호 변경이 완료되었습니다!<br>비밀번호는 스페이스핏 암호화 정책에 따라 안전하게 보관됩니다.
	                        				</div>
	                        				<hr>
			                           	</td>
		                           </tr>
                            </table>
                    	</form>
                    	
	                    <br>
                        <form class="signInForm" method="post">
                        	<div class="inputs">
                        	
                        		<label for="#pwdBtn" class="inputLabel">혹시 아이디도 모르시나요?</label>
		                        <button type="button" class="btn btn-secondary" id="pwdBtn" onclick="idSearch();">아이디 찾기</button><br>
		                        <br>
		                        <script>
		                        	function idSearch(){
		                        		location.href="<%=contextPath%>/idSearch.me";
		                        	}
		                        </script>
		
		                        <label for="#pwdBtn" class="inputLabel">이제 로그인하러 가요!</label>
		                        <button type="button" class="btn btn-primary" id="pwdBtn"  onclick="loginForm();">로그인</button><br>
		                        <br>
                            
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
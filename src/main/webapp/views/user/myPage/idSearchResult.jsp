<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.spacefit.mem.model.vo.Member" %> 
<%
	Member m = (Member)request.getAttribute("searchM");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 아이디찾기</title>
<link rel="stylesheet" href="../../../resources/user/css/member.css?ver=1">
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
                        	<a href="" id="idSearch" class="find" style="color:#0D6EFD;">아이디 찾기&nbsp</a>
                    		<span>|</span>
                    		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="find">&nbsp비밀번호 재설정</a>
                    		<br><br>
                        </h4>
                        <br>
                        
                        <form class="agreement">
                            <table align="center">
		                           <tr>
			                           	<td>
			                           		<hr>
			                           		<div id="idMessage">
					                           <b><%=m.getMemName() %></b>님의 아이디는<br>
					                           <span id="userId"><%=m.getMemId() %></span>
					                           <br>입니다.
	                        				</div>
	                        				<hr>
			                           	</td>
		                           </tr>
                            </table>
                    	</form>
                    	
	                    <br>
                        <form class="signInForm">
                        	<div class="inputs">
                        	
                        		<label for="#pwdBtn" class="inputLabel">혹시 비밀번호도 모르시나요?</label>
                        		<a href="<%=contextPath %>/pwdChangeOne.me" id="pwdSearch" class="btn btn-secondary pwdChangeBtn">비밀번호 재설정</a>
		                        <br>
		                        <style>
		                        	.pwdChangeBtn{
		                        		font-size:15px;
		                        		color : white
		                        	}
		                        	.pwdChangeBtn:hover{
		                        		font-size:15px;
		                        		font-size:12px;
		                        		color : white
		                        	}
		                        </style>
		
		                        <label for="#pwdBtn" class="inputLabel">이제 로그인하러 가요!</label>
		                        <button type="submit" class="btn btn-primary" id="pwdBtn" onclick="loginForm();">로그인</button><br>
		                        <br>
                            	
                        	</div>
	                   </form>
            	</div> 
          	</div>	
          </div>
          <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>
</body>
</html>
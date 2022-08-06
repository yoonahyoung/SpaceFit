<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<% 
	int memNo = (int)request.getAttribute("memNo");
	String memPhone = (String)request.getAttribute("memPhone");
%>
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
                        
                        <div class="agreement" >
                            <table align="center">
		                           <tr>
			                           	<td>
			                           		<hr>
			                           		<form class="signInForm" action="<%=contextPath%>/pwdChangeResult.me" style="padding:20px;">
									        	<div class="inputs">
									        		<br><br>
						                                <label for="#password">비밀번호</label>
						                                <input type="password" placeholder="새 비밀밀번호를 입력해주세요" class="account-input" id="memPwd" name="memPwd">
						                                <span id="pwdSpan">비밀번호는 영문 대소문자+숫자+특수문자로 10자 이상입니다.</span>
						                                <input type="hidden" value="<%=memNo%>" name ="memNo">
						                                <input type="hidden" value="<%=memPhone%>" name ="memPhone">
						                            <br><br>
						                                <label for="#password-check" id="memPwdCheck">비밀번호</label>
						                                <input type="password" placeholder="새 비밀번호를 다시 입력해주세요" class="account-input" id="pwdCheckSpan">
						                                <span id="pwdCheckSpan">비밀번호를 한번 더 입력해주세요.</span>
						                            <br><br><br>
									        	</div>
									        	<hr>
									        	<div class="inputs">
							                        <label for="#pwdBtn" class="inputLabel">이제는 잊지마세요! :)</label>
							                        <button type="submit" class="btn btn-primary" id="pwdBtn">비밀번호 재설정</button><br>
		                       					<br>
                        						</div>
								       		</form>
	                        				
			                           	</td>
		                           </tr>
                            </table>
                    	</div>
                    	
	                    <br>
	                   
	                   <script>
	                        	// 3. 비밀번호 유효성 체크
								// 폼에 액션값으로 넘겨서 sql 값ㅇ,로 아예 변경해야함
	                        	// 3. 비밀번호 유효성 체크
	                        	
	                        	
								let memPwd2 = document.querySelector("#memPwd");
								let pwdSpan2 = document.querySelector("#pwdSpan");
								let regPwd2 = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
								
								function pwdCheck2(){
									if(regPwd2.test(memPwd2.value)) {
										pwdSpan2.style="color:#0082FF ;"
										pwdSpan2.innerHTML = "안전한 비밀번호입니다!"
									} else {
										pwdSpan2.style="color:red;"
										pwdSpan2.innerHTML = "사용불가. 비밀번호는 영문 대-소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자 입력해주세요."
									}
								}
								memPwd2.addEventListener("blur", pwdCheck2);
								
								// 4. 비밀번호 확인
								let memPwdCheck2 = document.querySelector("#memPwdCheck");
								let pwdCheckSpan2 = document.querySelector("#pwdCheckSpan");
								function pwdDBcheck2(){
									if(memPwd2.value === memPwdCheck2.value) {
										pwdCheckSpan2.style="color:#0082FF ;"
										pwdCheckSpan2.innerHTML = "비밀번호 확인 완료"
									} else {
										pwdCheckSpan2.style="color:red;"
										pwdCheckSpan2.innerHTML = "사용불가. 비밀번호를 확인해주세요."
									}
								}
								
								memPwdCheck2.addEventListener("blur", pwdDBcheck2);
	                        	
	                   </script>
            	</div> 
          	</div>	
          </div>
          <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<!--  <script type="text/javascript" src="<%=contextPath %>/resources/user/js/member.js"></script>-->
</body>
</html>
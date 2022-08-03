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
	                                <span id="idSpan">아이디는 영문 대소문자, 숫자 5~20자리까지 입력해주세요.</span>
	                            <br><br>
	                                <label for="#memPwd">비밀번호</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="memPwd" name="memPwd" required>
	                                <span id="pwdSpan">영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자</span>
	                            <br><br>
	                                <label for="#memPwd-check">비밀번호 확인</label>
	                                <input type="password" placeholder="비밀번호를 입력해주세요" class="account-input" id="memPwd-check" required>
	                                <span id="pwdCheckSpan">비밀번호를 한번 더 입력해주세요.</span>
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
	                                <div class="addMessege">이메일을 등록하면 예약정보를 받아보실 수 있어요!</div>
	                                <label for="#memMail">이메일</label>
			                        <input type="email" placeholder="이메일을 입력해주세요" class="account-input" id="memMail" name="memMail">
			                        <input type="button" class="btn btn-secondary" style="color:white;" onclick="sendEmail();" value="인증메일전송">
			                        <input type="text" placeholder="인증번호를 입력해주세요" class="account-input" id="memMailCheck" name="memMailCheck">
			                        <input type="button" class="btn btn-secondary" style="color:white;" onclick="checkEmail();" value="인증번호확인">
			                        <input type="hidden" id="randomNo">
			                        <span id="mailSpan"></span>
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
	<script>
	
	function idCheck(){
		$.ajax({
			url:"<%=contextPath%>/idCheck.me",
			data:{
				 memId:$("#memId").val()
			},
			success:function(result){ // 넘어오는 데이터를 받으려면 매개변수가 필요함
				// console.log(result);
				if(result == "NNNNN"){
					// 사용 불가일 경우
					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
					$("#memId").focus();
				} else {
					// 사용 가능일경우
					if(confirm("멋진 아이디네요! 사용하시겠습니까?")){
						// 사용하겠다
						$("#signInForm :submit").removeAttr("disabled");
						$("#memId").attr("readOnly", true);
					} else {
						// 사용하지 않겠다
						$("#memId").focus();
					}
				}
				
			},
			error:function(){
				console.log("아이디 중복체크용 ajax 통신 실패");
			}
		})
	}
       function sendEmail(){
    	   $.ajax({
       			url:"<%=contextPath%>/sendEmail.me",
       			data:{
       				memMail:$("#memMail").val()
       			},
       			success:function(randomNo){
       				console.log(randomNo);
       				$("#randomNo").val(randomNo);
       				console.log($("#randomNo").val());
       			},
       			error:function(){
       				console.log("이메일전송용 에이젝스 실패");
       			}
       		})
		}
       
       
       function checkEmail(){
    	   let mailSpan = document.querySelector("#mailSpan");
    	   let randomNo = $("#randomNo").val();
    	   let memMailCheck = $("#memMailCheck").val()
    	   $.ajax({
       			url:"<%=contextPath%>/checkEmail.me",
       			data:{
       				randomNo:randomNo,
       				memMailCheck:memMailCheck
       			},
       			success:function(result){
       				if(result == 1){
       					mailSpan.style="color:#0082FF ;"
       					mailSpan.innerHTML = "이메일 인증 완료!"
					} else {
						mailSpan.style="color:#red ;"
	       				mailSpan.innerHTML = "이메일 인증 실패! 다시 한 번 확인해주세요!"
						}
       			},
       			error:function(){
       				console.log("이메일전송용 에이젝스 실패");
       			}
       		})
		}
       </script>
</body>
</html>
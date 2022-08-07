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
                        <h4 class="h4forLgnNSign">SNS 간편로그인</h4>
                       <!--  <button class="goggle-login btn" type="button">구글 로그인</button><br> -->
                      	
							<ul>
								<li onclick="kakaoLogin();">
							      <a href="javascript:void(0)" class="kakao-login btn">
							          <span>카카오 로그인</span>
							      </a>
								</li>
								<li onclick="kakaoLogout();">
							      <a href="javascript:void(0)" class="kakao-login btn">
							          <span>카카오 로그아웃</span>
							      </a>
								</li>
							</ul>
							<form action="<%=contextPath %>/kakaoForm" method="post">
								<input type="hidden" value="" name="memId" id="memId">
								<input type="hidden" value="" name="memPwd" id="memPwd">
								<input type="hidden" value="" name="memPhone" id="memPhone">
								<input type="hidden" value="" name="memMail" id="memPhone">
							</form>
                        <!-- <button class="kakao-login btn" type="button">카카오 로그인</button>  -->
                        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
						<script>
						Kakao.init('5a035a2e0cfa456804031dcf5b1b041d'); //발급받은 키 중 javascript키를 사용해준다.
						console.log(Kakao.isInitialized()); // sdk초기화여부판단
						function kakaoLogin() {
						    Kakao.Auth.login({
						      success: function (response) {
						        Kakao.API.request({
						          url: '/v2/user/me',
						          success: function (response) {
						        	  console.log(response)
						        	  
						          },
						          fail: function (error) {
						            console.log(error)
						          },
						        })
						      },
						      fail: function (error) {
						        console.log(error)
						      },
						    })
						  }
						//카카오로그아웃  
						function kakaoLogout() {
						    if (Kakao.Auth.getAccessToken()) {
						      Kakao.API.request({
						        url: '/v1/user/unlink',
						        success: function (response) {
						        	console.log(response)
						        },
						        fail: function (error) {
						          console.log(error)
						        },
						      })
						      Kakao.Auth.setAccessToken(undefined)
						    }
						  }  
						</script>
                        <br><br>
                        <hr style="color:  #0D6EFD;">
                        <br>
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
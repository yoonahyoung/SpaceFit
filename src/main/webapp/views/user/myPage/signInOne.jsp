<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 회원가입</title>
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
                        <h4 class="h4forLgnNSign">스페이스핏 회원가입</h4><br>
                    	<form class="agreement">
                    	
                    		<div>
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span>모두 동의합니다</span><br><hr>
                            </div>
                            <label for="agree">
                           			<div class="agreeInput">
                           				 <input type="checkbox" name="agree" value="1">
                                    	 <span>이용약관 동의<strong>(필수)</strong></span>
                           			</div>
                                    <div class="agreeBox">
                                    	<span>나중에 민아님 페이지에서 얻어올 이용약관 1</span>
                                   	</div>
                            </label>
                            <label for="agree">
                            	<div class="agreeInput">
	                                <input type="checkbox" name="agree" value="2">
	                                <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
	                            </div>
                                <div class="agreeBox">
                                    <span>나중에 민아님 페이지에서 얻어올 이용약관 2</span>
                                </div>
                            </label>
                            <label for="agree">
                            	<div class="agreeInput">
                            		 <input type="checkbox" name="agree" value="3">
                                	<span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
                            	</div>
                                <div class="agreeBox">
                                   <span>나중에 민아님 페이지에서 얻어올 이용약관 3</span>
                                </div>
                            </label>
                      	<script>
							$(function(){
					            $(".agreeInput").click(function(){ //==> 아코디언형식
					                // $(this).next():클릭이벤트가 발생한 div 요소 바로 뒤의 요소
					                const $aInputEl = $(this).next(); //제이쿼리 방식으로 선택한 요소
					                if($aInputEl.css("display")=="none") {
					
					                    // 일단 모든 p를 닫고
					                    $(this).siblings(".agreeBox").slideUp();
					
					                    // 선택한 p만 보여지게끔
					                    $aInputEl.slideDown();
					                } else {
					                    // 사라지게끔
					                    $aInputEl.slideUp();
					                }
					            })
					        })
					        
					        
					        $(function(){
					        	 const agreeChkAll = document.querySelector('input[name=agree_all]');
		                            agreeChkAll.addEventListener('change', (e) => {
		                            let agreeChk = document.querySelectorAll('input[name=agree]');
		                            for(let i = 0; i < agreeChk.length; i++){
		                            agreeChk[i].checked = e.target.checked;
		                            }
		                        });
					        })
						</script>
                    	</form>
                    	
	                    <div class="phone">
	                        <div class="phone box">
	                            <span class="material-icons">
	                                phone_iphone
	                            </span>
	                            <br>
	                            <span class="picon-span">  
	                                휴대전화인증
	                            </span>
	                            <br>
	                            <form class="phoneAgreement">
		                            <label for="agree">
		                            	<div class="agreeInput">
		                            		  <input type="checkbox" name="phoneAgree" value="4">
		                                	  <span>휴대폰 인증 이용약관 동의<strong>(필수)</strong></span>
		                            	</div>
										<div class="agreeBox">
		                                    <span>나중에 민아님 페이지에서 얻어올 휴대폰 이용약관</span>    
		                                </div>
	                            	</label>
	                            </form>
                        </div>
                        <form class="phone message">
                            <input type="text" placeholder="핸드폰번호를 입력해주세요 (-제외)" class="account-input" id="phone">
                            <button type="submit" class="btn btn-secondary getIdNoBtn">인증번호 받기</button><br>
                            <input type="text" placeholder="인증번호를 입력해주세요" class="account-input" id="phone-message">
                            <button type="submit" class="btn btn-primary confirmBtn">확인</button><br>
                        </form>
                        <hr>
                        <span class="already">인증을 축하드립니다! 거의 다 왔어요!</span>
                        <button class="btn btn-primary nextBtn" type="button">다음 단계로 이동</button><br>
                	</div>
                </div>
          </div>
      </div>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
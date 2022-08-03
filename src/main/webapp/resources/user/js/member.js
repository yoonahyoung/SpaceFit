/**
 * 
 */


//--------------------------------------------SignInOne


// 회원가입폼 1(SignInOne에서 회원약관 보여주는 것)
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

// 회원가입폼 1(SignInOne에서 회원약관 전체선택)

$(function(){
	 const agreeChkAll = document.querySelector('input[name=agree_all]');
        agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
        agreeChk[i].checked = e.target.checked;
        }
    });
})

// js1-------------------------------------------------------

 // ajax로 인증번호 보내고 회원폰번호, 전송된 인증번호 기록
 function sms(){
	 //const divEl = document.getElementById("memPhone");
	 
	 let memPhoneVal = document.getElementById("memPhone").value;
	 const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	 
     if (regPhone.test(memPhoneVal) === true) {
    	let value=" <span id='validPhone' style='font-size:11px;'>핸드폰으로 인증문자 전송완료!</span>"
		$(".signInForm .pHoneAnswer").html(value)
    	 
    	 
    	 $.ajax({
    		 url:"sms.me",
    		 data:{
    			 memPhone:memPhoneVal //$("#memPhone").val()
    		 },
    		 type:"post",
    		 success:function(randomNo){
    			let value= randomNo
    			$('input[name=hideRandomNo]').attr('value',value);
    		 },
    		 error:function(){
    			console.log("인증번호 전송통신 ajax 실패")
    		 }
    		 
    	 })
    	$("#memPhone").removeAttr("disabled");
    	$("#memPhone").attr("readOnly", true);
    	 
     } else {
    	 let value=" <span id='validPhone' style='font-size:11px; color : red;'>올바른 형태의 핸드폰번호를 입력해주세요!</span>"
         $(".signInForm .pHoneAnswer").html(value)
         $("#memPhone").focus();
     }

 }


// js2-------------------------------------------------------

function checkSms(){
	$.ajax({
		url:"smsTest.me",
		data:{
			 smsNoCheck:$("#smsNoCheck").val(),
			 randomNo:$("#hideRandomNo").val()
		},
		type:"post",
		// 여기까지 하면 현재 jsp에 있는 전달받은 랜덤번호랑 사용자가 적은 번호를 서블릿으로 보내게 됨
		// 번호를 인증하지 않아도....넘어가는데....?
		success:function(result){
			if(result > 0){
				console.log(result);
				let value=" <span id='validMessage' style='font-size:11px;'>인증번호 확인 완료!</span>"
				$(".signInForm .accountAnswer").html(value)
 				} else {
 					 let value=" <span id='validMessage' style='font-size:11px; color : red;'>인증번호를 다시 확인해주세요!</span>"
				     $(".signInForm .accountAnswer").html(value)
				     $("#smsNoCheck").focus();
 				}
		},
		error:function(){
			console.log("인증번호 전송통신 ajax 실패");
		}
	})
}


// js3------------------------------------------------------- 휴대폰인증 공통메소드












//--------------------------------------------SignInTwo//

// 1. 아이디 중복체크용 js



// 2. 아이디 유효성검사
let memId = document.querySelector("#memId");
let idSpan = document.querySelector("#idSpan");
let regId = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);

function idCheck() {
  if (regId.test(memId.value)) {
	idSpan.style="color:#0082FF ;"
    idSpan.innerHTML = "안전한 아이디입니다!";
  } else {
	idSpan.style="color:red;"
    idSpan.innerHTML = "아이디는 영문 대소문자, 숫자 5~20자리까지 입력해주세요.";
  }
}
memId.addEventListener("blur", idCheck);



// 3. 비밀번호 유효성 체크
let memPwd = document.querySelector("#memPwd");
let pwdSpan = document.querySelector("#pwdSpan");
let regPwd = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);

function pwdCheck(){
	if(regPwd.test(memPwd.value)) {
		pwdSpan.style="color:#0082FF ;"
		pwdSpan.innerHTML = "안전한 비밀번호입니다!"
	} else {
		pwdSpan.style="color:red;"
		pwdSpan.innerHTML = "비밀번호는 영문 대-소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자 입력해주세요."
	}
}
memPwd.addEventListener("blur", pwdCheck);

// 4. 비밀번호 확인
let memPwdCheck = document.querySelector("#memPwd-check");
let pwdCheckSpan = document.querySelector("#pwdCheckSpan");
function pwdDBcheck(){
	if(memPwd.value === memPwdCheck.value) {
		pwdCheckSpan.style="color:#0082FF ;"
		pwdCheckSpan.innerHTML = "비밀번호 확인 완료"
	} else {
		pwdCheckSpan.style="color:red;"
		pwdCheckSpan.innerHTML = "비밀번호를 확인해주세요."
	}
}

memPwdCheck.addEventListener("blur", pwdDBcheck);


// 5. 이메일 유효성체크
/*
let memMail = document.querySelector("#memMail");
let mailSpan = document.querySelector("#mailSpan");
let regMail = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

function mailCheck(){
	if(regPwd.test(memMail.value)) {
		mailSpan.style="color:#0082FF ;"
		mailSpan.innerHTML = "올바른 이메일 형태입니다."
	} else {
		mailSpan.style="color:red;"
		mailSpan.innerHTML = "올바른 이메일 형태로 적어주세요."
	}
}
memMail.addEventListener("blur", mailCheck);*/

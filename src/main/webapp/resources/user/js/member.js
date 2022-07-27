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
		success:function(result){
			if(result > 0){
				console.log("인증번호 확인 완료")
				let value=" <span id='validMessage' style='font-size:11px; text-align:rignt'>인증번호 확인 완료!</span>"
				$(".signInForm .accountAnswer").html(value)
 				} else {
 					 let value=" <span id='validMessage' style='font-size:11px; color : red; text-align:rignt'>인증번호를 다시 확인해주세요!</span>"
				     $(".signInForm .accountAnswer").html(value)
				     $("#smsNoCheck").focus();
 				}
		},
		error:function(){
			console.log("인증번호 전송통신 ajax 실패");
		}
	})
}


// js3-------------------------------------------------------
 function signInTwo(){
		$("#memPhoneSubmit").val($("#memPhone").val())
		$("#phoneForm").submit()
}

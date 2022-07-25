/**
 * 
 */


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
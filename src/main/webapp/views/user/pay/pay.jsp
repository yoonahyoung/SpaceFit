<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link rel="stylesheet" href="../../../resources/user/css/pay.css">
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
<div class="rvlvd">
    <input type="hidden" value="예약번호" id="bookNo">
    <div class="rvlvd-header" align="center">
        <h3>예약하기</h3>
        <hr style="width: 230px">
        
    </div>
    <div class="rvlvd-side-a">
      
      <table class="table">
         <tr>
            <th width="200" colspan="4"><h5><b>예약공간</b></h5></th>
         </tr>
         <tr>
             <td colspan="2" rowspan="2" width="200" height="150">
                 <img src="../../../resources/user/img/파티룸.jpeg" width= "100%" height="100%" >
             </td>
             <td width="500" height="40"> <b>A홀(큰 홀, 컬러조명, 핀조명)</b></td>
         </tr>
         <tr>
             <td colspan="2">
                 <span>
                     다인원(최대20명) 추천, 정기레슨 추천, 탄성마루 시공 틱톡, 릴스, 숏츠,
                     촬영하기 좋은 라운드존 설치(조명 컬러 직접 선택가능) 약 20평,
                     가로길이 12m, 블루투스 앰프 및 스피커 4개 냉난방기,
                     공기청정기, 제습기, 급속충전(데크 삼각대 2개(중형, 소형) 구비
                 </span>
             </td>
 
         </tr>
         <tr>
             <td width="70" height="50">공간유형</td>
             <td colspan="3">연습실</td>
 
         </tr>
         <tr>
             <td width="70" height="50">예약인원</td>
             <td colspan="3">최대 20명</td>
 
         </tr>
     </table>
      <br><br>

      <table class="table">
         <tr>
            <td colspan="3"><h5><b>예약정보</b></h5></td>
         </tr>
         <tr>
            <td>예약날짜</td>
            <td class="right" colspan="2">2022.07.10(토) 17시 ~ 23시</td>
         </tr>
         <tr>
            <td>예약인원</td>
            <td class="right" colspan="2">4명</td>
         </tr>
         <tr>
            <td width="390">옵션</td>
            <td>
            주차<br>
            반려동물동반<br>
            보면대<br>
            미니의자
            </td>
            <td class="right" width="150">
                  <input type="radio" name="optionCar" value="Y" checked>요청 &emsp;
                  <input type="radio" name="optionCar" value="N">미요청 <br>
                  <input type="radio" name="optionAnimal" value="Y" checked>요청 &emsp;
                  <input type="radio" name="optionAnimal" value="N">미요청 <br>
                  <input type="radio" name="optionStand" value="Y" checked>요청 &emsp;
                  <input type="radio" name="optionStand" value="N">미요청 <br>
                  <input type="radio" name="optionChair" value="Y" checked>요청 &emsp;
                  <input type="radio" name="optionChair" value="N">미요청 <br>
            </td>
        </tr>
      </table>

      <br><br>
        <br>
        <table class="table">
         <tr>
            <td colspan="2"><h5><b>예약자정보</b></h5></td>
         </tr>
           <tr>
              <th>예약자 *</th>    
              <td><input type="text" size="69%" readonly value="홍길동" style="background-color: #EEEEEE;" required></td>                        
           </tr>
           <tr>
              <th>연락처 *</th>    
              <td><input type="text" size="69%" name="phone" class="phone" maxlength="13" placeholder="숫자만 입력해주세요" required></td>                        
           </tr>
           <tr>
              <th>이메일 *</th>    
              <td><input type="text" size="69%" required placeholder="예약자 정보로 이메일이 발송됩니다. 정확한 정보인지 확인해주세요"></td>                        
           </tr>
           <tr>
              <th>사용목적</th>    
              <td><input type="text" size="69%" placeholder="촬영, 파티, 모임, 수업 등 공간의 사용 목적을 입력해주세요."></td>                        
           </tr>
           <tr>
              <th>요청사항</th>    
              <td><textarea name="bookContent" rows="10" cols="72" style="resize:none" placeholder="남기고 싶은말을 적어주세요 (최대 500자)"></textarea></td>                        
              
           </tr>

        </table>
        <br><br>

        <table class="table">
         <tr>
            <th colspan="2"><h5><b>쿠폰적용</b></h5></th>
         </tr>
         <tr>
            <td width="80">보유쿠폰</td>
            <td>
               <select name="national" style="width: 100%;">
                  <option value="">SILVER 등급 5% 할인</option>
                  <option value="">연습실 10%</option>
                  <option selected>선택안함</option>
              </select>
            </td>
         </tr>
        </table>



    </div>


    <div class="rvlvd-side-b">
      <table class="table">
         <tr>
             <th colspan="3"><h5><b>결제예정금액</b></h5></th>
         </tr>
         <tr>
             <td class="right">결제예정금액</td>
             <td colspan="2" class="right">36000원</td>
         </tr>
         <tr>
             <td class="right" width="120">-쿠폰할인</td>
             <td  colspan="2" class="right">5000원</td>
         </tr>
         <tr>
             <th class="center">TOTAL</th>
             <td colspan="2" class="right">31000원</td>
         </tr>
     </table>

      <br><br>

      <div align="center">               
         <button type="button" class="btn btn-sm btn-primary" onclick="">결제하기</button> &nbsp;
         <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
      </div>
      
  </div>
  <div class="rvlvd-footer"></div>
</div>
<script>
   $('.phone').keydown(function(event) {
    let key = event.charCode || event.keyCode || 0;
    $text = $(this);
        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3) {
               $text.val($text.val() + '-');
            }
            if ($text.val().length === 8) {
               $text.val($text.val() + '-');
            }
         }
         return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
 });
</script>
</body>
</html>
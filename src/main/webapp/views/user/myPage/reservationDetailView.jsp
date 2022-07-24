<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세내역리스트</title>
<link rel="stylesheet" href="../../../resources/user/css/book.css">
</head>
<body>
    <%@ include file="../common/userMenubar.jsp" %>

    <div class="rvlvd">
        <input type="hidden" value="예약번호" id="bookNo">
        <div class="rvlvd-header" align="center">
            <h3>예약상세페이지</h3>
            <hr style="width: 230px">
            
        </div>
        <div class="rvlvd-side-a">

            <h5><b>예약정보</b></h5> 
            <br>
            <table class="table">                    
               <tr>
                  <th width="150px">예약공간</th>    
                  <td width="150px">연습실A</td>                        
               </tr>
               <tr>
                  <th>대여날짜</th>    
                  <td>2022.07.22</td> 
               </tr>
               <tr>
                  <th>예약시간</th>    
                  <td>14:00 ~ 16:00</td> 
                        <!-- 체크인시간 + "~" + 체크아웃시간 -->
               </tr>
               <tr>
                  <th>예약인원</th>                     
                  <td>3</td>
               </tr>

               <tr>
                  <th>주차</th>
                  <td>                    
                     <input type="radio" name="optionCar" value="Y" checked>요청 &nbsp;
                     <input type="radio" name="optionCar" value="N">미요청
                  </td>                  
               </tr>

               <tr>
                  <th>반려동물동반</th>                  
                  <td>                    
                     <input type="radio" name="optionAnimal" value="Y">요청 &nbsp;
                     <input type="radio" name="optionAnimal" value="N" checked>미요청
                  </td>                  
               </tr>

               <tr>
                  <th>보면대</th>
                  <td>                    
                     <input type="radio" name="optionStand" value="Y">요청 &nbsp;
                     <input type="radio" name="optionStand" value="N" checked>미요청
                  </td>                  
               </tr>

               <tr>
                  <th>미니의자</th>
                  <td>                    
                     <input type="radio" name="optionChair" value="Y" checked>요청 &nbsp;
                     <input type="radio" name="optionChair" value="N">미요청
                  </td>                  
               </tr>

            </table>
            <br><br>

            <h5><b>예약자정보</b></h5>
            <br>
            <table class="table">
               <tr>
                  <th width="150px">예약자</th>    
                  <td width="150px">홍길동</td>                        
               </tr>
               <tr>
                  <th>연락처</th>    
                  <td>010-5689-1234</td>                        
               </tr>
               <tr>
                  <th>이메일</th>    
                  <td>xx123@naver.com</td>                        
               </tr>
               <tr>
                  <th>사용목적</th>    
                  <td>친구생일파티하려고요</td>                        
               </tr>
               <tr>
                  <th>요청사항</th>    
                  <td><textarea name="bookContent" rows="8" cols="22" style="resize:none" readonly>파티도구 판매하나요?</textarea></td>                        
                  
               </tr>

            </table>
            <br><br>

            <h5><b>주소</b></h5>
            <small>서울 금천구 가산디지털로</small>



        </div>



        <div class="rvlvd-side-b">

            <h5><b>결제정보</b></h5>
            <br>
            <table class="table">
               <tr>
                  <th width="150px"><h5><b>총 결제금액</b></h5></th>    
                  <td width="150px"><h5><b>56000원</b></h5></td>                        
               </tr>
               <tr>
                  <th>주문금액</th>    
                  <td>61000원</td>                        
               </tr>
               <tr>
                  <th>쿠폰</th>    
                  <td>5000원</td>                        
               </tr>              
            </table>

            <br><br>

            <!-- 진행중인 예약 상세보기일경우 -->
            <!-- <div align="center">                  
               <button type="button" class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#callNumberModal">
                  <span class="material-symbols-outlined" style="font-size: medium;">
                     call
                  </span>
               </button>
               &nbsp;
               <a href="" class="btn btn-sm btn-primary">예약수정</a> &nbsp;
               <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteBook">예약취소</button>
            </div> -->

            <!-- 취소된 예약 상세보기일경우 -->
            <!-- 예약리스트->예약상세보기갈때 예약번호(hidden)를 넘기고 => status=n인거 -->            
            <!-- <div align="center">
               <button type="button" class="btn btn-sm btn-primary" disabled>취소완료</button> &nbsp;
               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
            </div> -->

            <!-- 완료된 예약상세보기일경우 -->
            <div align="center">               
               <button type="button" class="btn btn-sm btn-primary" onclick="reviewEnroll();">후기등록</button> &nbsp;
               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
            </div>
            <script>
              function reviewEnroll(){
                  // location.href = '<%= contextPath %>/url쓰고?no=' + document.getElementById("bookNo").value;
              }
                                                    
            </script>


        </div>
        <div class="rvlvd-footer"></div>
    </div>
   
    
    <!-- Call Modal -->
    <div class="modal fade" id="callNumberModal" tabindex="-1" aria-labelledby="callNumberModal1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="callNumberModal1">TEL:02-123-4567</h5>            
          </div>
          <div class="modal-body">
               평일 09:00 ~ 19:00 <br>
               주말 10:00 ~ 17:00 <br>
               전화 문의 가능합니다 ~!
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>            
          </div>
        </div>
      </div>
    </div>
         

      <!-- 에약취소 Modal -->
      <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="deleteBkModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header" align="center">
               <h5 class="modal-title" id="deleteBkModalLabel">예약취소</h5>              
            </div>
            <div class="modal-body">
               <form action="" method=post>               
                  <table align="center">                     
                     <tr>
                        <th width="100">취소사유</th>
                        <td width="200">
                           <select name="bCancelReason">
                              <option>일정취소,변경</option>
                              <option>예약정보오입력</option>
                              <option>호스트연락안됨</option>
                              <option>기타</option>
                           </select>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">&nbsp;</td>
                     </tr>      
                    <tr>
                        <th>자세한 사유</th>
                        <td>
                           <textarea name="bCancelContent" id="bCancelContent" cols="30" rows="10" style="resize:none" maxlength="500"></textarea>
                        </td>
                    </tr>     
                    <tr>
                        <td colspan="2" align="end">
                           <span id="bCount">0</span>/500
                        </td>
                    </tr>  
                    <script>
                     $(function(){
                        $("#bCancelContent").keyup(function(){
                           $("#bCount").text($(this).val().length);
                        })
                     })
                     </script>    
                  </table>                     
                  <br>
                  <div align="center">
                     <button type="submit" class="btn btn-sm btn-primary">예약취소</button>
                     <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>                       
               </form> 
            </div>
            <div class="modal-footer">
            </div>
         </div>
         </div>
      </div>


</body>
</html>
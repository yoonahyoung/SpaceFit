<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약수정페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/book.css">
</head>
<body>
    
    <%@ include file="../common/userMenubar.jsp" %>

    <div class="rvlvd">
        <div class="rvlvd-header" align="center">
            <h3>예약수정페이지</h3>
            <hr style="width: 230px">
            
        </div>
        <form action="" method="post">

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
                      <td width="150px"><input type="number" name="bookCount" value="3" required></td>                     
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
                      <th width="150px">이름</th>    
                      <td width="150px">
                        <input type="text" name="bookName" value="홍길동" required> 
                      </td> 
                                            
                   </tr>
                   <tr>
                      <th>연락처</th>    
                      <td>
                        <input type="text" name="bookPhone" value="010-1123-5235" placeholder="-를 포함해서 작성해주세요" required> 
                      </td>                        
                   </tr>
                   <tr>
                      <th>이메일</th>    
                      <td>
                        <input type="email" name="bookPhone" value="wkak@naver.com" required>
                      </td>                        
                   </tr>
                   <tr>
                      <th>사용목적</th>    
                      <td><input type="text" name="bookPurpose" maxlength="20" value="친구생일기념으로 놀려고요 !!"></td>                        
                   </tr>
                   <tr>
                      <th>요청사항</th>    
                      <td><textarea name="bookContent" rows="8" cols="22" style="resize:none" maxlength="500">파티도구판매하나요?</textarea></td>                        
                   </tr>
    
                </table>                                  
    
            </div>
            <br><br>

            <div align="end">
                <button type="submit" class="btn btn-sm btn-primary">수정하기</button>
                <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">뒤로가기</button>
            </div>

            <!-- 수정하기 => jdbc완료후 alert뜨게 만들기!!-->
            
            

        </form>
        

        <div class="rvlvd-side-b">

            <h5><b>결제정보</b></h5>
            <br>
            <table class="table">
               <tr>
                  <th width="150px"><h6><b>총 결제금액</b></h6></th>    
                  <td width="150px"><h6><b>56000원</b></h6></td>                        
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

            <h5><b>주소</b></h5>
            <small>서울 금천구 가산디지털로</small>  
        </div>

        


        <div class="rvlvd-footer"></div>
    </div>
</body>
</html>
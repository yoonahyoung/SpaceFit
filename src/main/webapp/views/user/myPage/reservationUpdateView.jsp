<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.reservation.model.vo.Book"%>
    
<%
	Book b = (Book)request.getAttribute("b");
%>    
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
        <form action="<%= contextPath %>/bupdate.bo" method="post">
		 <input type="hidden" name="no" value="<%= b.getBookNo() %>">
            <div class="rvlvd-side-a">

                <h5><b>예약정보</b></h5> 
                <br>
                <table class="table">                    
                   <tr>
                      <th width="150px">예약공간</th>    
                      <td width="150px"><input type="text" name="spaceNo" value="<%= b.getSpaceNo() %>" style="border:none" readonly></td>                        
                   </tr>
                   <tr>
                      <th>대여날짜</th>    
                      <td><input type="text" name="bookDate" value="<%= b.getBookDate() %>" style="border:none" readonly></td> 
                   </tr>
                   <tr>
                      <th>예약시간</th>    
                      <td><%=b.getBookInTime() %>:00 ~ <%= b.getBookOutTime() %>:00</td>
                   </tr>
                   <tr>
                      <th>예약인원</th>    
                      <!-- 예약인원 1~장소별 최대인원수로 설정 -->
                      <td width="150px"><input type="number" name="bookCount" value="<%= b.getBookCount() %>" max="<%= b.getSpaceLimit() %>" min="1" required></td>                     
                   </tr>
    
                   <tr>
                  <th>주차</th>
                  <td>                      	            
                     <select name="bookCar" id="bookCar">
                        <option value="N">요청하지 않아요</option>
                        <option value="Y">요청할게요</option>
                     </select>                   
                  </td>                  
               </tr>
				
               <tr>
                  <th>반려동물동반</th>                  
                  <td>                    
                     <select name="bookAnimal" id="bookAnimal">
                        <option value="N">요청하지 않아요</option>
                        <option value="Y">요청할게요</option>
                     </select>                     
                  </td>                  
               </tr>
               
			   <tr>
                  <th>미니의자</th>
                  <td>                    
                     <select name="bookChair" id="bookChair">
                        <option value="N">요청하지 않아요</option>
                        <option value="Y">요청할게요</option>
                     </select>                     
                  </td>                  
               </tr>
               
               <tr>
                  <th>보면대</th>
                  <td>                    
                       <select name="bookStand" id="bookStand">
                          <option value="N">요청하지 않아요</option>
                          <option value="Y">요청할게요</option>
                       </select>                   
                  </td>                  
               </tr>            
            </table>        
            
             <script>
		    	$(function(){ // 모든요소들이 만들어지고 나서 실행
		    		
		    		$("#bookCar>option").each(function(){ // 순차적으로 접근 each메소드
		    			if($(this).val() == "<%= b.getBookCar() %>") { 
		    				$(this).attr("selected", true);
		    			}
		    		})
		    		
		    		$("#bookAnimal>option").each(function(){ 
		    			if($(this).val() == "<%= b.getBookAnimal() %>") { 
		    				$(this).attr("selected", true);
		    			}
		    		})
		    		
		    		$("#bookChair>option").each(function(){ 
		    			if($(this).val() == "<%= b.getBookChair() %>") { 
		    				$(this).attr("selected", true);
		    			}
		    		})
		    		
		    		$("#bookStand>option").each(function(){ 
		    			if($(this).val() == "<%= b.getBookStand() %>") { 
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
		    </script>         
    
                </table>
                <br><br>
    
                <h5><b>예약자정보</b></h5>
                <br>
                <table class="table">
                   <tr>
                      <th width="150px">이름</th>    
                      <td width="150px">
                        <input type="text" name="bookName" value="<%= b.getBookName() %>" required> 
                      </td> 
                                            
                   </tr>
                   <tr>
                      <th>연락처</th>    
                      <td>
                        <input type="text" name="bookPhone" value="<%= b.getBookPhone() %>" placeholder="숫자만 작성해주세요" required> 
                      </td>                        
                   </tr>
                   <tr>
                      <th>이메일</th>    
                      <td>
                        <input type="email" name="bookEmail" value="<%= b.getBookEmail() %>" required>
                      </td>                        
                   </tr>
                   <tr>
                      <th>사용목적</th>    
                      <td><input type="text" name="bookPurpose" maxlength="20" value="<%= b.getBookPurpose() %>"></td>                        
                   </tr>
                   <tr>
                      <th>요청사항</th>    
                      <td><textarea name="bookContent" rows="8" cols="22" style="resize:none" maxlength="500"><%= b.getBookAddContent() %></textarea></td>                        
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
                  <td width="150px" align="right"><h6><b><%= b.getBookPrice() %>원</b></h6></td>                        
               </tr>
               <tr>
                  <th>주문금액</th>    
                  <td align="right"><%= b.getPayAmount() %>원</td>                        
               </tr>
               <tr>
                  <th>쿠폰</th>    
                  <td align="right">-<%= Integer.parseInt(b.getPayAmount()) - b.getBookPrice() %>원</td>                        
               </tr>              
            </table>           
            <br><br>

            <h5><b>주소</b></h5>
            <small>서울 금천구 가산디지털로</small> <br><br>
            <div id="map" style="width:100%;height:400px;"></div>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60fe4abff9c12c6895a3cd4cf80f3561"></script>
            <script>
              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
               mapOption = { 
                  center: new kakao.maps.LatLng(37.4779452652514, 126.87912918876575), // 지도의 중심좌표
                  level: 3 // 지도의 확대 레벨
               };

               var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

               // 마커가 표시될 위치입니다 
               var markerPosition  = new kakao.maps.LatLng(37.4779452652514, 126.87912918876575); 

               // 마커를 생성합니다
               var marker = new kakao.maps.Marker({
                  position: markerPosition
               });

               // 마커가 지도 위에 표시되도록 설정합니다
               marker.setMap(map);

               kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                   
                  location.href = "https://map.kakao.com/link/to/SpaceFit,37.4779452652514,126.87912918876575";
    
               });
            </script>
        </div>
        


        <div class="rvlvd-footer"></div>
    </div>
</body>
</html>
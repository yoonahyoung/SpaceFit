<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.reservation.model.vo.Book" %>
<%
	Book b = (Book)request.getAttribute("b");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세내역리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/book.css">
</head>
<body>
    <%@ include file="../common/userMenubar.jsp" %>
    
    <!-- 이렇게 해야 값이 담겨있을때만 alert가 실행된다 -->
    <% if(alertMsg != null) { %> 
		<script>
			alert("<%=alertMsg%>");   <%-- "" 반드시!! 따옴표!!로 묶어줘야함 안하면 alert(회원가입성공);--%>
		</script>
		<%--회원가입성공후 알람창띄운후에도 session으로 담아서 보냈기때문에 새로고침후에도 alertMsg는 여전히 값이 남아있어서 
			새로고침할때마다 계속 알람창이 뜰것이다. 그래서 session을 remove해줘야함 (session은 서버만료되거나 내가 지우기전까지 계속 있음)
			alertMsg를 제거만 해줘도 alertMsg!= 조건에 맞지않아서 실행이 안됨 	
		 --%>
		<% session.removeAttribute("alertMsg"); %> 
	<% } %>

    <div class="rvlvd">
            
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
                  <td width="150px"><%= b.getSpaceNo() %></td>                        
               </tr>
               <tr>
                  <th>대여날짜</th>    
                  <td><%= b.getBookDate() %></td> 
               </tr>
               <tr>
                  <th>예약시간</th>    
                  <td><%= b.getBookInTime() %>:00 ~ <%= b.getBookOutTime() %>:00 </td> 
                        <!-- 체크인시간 + "~" + 체크아웃시간 -->
               </tr>
               <tr>
                  <th>예약인원</th>                     
                  <td><%= b.getBookCount() %></td>
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
            
            <br><br>

            <h5><b>예약자정보</b></h5>
            <br>
            <table class="table">
               <tr>
                  <th width="150px">예약자</th>    
                  <td width="150px"><%= b.getBookName() %></td>                        
               </tr>
               <tr>
                  <th>연락처</th>    
                  <td><%= b.getBookPhone() %></td>                        
               </tr>
               <tr>
                  <th>이메일</th>    
                  <td><%= b.getBookEmail() %></td>                        
               </tr>
               <tr>
                  <th>사용목적</th>    
                  <td><%= b.getBookPurpose() %></td>                        
               </tr>
               <tr>
                  <th>요청사항</th>    
                  <td><textarea name="bookContent" rows="8" cols="22" style="resize:none" readonly><%= b.getBookAddContent() %></textarea></td>                        
                  
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



        <div class="rvlvd-side-b">

            <h5><b>결제정보</b></h5>
            <br>
            <table class="table">
               <tr>
                  <th width="150px"><h5><b>총 결제금액</b></h5></th>    
                  <td width="150px" align="right"><h5><b><%= b.getBookPrice() %>원</b></h5></td>                        
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

            <!-- 진행중인 예약 상세보기일경우 -->
           <% if(b.getBookCategory().equals("예약확정")) { %> 
	           <div align="center">                  
	               <button type="button" class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#callNumberModal">
	                  <span class="material-symbols-outlined" style="font-size: medium;">
	                     call
	                  </span>
	               </button>
	                &nbsp;	                
	
	               <!-- 예약수정과 예약취소는 3일전엔 보이지 않도록!! -->
	               <%if(b.getBookDecimalDay() > 3) { %>
	               		<a href="<%=contextPath %>/bupdateForm.bo?no=<%= b.getBookNo() %>" class="btn btn-sm btn-primary">예약수정</a> &nbsp;
	
	               		<button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteBook">예약취소</button>
	               <% } %>
	               &nbsp;
	               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
	            </div>	            
            <%} %> 

            <!-- 취소된 예약 상세보기일경우 -->  
             <%if(b.getBookCategory().equals("예약취소")) { %>              
	            <div align="center">
	               <button type="button" class="btn btn-sm btn-primary" disabled>취소완료</button> &nbsp;
	               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
	            </div>
			 <% } %>
            <!-- 완료된 예약상세보기일경우 -->
            <%if(b.getBookCategory().equals("이용완료")) {%>
	            <div align="center">               
	               <button type="button" class="btn btn-sm btn-primary" onclick="reviewEnroll();">후기등록</button> &nbsp;
	               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
	            </div>
	         <%} %>   
	            
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
               <form action="<%=contextPath %>/bdelete.bo?no=<%= b.getBookNo() %>" method=post>               
                  <table align="center">                     
                     <tr>
                        <th width="100">취소사유</th>
                        <td width="200">
                           <select name="bCancelReason">
                              <option>일정취소및변경</option>
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
                  </table>
                  <script>
                     $(function(){
                        $("#bCancelContent").keyup(function(){
                           $("#bCount").text($(this).val().length);
                        })
                     })
                     </script>                      
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
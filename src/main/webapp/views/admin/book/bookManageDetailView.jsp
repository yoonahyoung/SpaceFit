<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.reservation.model.vo.Book"%>
<%
 Book b = (Book)request.getAttribute("b");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/book.css">
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>
 <div class="container-fluid">
 	<div class="card shadow mb-4" style="width:1000px">
 		<div class="card-header py-3">
    		<div style="height:100px"></div>
 				<div class="card-body">
				    <div class="rvlvd" style="color: rgb(20, 18, 18);">
				        <input type="hidden" value="예약번호" id="bookNo">
				        <div class="rvlvd-header" align="center">
				            <h3>예약상세페이지</h3>
				            <hr style="width: 230px">
				            
				        </div>
				        <div class="rvlvd-side-a">
				
				            <h5><b>예약정보</b></h5> 
				            <br>
				            <table class="table" style="color: rgb(20, 18, 18);">                    
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
				            <table class="table" style="color: rgb(20, 18, 18);">
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
				          
				        </div>
				
				        <div class="rvlvd-side-b">
				            <h5><b>결제정보</b></h5>
				            <br>
				            <table class="table" style="color: rgb(20, 18, 18);">
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
				
							<% if(b.getBookCategory().equals("예약확정")) { %> 
				            <!-- 진행중인 예약 상세보기일경우 -->
					            <div align="center">                  
					               <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sendEmailBook">send email</button>          
					               &nbsp;               
					               <button type="button" class="btn btn-sm btn-danger"  data-toggle="modal" data-target="#deleteBook">예약취소</button>
					            </div>
				            <% } %>
				
							<%if(b.getBookCategory().equals("예약취소")) { %>
				            <!-- 취소된 예약 상세보기일경우 -->           
					            <h5><b>취소사유</b></h5>
					            <br>  
					            <table class="table" style="color: rgb(20, 18, 18);">
					                <tr>
					                    <th>취소사유</th>
					                    <td>일정취소및변경</td>
					               </tr>
					               <tr>
					                    <th>자세한사유</th>
					                    <td><textarea name="bCancelContent" id="bCancelContent" cols="32" rows="10" style="resize:none" maxlength="500" readonly>변경된일정으로 다시 신청할게요</textarea></td>
					               </tr>            
					            </table>          
					            <div align="end">               
					               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
					            </div> 
				            <%} %>
				
							<%if(b.getBookCategory().equals("이용완료")) {%>
				            <!-- 완료된 예약상세보기일경우 -->
					            <div align="center">               
					               <button type="button" class="btn btn-sm btn-primary" disabled>이용완료</button> &nbsp;
					               <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
					            </div>
				            <%} %>
				              
				
				        </div>
				        <div class="rvlvd-footer"></div>
				    </div>
				       
				    <!-- 예약취소Modal -->
				    <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="deleteBkModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				        	<div class="modal-content">
					            <div class="modal-header">
						            <h5 class="modal-title" id="deleteBkModalLabel">예약취소</h5>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                <span aria-hidden="true">&times;</span>
						            </button>
					            </div>
					            <div class="modal-body">
					                <form action="<%=contextPath %>/abdelete.bo?no=<%= b.getBookNo() %>" method=post>               
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
						                            <textarea name="bCancelContent" id="bCancelContent" cols="30" rows="5" style="resize:none" maxlength="500"></textarea>
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
					                    <div>
					                    <button type="submit" class="btn btn-sm btn-primary">예약취소</button>
					                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
					                    </div>                       
					                </form> 
					            </div>
				            	<div class="modal-footer"></div>
				        	</div>
        				</div>
       				 </div>
       				 
       				 <!-- 이메일 Modal -->
				    <div class="modal fade" id="sendEmailBook" tabindex="-1" aria-labelledby="sendBkModalLabel" aria-hidden="true">
				        <div class="modal-dialog">
				        	<div class="modal-content">
					            <div class="modal-header">
						            <h5 class="modal-title" id="sendBkModalLabel">이메일 전송</h5>
						            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                <span aria-hidden="true">&times;</span>
						            </button>
					            </div>
					            <div class="modal-body">
					                <form action="<%=contextPath %>/sendEmail.bo" method=post>               
						                 <input type="hidden" name="bookNo" value="<%= b.getBookNo() %>">
						                 <table align="center">   
						                 	<tr>
						                 		 <th width="100">예약자</th>
						                 		 <td><input type="text" name="bookName" value="<%= b.getBookName() %>" style="border:none" readonly> </td>
						                 	</tr>
						                 	<tr>
						                 		<th>이메일</th>    
							                      <td>
							                        <input type="email" name="bookEmail" value="<%= b.getBookEmail() %>" style="border:none" readonly>
							                      </td>
						                 	</tr>
						                                   
						                    <tr>
						                        <th>예약자공간</th>
						                        <td width="200"><input type="text" name="spaceNo" value="<%= b.getSpaceNo() %>" style="border:none" readonly></td>
						                    </tr>
						                   <tr>
						                      <th>대여날짜</th>    
						                      <td><input type="text" name="bookDate" value="<%= b.getBookDate() %>" style="border:none" readonly></td> 
						                   </tr>      
						                    <tr>
						                      <th>예약시간</th>    
						                      <td><input type="text" name="bookDateTime" value="<%=b.getBookInTime() %>:00 ~ <%= b.getBookOutTime() %>:00" style="border:none" readonly></td>
						                   </tr>
						                   <tr>
						                      <th>예약인원</th>   
						                      
						                      <td width="150px"><input type="number" name="bookCount" value="<%= b.getBookCount() %>" readonly></td>                     
						                   </tr>   
						                    <tr>
						                        <th>고객에게 &nbsp; &nbsp;&nbsp;전할 말</th>
						                        <td>
						                            <textarea name="sendContent" cols="30" rows="5" style="resize:none" maxlength="100" required></textarea>
						                        </td>
						                    </tr>  
						                      
					                    </table>                     
					                    <br>
					                    <div>
					                    <button type="submit" class="btn btn-sm btn-primary">send</button>
					                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
					                    </div>                       
					                </form> 
					            </div>
				            	<div class="modal-footer"></div>
				        	</div>
        				</div>
       				 </div>
    			</div>
			</div>       
		</div>
	</div>
</body>
</html>
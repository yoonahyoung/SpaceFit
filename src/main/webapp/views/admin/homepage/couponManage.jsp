<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.mem.model.vo.Mcp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">

</head>
<body>
	
	<%@ include file="../common/adminMenubar.jsp" %>
        
    <%
    	ArrayList<Mcp> list = (ArrayList<Mcp>)request.getAttribute("list");
    %>
    
    <div class="outerRv">
    	<div class="container-fluid">
		<br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">쿠폰 관리</h1>
        <br><br>

                 <div class="card shadow mb-4">
                     <div class="card-header py-3">
                      <div class="row">
                        <div class="col-lg" align="left">
				  </div>
			
				</div>
                      <div class="card-body">
                          <div class="table-responsive">
                              <table class="table table-bordered memberListTable" id="dataTable" width="100%" cellspacing="0">
                                  <thead>
                                      <tr>
                                      	<th>선택</th>
                                          <th>쿠폰번호</th>
                                          <th>쿠폰명</th>
                                          <th>할인금액</th>
                                          <th>등록일</th>
                                          
                                      </tr>
                                  </thead>
                                  <tfoot>
                                      <tr>
                                      	<th>선택</th>
                                          <th>쿠폰번호</th>
                                          <th>쿠폰명</th>
                                          <th>할인금액</th>
                                          <th>등록일</th>
                                          
                                      </tr>
                                  </tfoot>
                                  <tbody>
                                  	<% if(list.isEmpty()){ %>
                                  	
                                  		<tr>
						                    <td colspan="5" align="center">등록된 쿠폰이 없습니다.</td>
						                </tr>
						                
                                  	<% }else {%>
                                  	
	                                  	<% for(Mcp mc : list){ %>
	                                      <tr>
	                                      	<td><input type="radio" class="mc-radio"></td>
	                                          <td><%= mc.getCpNo() %></td>
	                                          <td><%= mc.getCpName() %></td>
	                                          <td><%= mc.getCpDiscount() %>원</td>
	                                          <td><%= mc.getCpEnrollDate() %></td>
	                                          
	                                      </tr>
	                                    <% } %>
	                                    
	                                 <% } %>
                                  </tbody>
                              </table>
                          </div>
                          <div>
						  	<br><br>
						  	
                            <button type="button" id="btn1" class="btn btn-secondary delete-btn">선택삭제</button>
                            <button type="button" class="btn btn-primary" onclick="couponDetailView();">등록 및 발급</button>
                           
						  </div>
						  
                      </div>
					   <br>
                     
                  </div>
			
             </div>
            </div>
            
            <script>
		    	function couponDetailView(){
		   			location.href="<%=contextPath%>/adCouponDetail.me";
				}
		    	
		    	
	    		$('#btn1').click(function(){
					
					if($('.mc-radio').is(":checked")){
	    				
						clickEvent(event);
					}
	    		})
	    		
	    		function clickEvent(event){
	    		
	    			location.href='<%=contextPath%>/adCouponDelete.me?cpNo=' + $('tbody').find('td').eq(1).text();
	    		}
		    	
    		</script>
	<br><br>
	



</body>
</html>
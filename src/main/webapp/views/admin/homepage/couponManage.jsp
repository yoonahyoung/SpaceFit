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
				  	 <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">

                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
           			</form>
				  </div>
				  <div class="col-lg float-right">
				  	 <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                       <select style="margin-left:290px; margin-top:12px; width:120px;">
						  <option>최신등록순</option>
						  <option>오래된순</option>
						  <option>할인금액순</option>
					   </select>
           			</form>
	                		
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
	                                      	<td><input type="radio"></td>
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
						  	<button type="button" class="btn btn-danger">전체삭제</button>
                            <button type="button" class="btn btn-secondary">선택삭제</button>
                            <button type="button" class="btn btn-primary" onclick="couponDetailView();">등록 및 발급</button>
                           
						  </div>
						  
                      </div>
					   <br>
                     <div class="paging-area" align="center">    
       
			           <button class="btn btn-sm btn-outline-primary">&lt;</button>        
			           <button disabled class="btn btn-sm btn-outline-primary">1</button>        
			           <button class="btn btn-sm btn-outline-primary">2</button> 
			           <button class="btn btn-sm btn-outline-primary">3</button>    
			           <button class="btn btn-sm btn-outline-primary">4</button> 
			           <button class="btn btn-sm btn-outline-primary">5</button>       
			           <button class="btn btn-sm btn-outline-primary">&gt;</button>
			           
			         </div>
                  </div>
			
             </div>
             <!-- /.container-fluid -->
            </div>
            
            <script>
		    	function couponDetailView(){
		   			location.href="<%=contextPath%>/adCouponDetail.me";
				}
		    	
    		</script>
	<br><br>
	



</body>
</html>
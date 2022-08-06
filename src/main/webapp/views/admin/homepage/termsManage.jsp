<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Terms"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	
	<%@ include file="../common/adminMenubar.jsp" %>
        
    <%
   		 ArrayList<Terms> list = (ArrayList<Terms>)request.getAttribute("list");
    %>
    
    <div class="outerRv">
    	<div class="container-fluid">
		<br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">이용약관 관리</h1>
        <br><br>

           <div class="card shadow mb-4">
               <div class="card-header py-3">
                <div class="row">
                  <div class="col-lg" align="left">
	 				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					
						 
					<!-- 
	                  <div class="input-group">
	                      <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
	                          aria-label="Search" aria-describedby="basic-addon2">
	                      <div class="input-group-append">
	                          <button class="btn btn-primary" type="button">
	                              <i class="fas fa-search fa-sm"></i>
	                          </button>
	                      </div>
	                      
	                  </div>
	                  -->
	             
           			</form>
				  </div>
				  <div class="col-lg float-left">
				  	 <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                       <select id="select-opt" style="margin-left:300px; margin-top:30px; width:100px;">
                       	  <option>선택</option>
						  <option value="Y">게시중</option>
						  <option value="N">보류중</option>
					   </select>
           			</form>
				  </div>
				</div>
				
                      <div class="card-body">
                      
                          <div class="table-responsive">
                              <table class="table table-bordered memberListTable" id="dataTable" width="100%" cellspacing="0">
                                  <thead>
                                      <tr>
                                      	  <th>약관번호</th>
                                          <th>상태</th>
                                          <th>이용약관명</th>
                                          <th>게시영역</th>
                                          <th>등록일</th>
                                          <th>수정일</th>
                                          <th>비고</th>
                                      </tr>
                                  </thead>
                                  <tfoot>
                                      <tr>
                                      	  <th>약관번호</th>
                                          <th>상태</th>
                                          <th>이용약관명</th>
                                          <th>게시영역</th>
                                          <th>등록일</th>
                                          <th>수정일</th>
                                          <th>비고</th>
                                      </tr>
                                  </tfoot>
                                  <tbody>
                                  
                                  	<% if(list.isEmpty()){ %>
                                  	
                                  		<tr>
						                    <td colspan="8" align="center">조회 가능한 이용약관이 없습니다.</td>
						                </tr>
						                
                                  	<% }else {%>
                                  	
	                                  	<% for(Terms t : list){ %>
	                                      <tr>
	                                      	  <td><%= t.getTermsNo() %></td>
	                                          <td><%= ( t.getTermsStatus().equals("N") ) ? "보류" : "게시중" %></td>
	                                          <td><%= t.getTermsTitle() %></td>
	                                          <td><%= t.getTermsPage() %></td>
	                                          <td><%= t.getTermsEnrollDate() %></td>
	                                          <td><%= t.getTermsModifyDate() %></td>
	                                          <td><%= ( t.getTermsNote() == null ) ? "" : t.getTermsNote() %></td>
	                                      </tr>
	                                    <% } %>
	                                    
	                                 <% } %>
                                      
                                  </tbody>
                              </table>
                          </div>
                          
                           <div>
                            <button type="button" class="btn btn-primary" style="margin-top:40px; width:150px; height:40px;" onclick="termsInsertDetailView();">새로 등록하기</button>
						  </div>
						
                      </div>
                      <br>

                  </div>
			
             </div>
             <!-- /.container-fluid -->
            </div>
            
            <script>
		    	function termsUpdateDetailView(){
		   			location.href="<%=contextPath%>/views/admin/homepage/termsUpdateDetailView.jsp";
				}
		    	
		    	function termsInsertDetailView(){
		   			location.href="<%=contextPath%>/adTermsInsertDetail.no";
				}
		    	
		    	$(function(){
	        		$(".memberListTable>tbody>tr").click(function(){
	        			location.href = "<%=contextPath%>/adTermsDetail.no?termsNo=" + $(this).children().eq(0).text(); 
	        		})
	        	})
	        	
	        	$('#select-opt').change(function(){
				 
	        		location.href = '<%=contextPath%>/adTermsList.no?opt=' + $("#select-opt option:selected").val();
				});
		    </script>
		    
    
	<br><br>
	
	 
	
</body>
</html>
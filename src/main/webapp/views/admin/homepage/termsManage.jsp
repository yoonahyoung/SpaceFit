<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	
	<%@ include file="../common/adminMenubar.jsp" %>
        
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
                       <select style="margin-left:300px; margin-top:12px; width:100px;">
						  <option>게시중</option>
						  <option>보류중</option>
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
                                      	<th>선택</th>
                                          <th>상태</th>
                                          <th>이용약관명</th>
                                          <th>게시영역</th>
                                          <th>등록일</th>
                                          <th>수정일</th>
                                          <th>비고</th>
                                      </tr>
                                  </tfoot>
                                  <tbody>
                                      <tr>
                                      	<td><input type="radio"></td>
                                          <td>게시중</td>
                                          <td>마이페이지 이용약관1</td>
                                          <td>마이페이지</td>
                                          <td>98/05/25</td>
                                          <td>22.07.07</td>
                                          <td>삭제 요망</td>
                                          
                                      </tr>
                                      <tr>
                                      	<td><input type="radio"></td>
                                          <td>게시중</td>
                                          <td>마이페이지 이용약관1</td>
                                          <td>마이페이지</td>
                                          <td>02/11/15</td>
                                           <td>22.07.07</td>
                                          <td></td>
                                          
                                      </tr>
                                       <tr>
                                       	<td><input type="radio"></td>
                                          <td>게시중</td>
                                          <td>마이페이지 이용약관1</td>
                                          <td>마이페이지</td>
                                          <td>85/09/30</td>
                                          <td>22.07.07</td>
                                          <td></td>
                                          
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                          <br><br>
                          <div>
						  	
						  	<button type="button" class="btn btn-danger">선택삭제</button>
                            <button type="button" class="btn btn-secondary">수정하기</button>
                            <button type="button" class="btn btn-primary">등록하기</button>
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
	<br><br>
	
	 
	
</body>
</html>
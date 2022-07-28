<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
	.outerRv{
		font-size:13px;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/adminMenubar.jsp" %>
        
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

					<div style="margin-right:35px;">
					  	<button type="button" class="btn btn-primary">쿠폰 등록</button>
                           <button type="button" class="btn btn-secondary">선택삭제</button>
                           <button type="button" class="btn btn-danger">전체삭제</button>
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
                                      <tr>
                                      	<td><input type="radio"></td>
                                          <td>00001</td>
                                          <td>silver 등급 쿠폰</td>
                                          <td>10000원</td>
                                          <td>98/05/25</td>
                                          
                                      </tr>
                                      <tr>
                                      	<td><input type="radio"></td>
                                          <td>00002</td>
                                          <td>7월 이벤트 쿠폰</td>
                                          <td>5000원</td>
                                          <td>02/11/15</td>
                                          
                                      </tr>
                                       <tr>
                                       	<td><input type="radio"></td>
                                          <td>00003</td>
                                          <td>7월 이벤트 쿠폰</td>
                                          <td>5000원</td>
                                          <td>85/09/30</td>
                                          
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>

                     
                  </div>
			
             </div>
             <!-- /.container-fluid -->
            </div>
	<br><br>
	
	 <script>
       	$(function(){
       		$(".memberListTable>tbody>tr").click(function(){
       			location.href="<%=contextPath%>/memDetailView.me?no=" + $(this).children().eq(0).text();
       		})
       	})
     		</script>
     
     		
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
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>


</body>
</html>
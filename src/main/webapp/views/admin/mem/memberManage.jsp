<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 회원관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
        
    <div class="container-fluid">
					<br><br><br>
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
               		<br><br><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
	                        <div class="row">
	                          <div class="col-lg" align="left">
							  	 <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			                        <select>
									  <option selected>셀렉트박스</option>
									  <option>옵션1</option>
									  <option>옵션2</option>
									  <option>옵션3</option>
									</select>

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
							  <div class="col-lg" align="right">
							  	<button type="button" class="btn btn-primary">관리자로 변경</button>
	                            <button type="button" class="btn btn-secondary">회원등급 변경</button>
	                            <button type="button" class="btn btn-danger">회원탈퇴</button>
							  </div>
							</div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered memberListTable" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th>선택</th>
	                                            <th>회원번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>생년월일</th>
	                                            <th>전화번호</th>
	                                            <th>이메일</th>
	                                            <th>회원등급</th>
	                                            <th>총 주문건</th>
	                                            <th>이번달 주문건</th>
	                                            <th>총 주문액</th>
	                                            <th>이번달 주문액</th>
	                                            <th>누적신고</th>
	                                            <th>누적추천</th>
	                                            <th>회원상태</th>
	                                            <th>관리자여부</th>
	                                            <th>회원가입일</th>
	                                            <th>정보수정일</th>
	                                        </tr>
	                                    </thead>
	                                    <tfoot>
	                                        <tr>
	                                        	<th>선택</th>
	                                            <th>회원번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>생년월일</th>
	                                            <th>전화번호</th>
	                                            <th>이메일</th>
	                                            <th>회원등급</th>
	                                            <th>총 주문건</th>
	                                            <th>이번달 주문건</th>
	                                            <th>총 주문액</th>
	                                            <th>이번달 주문액</th>
	                                            <th>누적신고</th>
	                                            <th>누적추천</th>
	                                            <th>회원상태</th>
	                                            <th>관리자여부</th>
	                                            <th>회원가입일</th>
	                                            <th>정보수정일</th>
	                                        </tr>
	                                    </tfoot>
	                                    <tbody>
	                                        <tr>
	                                        	<th><input type="radio"></th>
	                                            <td>00001</td>
	                                            <td>user01</td>
	                                            <td>박딘딘</td>
	                                            <td>98/05/25</td>
	                                            <td>01088856663</td>
	                                            <td>user01@gmail.com</td>
	                                            <td>Silver</td>
	                                            <td>14</td>
	                                            <td>2</td>
	                                            <td>1,358,000</td>
	                                            <td>200,000</td>
	                                            <td>3</td>
	                                            <td>10</td>
	                                            <td>회원</td>
	                                            <td>일반</td>
	                                            <td>22/07/20</td>
	                                            <td>22/07/23</td>
	                                        </tr>
	                                        <tr>
	                                        	<th><input type="radio"></th>
	                                            <td>00002</td>
	                                            <td>user02</td>
	                                            <td>최나나</td>
	                                            <td>02/11/15</td>
	                                            <td>01088637225</td>
	                                            <td>user02@gmail.com</td>
	                                            <td>Basic</td>
	                                            <td>5</td>
	                                            <td>1</td>
	                                            <td>450,000</td>
	                                            <td>80,000</td>
	                                            <td>1</td>
	                                            <td>5</td>
	                                            <td>탈퇴</td>
	                                            <td>일반</td>
	                                            <td>22/06/01</td>
	                                            <td>22/06/28</td>
	                                        </tr>
	                                         <tr>
	                                         	<th><input type="radio"></th>
	                                            <td>00003</td>
	                                            <td>user03</td>
	                                            <td>이소소</td>
	                                            <td>85/09/30</td>
	                                            <td>01056612789</td>
	                                            <td>user03@gmail.com</td>
	                                            <td>Gold</td>
	                                            <td>35</td>
	                                            <td>15</td>
	                                            <td>2,870,000</td>
	                                            <td>375,000</td>
	                                            <td>12</td>
	                                            <td>70</td>
	                                            <td>회원</td>
	                                            <td>일반</td>
	                                            <td>20/04/09</td>
	                                            <td>21/11/19</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>

                </div>
                <!-- /.container-fluid -->
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
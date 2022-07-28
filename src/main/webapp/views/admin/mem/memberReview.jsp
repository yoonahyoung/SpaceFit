<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 후기관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
	


</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
     <div class="outerRv">
     
     	<div class="container-fluid">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">후기 관리</h1>
        <br><br><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div style="height : 60px"></div>
                        	  <div class="row" id="reviewChart">
								  <div class="col-4" id="todaysReview">
								  	<span>오늘 등록 후기</span><br>
								  	<h4>51/8953</h4>	
								  </div>
								  <div class="col-4" id="avgStar">
								  	<span>평균별점</span><br>
								  	<h4>4.3</h4>	
								  </div>
								  <div class="col-4" id="avgReview">
								  	<span>후기작성률</span><br>
								  	<h4>38%</h4>	
								  </div>
								</div>
							  <div style="height : 60px"></div>
							  <div class="row" id="selectDivDate">
							  	<form>
								  <button class="btn-primary" id="selectAll">전체조회</button>
								  <button class="btn-primary" id="selectMon">최근 1달</button>
								  <button class="btn-primary" id="selectSixMon">최근 3개월</button>
							  	</form>
							  </div>
							  <div id="selectExactDate">
							  	<form>
							  		<input type="date" class="dateInput"> ~ <input type="date" class="dateInput">
							  		<button type="button" class = "btn btn-primary">조회</button>
							  	</form>
							  </div>
							  <div id="selectSelection">
							  	<form>
							  		<select>
									  <option selected>최신글 조회</option>
									  <option>최신글 조회</option>
									  <option>오래된 글 조회</option>
									  <option>별점 높은 글</option>
									  <option>별점 낮은 글</option>
									</select>
							  	</form>
							  </div>

							<div style="height : 30px"></div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered memberListTable" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th>선택</th>
	                                        	<th>후기번호</th>
	                                            <th>작성자</th>
	                                            <th>공간명</th>
	                                            <th>평점</th>
	                                            <th>예약일</th>
	                                            <th>추천수</th>
	                                            <th>신고수</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </thead>
	                                    <tfoot>
	                                        <tr>
	                                        	<th>선택</th>
	                                        	<th>후기번호</th>
	                                            <th>작성자</th>
	                                            <th>공간명</th>
	                                            <th>평점</th>
	                                            <th>예약일</th>
	                                            <th>추천수</th>
	                                            <th>신고수</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </tfoot>
	                                    <tbody>
	                                        <tr>
	                                        	<td><input type="radio"></td>
	                                            <td>00003</td>
	                                            <td>user01</td>
	                                            <td>스튜디오A</td>
	                                            <td>4.0</td>
	                                            <td>22/07/20</td>
	                                            <td>32</td>
	                                            <td>4</td>
	                                            <td><input type="button" class="btn btn-primary btn-sm" value="상세조회" onclick="revDetailView();"></td>
	                                            <script>
	                                           		 function revDetailView(){
	                                	       		location.href="<%=contextPath%>/memRevDetailView.me";
	                                				}
	                                            </script>
	                                        </tr>
	                                        <tr>
	                                        	<td><input type="radio"></td>
	                                            <td>00002</td>
	                                            <td>user02</td>
	                                            <td>스튜디오B</td>
	                                            <td>3.5</td>
	                                            <td>22/06/15</td>
	                                            <td>16</td>
	                                            <td>8</td>
	                                            <td><input type="button" class="btn btn-primary btn-sm" value="상세조회"></td>
	                                        </tr>
	                                         <tr>
	                                        	<td><input type="radio"></td>
	                                            <td>00001</td>
	                                            <td>user03</td>
	                                            <td>스튜디오C</td>
	                                            <td>2.0</td>
	                                            <td>22/05/30</td>
	                                            <td>7</td>
	                                            <td>1</td>
	                                            <td><input type="button" class="btn btn-primary btn-sm" value="상세조회"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <button type="button" class = "btn btn-danger">추천 조작프로그램 실행</button>
							<div class="paging-area" align="center">    
		        
								<button class="btn btn-sm btn-outline-primary">&lt;</button>        
								<button disabled class="btn btn-sm btn-outline-primary">1</button>        
								<button class="btn btn-sm btn-outline-primary">2</button> 
								<button class="btn btn-sm btn-outline-primary">3</button>    
								<button class="btn btn-sm btn-outline-primary">4</button> 
								<button class="btn btn-sm btn-outline-primary">5</button>       
								<button class="btn btn-sm btn-outline-primary">&gt;</button>
								
							</div>
							<div style="height : 60px"></div>
	                    </div>
                	</div>
     			</div>  
    
                <!-- /.container-fluid -->
				<br><br>        		
            </div>
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
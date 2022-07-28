<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 신고관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
	


</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
     <div class="outerRv">
     
     	<div class="container-fluid">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">신고관리</h1>
        <br><br><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div style="height : 60px"></div>
                        	  <div class="row" id="reviewChart">
								  <div class="col-4" id="todaysReview">
								  	<span>오늘 신고된 글</span><br>
								  	<h4>10/8563</h4>	
								  </div>
								  <div class="col-4" id="avgStar">
								  	<span>오늘 신고된 댓글</span><br>
								  	<h4>3/546</h4>	
								  </div>
								  <div class="col-4" id="avgReview">
								  	<span>최다신고회원</span><br>
								  	<h4>user02</h4>	
								  </div>
								</div>
							  <div style="height : 60px"></div>
							  <div class="row" id="selectDivMem">
							  	<form>
								  <button class="btn btn-primary">게시글/댓글 복구</button>
								  <button class="btn btn-danger">블랙리스트 처리</button>
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
	                                        	<th>신고번호</th>
	                                            <th>글 / 댓글</th>
	                                            <th>글 / 댓글 누적신고수</th>
	                                            <th>작성자</th>
	                                            <th>신고자</th>
	                                            <th>신고사유</th>
	                                            <th>신고일</th>
												<th>상세보기</th>
	                                        </tr>
	                                    </thead>
	                                    <tfoot>
	                                        <tr>
	                                        	<th>선택</th>
	                                        	<th>신고번호</th>
	                                            <th>글 / 댓글</th>
	                                            <th>글 / 댓글 누적신고수</th>
	                                            <th>작성자</th>
	                                            <th>신고자</th>
	                                            <th>신고사유</th>
	                                            <th>신고일</th>
												<th>상세보기</th>
	                                        </tr>
	                                    </tfoot>
	                                    <tbody>
	                                        <tr>
	                                        	<td><input type="radio"></td>
	                                        	<td>>003</td>
	                                            <td>
	                                            	<select>
														  <option selected>글</option>
														  <option>댓글</option>
													</select>
	                                            </td>
	                                            <td>15</td>
	                                            <td>user01</td>
	                                            <td>user02</td>
	                                            <td>비방, 욕설신고</td>
	                                            <td>22/08/30</td>
												<td><input type="button" class="btn btn-primary btn-sm" value="상세조회" onclick="rptDetailView();"></td>
	                                        </tr>
	                                         <script>
	                                           		 function rptDetailView(){
	                                	       		location.href="<%=contextPath%>/memRptDetailView.me";
	                                				}
	                                        </script>
	                                        <tr>
	                                        	<td><input type="radio"></td>
	                                        	<td>>003</td>
	                                            <td>
	                                            	<select>
														  <option selected>글</option>
														  <option>댓글</option>
													</select>
	                                            </td>
	                                            <td>15</td>
	                                            <td>user01</td>
	                                            <td>user02</td>
	                                            <td>비방, 욕설신고</td>
	                                            <td>22/08/30</td>
												<td><input type="button" class="btn btn-primary btn-sm" value="상세조회"></td>
	                                        </tr>
	                                        <tr>
	                                        	<td><input type="radio"></td>
	                                        	<td>>003</td>
	                                            <td>
	                                            	<select>
														  <option selected>글</option>
														  <option>댓글</option>
													</select>
	                                            </td>
	                                            <td>15</td>
	                                            <td>user01</td>
	                                            <td>user02</td>
	                                            <td>비방, 욕설신고</td>
	                                            <td>22/08/30</td>
												<td><input type="button" class="btn btn-primary btn-sm" value="상세조회"></td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
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
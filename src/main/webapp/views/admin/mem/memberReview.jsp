<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "java.util.ArrayList, com.spacefit.review.model.vo.Review" %>
<%
	ArrayList<Review> rvList = (ArrayList<Review>)request.getAttribute("rvList");
	int todayRvCount = (int)request.getAttribute("todayRvCount");
	float avgRoundOne = (float)request.getAttribute("avgRoundOne");
%>  
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
								  	<span>전체후기</span><br>
								  	<h4><%=rvList.size() %></h4>	
								  </div>
								  <div class="col-4" id="avgStar">
								  	<span>오늘 등록 후기</span><br>
								  	<h4><%=todayRvCount  %></h4>	
								  </div>
								  <div class="col-4" id="avgReview">
								  	<span>평균별점</span><br>
								  	<h4><%=avgRoundOne %></h4>	
								  </div>
								</div>
							  <div style="height : 60px"></div>
							  <div class="row" id="selectDivDate">
							  <!-- 
							  <form>
								  <button class="btn-primary" id="selectAll">전체조회</button>
								  <button class="btn-primary" id="selectMon">최근 1달</button>
								  <button class="btn-primary" id="selectSixMon">최근 3개월</button>
							  	</form>
							   -->
							  </div>
							  <div id="selectExactDate">
							  	<form>
							  		<input type="date" class="dateInput"> ~ <input type="date" class="dateInput">
							  		<button type="button" class = "btn btn-primary">조회</button>
							  	</form>
							  </div>
							  <div id="selectSelection">
							  	<form>
							  		<select id="orderBySel" name="orderBySel" onchange="changeSelect()">
									  <option value="newest" selected>최신후기 조회</option>
									  <option value="reported">누적신고순</option>
									  <option value="like">누적추천순</option>
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
	                                            <th>후기상태</th>
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
	                                            <th>후기상태</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </tfoot>
	                                    <tbody>
	                                    <% if(rvList.isEmpty()) { %>
	                                    	<!-- 후기글 없을경우 -->
	                                    	<tr>
	                                    		<td colspan="10">아직 후기가 없습니다.</td>
	                                    	</tr>
	                                    	<% } else { %>
	                                    	<!-- 후기가 있을경우 -->
	                                    		<% for(Review r : rvList) { %>
			                                        <tr>
			                                        	<td><input type="radio"></td>
			                                            <td><%= r.getReviewNo()%></td>
			                                            <td><%= r.getMemId() %></td>
			                                            <td><%= r.getSpaceName() %></td>
			                                            <td><%= r.getReviewStar() %></td>
			                                            <td><%= r.getBookDate() %></td>
			                                            <td><%= r.getAllLikeCount() %></td>
			                                            <td><%= r.getAllRptCount() %></td>
			                                            <td>
			                                            	<% if(r.getReviewStatus().equals("Y")) { %>
																공개
															<% } else { %>
																비공개
															<% }  %>
			                                            </td>
			                                            <td><input type="button" class="btn btn-primary btn-sm" value="상세조회" onclick="location.href='<%=contextPath%>/memRevDetailView.me?no=<%=r.getReviewNo()%>'"></td>
			                                        </tr>
			                                   <% } %>
											<% } %>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div style="height : 20px"></div>
	                        <button type="button" class = "btn btn-danger">추천 조작프로그램 실행</button>
	                       	<div style="height : 40px"></div>
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
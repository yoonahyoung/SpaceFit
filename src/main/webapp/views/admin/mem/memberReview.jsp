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
							  <!--  
							  <div id="selectExactDate">
							  	<form>
							  		<input type="date" class="dateInput"> ~ <input type="date" class="dateInput">
							  		<button type="button" class = "btn btn-primary">조회</button>
							  	</form>
							  </div>
							   -->
							  <div id="selectSelection">
							  	<select id="orderBySel" name="orderBySel" onchange="changeSelect()">
								  <option value="newest" selected>최신후기 조회</option>
								  <option value="reported">누적신고순</option>
								  <option value="like">누적추천순</option>
								  <option value="open">공개후기</option>
								  <option value="close">비공개후기</option>
								</select>
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
	                                    <tbody id="memListTBody">
	                                    	
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div style="height : 20px"></div>
	                       <!-- <button type="button" class = "btn btn-danger">추천 조작프로그램 실행</button> --> 
	                       	<div style="height : 40px"></div>
							 <!-- 
							<div class="paging-area" align="center">    
		        
								<button class="btn btn-sm btn-outline-primary">&lt;</button>        
								<button disabled class="btn btn-sm btn-outline-primary">1</button>        
								<button class="btn btn-sm btn-outline-primary">2</button> 
								<button class="btn btn-sm btn-outline-primary">3</button>    
								<button class="btn btn-sm btn-outline-primary">4</button> 
								<button class="btn btn-sm btn-outline-primary">5</button>       
								<button class="btn btn-sm btn-outline-primary">&gt;</button>
								
							</div>
							-->
							<div style="height : 60px"></div>
	                    </div>
                	</div>
     			</div>  
    
                <!-- /.container-fluid -->
				<br><br>        		
            </div>
    <div style="height : 100px"></div>
    
    <script>
    
    
    $(function(){
   	 changeSelect();
         })
         
         
    function changeSelect(){
		let orderBy = $("#orderBySel").val();
		let contextPath = "<%= contextPath %>"
		const memListTBody = $("#memListTBody");
		 $.ajax({
			       url:"<%=contextPath%>/orderByRev.me",
		  		 data:{
		  			orderBy:orderBy
		  		 },
		  		 type:"post",
		  		 success:function(rvList){
		  			if(rvList.length == 0){
		           					// 회원리스트가 비어있다면
		   							let value ='<tr><td colspan="10">리뷰가 없습니다.</td></tr>'
		   							memListTBody.html(value);
		   						} else {
			  			let value = ""
			  			for(let i = 0; i<rvList.length; i++) {
			  				
						  	if(rvList[i].reviewStatus == 'Y') {
						  		reviewStatus = "공개"
						  	} else {
						  		reviewStatus = "비공개"
						  	}
			  				
				  			value += 
					  			'<tr>'
                                  + ' 	  <td><input type="checkbox" name="choice" id="choice" value="' + rvList[i].reviewNo + '"></td> '
                                  + '     <td>' + rvList[i].reviewNo + '</td> '
                                  + '     <td>' + rvList[i].memId + '</td> '
                                  + '     <td>' + rvList[i].spaceName + '</td> '
                                  + '     <td>' + rvList[i].reviewStar + '</td> '
                                  + '     <td>' + rvList[i].bookDate  + '</td> '
                                  + '     <td>' + rvList[i].allRptCount + '</td> '
                                  + '     <td>' + rvList[i].allLikeCount + '</td> '
                                  + '     <td>' + reviewStatus + '</td> '
                                  + '     <td><a class="btn btn-primary btn-sm" href="'+contextPath+'/memRevDetailView.me?no='+ rvList[i].reviewNo +'">상세조회</a></td>'
                                  + '  </tr> '
                                  + '<input type="hidden" value="'+ rvList[i].reviewNo +'">'
  					 }
	  				memListTBody.html(value);
	  				
		  		 }
  		 },
  		 error:function(){
  			console.log("리뷰목록 조회용 ajax 통신 실패");
  		 }
  		 
  	 })
}
    </script>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
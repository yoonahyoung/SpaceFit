<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	int todayReviewCount = (int)request.getAttribute("todayReviewCount");
	int totalReviewCount = (int)request.getAttribute("totalReviewCount");
	int todayCommentCount = (int)request.getAttribute("todayCommentCount");
	int totalCommentCount = (int)request.getAttribute("totalCommentCount");
	String memId = (String)request.getAttribute("memId");
%>    
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
								  	<span>오늘 후기신고 건수</span><br>
								  	<h4><%=todayReviewCount %>/<%=totalReviewCount %></h4>	
								  </div>
								  <div class="col-4" id="avgStar">
								  	<span>오늘 댓글신고 건수</span><br>
								  	<h4><%=todayCommentCount %>/<%= totalCommentCount%></h4>	
								  </div>
								  <div class="col-4" id="avgReview">
								  	<span>최다블랙리스트회원</span><br>
								  	<h4><%= memId%></h4>	
								  </div>
								</div>
							  <div style="height : 60px"></div>
							  <div class="row" id="selectDivMem">
								  	<form>										
										  <button class="btn btn-secondary">비공개 설정</button>										 
										  <button class="btn btn-primary">블랙리스트 설정</button>										 
								  	</form>
							  
							  </div>
							  <div id="selectSelection">	
								  	<form>					  	
								  		<select name="selectSearch" id="selectSearch" onchange="selectList();">
									  		  <option value="total" selected>전체</option>
											  <option value="reviewSearch">후기신고 조회</option>
											  <option value="commentSearch">댓글신고조회</option>
											  <option value="countDesc">누적신고순</option> 									  
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
	                                        	<th>글번호</th>
	                                            <th>종류</th>
	                                            <th>누적신고수</th>
	                                            <th>작성자</th>
	                                            <th>글상태</th>	                                            	                                           	                                        
												<th>상세보기</th>
	                                        </tr>
	                                    </thead>
	                                    
	                                    <tbody id="listArea">
	                                                                          
	                                       
	                                    </tbody>
	                                    
	                                    <tfoot>
	                                         <tr>
	                                        	<th>선택</th>
	                                        	<th>글번호</th>
	                                            <th>종류</th>
	                                            <th>누적신고수</th>
	                                            <th>작성자</th>	
	                                            <th>글상태</th>	                                                                                 
												<th>상세보기</th>
	                                        </tr>
	                                    </tfoot>
	                                    
	                                </table>
	                            </div>
	                        </div>
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
				<br><br>        		
            </div>
     			
			<script>
				$(function(){
				
				 selectList();
				 
				})
				
				function  selectList(){
					
					$.ajax({
						url : "<%= contextPath %>/ajAdminReport.re",
						data : {
							selectSearch: $("#selectSearch").val()						
							},
						type:"post",
						success:function(list){
							let contextPath = "<%= contextPath %>"
		      				let value = "";
							
							if(list.length == 0){
		      					value += "<tr>"
		      					       + "<td colspan='7'> 신고내역이 없습니다. </td>"
		                               + "</tr>";
		      				}else{
		      					
		      					for(let i=0; i<list.length; i++){
		      						
		      						let status = "";
		      						
		      						if(list[i].reviewStatus == 'X'){
		      							status += '<td>'+ list[i].commentStatus+ '</td>';
		      					   }else{
		      						    status += '<td>'+ list[i].reviewStatus+ '</td>'
			                           }
							
									value += '<tr>'
				                           + 	'<td><input type="checkBox"></td>'
				                           + 	'<td>'+ list[i].rptRefNo +'</td>'
				                           + 	'<td>'+ list[i].category +'</td>'
				                           + 	'<td>'+ list[i].count +'</td>'
				                           + 	'<td>'+ list[i].rptMemId +'</td>' //작성자	
				                           +   status
										   + 	'<td><a class="btn btn-primary btn-sm" href="'+contextPath+'/memRptDetailView.me?no='+ list[i].rptRefNo + '&category='+ list[i].category +'">상세조회</a></td>'
				                           + '</tr>'
			      						}
		      					}
							
							$("#listArea").html(value);
		      						      												
						},
						
						error:function(){
		      				console.log("관리자 예약내역리스트 조회용 ajax통신 실패");
		      			}
						
					});
				}
				
				
			
			
			</script>  
    
                <!-- /.container-fluid -->
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
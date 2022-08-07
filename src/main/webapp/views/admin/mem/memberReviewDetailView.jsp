<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.spacefit.review.model.vo.Review" %>
<%
	Review rv = (Review)(request.getAttribute("rv"));
	ArrayList<Review> rvPhotoList = (ArrayList<Review>)request.getAttribute("rvPhotoList");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기상세조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	 <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">후기상세조회</h1>
        <br><br><br>

        <form>
        	<div class="row" id="photoReview">
        	  <%for (Review r : rvPhotoList) { %>
        	  	<img src="<%=r.getFilePath()%>/<%= r.getFileChangeName() %>" width="250" height="200">
        	  <%} %>
			</div>
			<div style="height : 30px"></div>
			
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>후기번호</th>
					<td><%=rv.getReviewNo() %></td>
				</tr>
				<tr>
					<th>예약번호</th>
					<td><%=rv.getBookNo() %></td>
				</tr>
				<tr>
					<th>예약일</th>
					<td><%=rv.getBookDate() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=rv.getMemId() %></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=rv.getReviewStar() %></td>
				</tr>
				<tr>
					<th>후기내용</th>
					<td><input type="textarea" value="<%=rv.getReviewContent() %>" style="width:600px; height:300px;" readOnly></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=rv.getReviewEnrollDdate() %></td>
				</tr>
				<tr>
					<th>수정일</th>
					<td><%=rv.getReviewModifyDate() %></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>
						<% if(rv.getGrNo() == 1) { %>
							Basic
						<% } else if (rv.getGrNo() == 2) { %>
							Silver
						<% } else { %>
							Gold
						<% } %>
					</td>
				</tr>
				<tr>
					<th>추천</th>
					<td><%=rv.getAllLikeCount() %></td>
				</tr>
				<tr>
					<th>신고</th>
					<td><%=rv.getAllRptCount() %></td>
				</tr>
				<tr>
					<th>후기글 상태</th>
					<td>
						<% if(rv.getReviewStatus().equals("Y")) { %>
							공개
						<% } else if (rv.getReviewStatus().equals("B")) { %>
							비공개
						<% } else { %>
							베스트
						<% } %>
					</td>
				</tr>
				<tr>
					<th><!-- 게시글 주소로 이동 --></th>
					<td>
						<!--<input type="button" class="btn btn-primary btn-sm" value="goToReview" onclick="location.href='<%=contextPath%>/detail.sp?no=<%=rv.getSpaceNo()%>'">  -->
					</td>
				</tr>
				<tr>
			</table>
			<br><br>
			<!-- 
			<button type="button" class="btn btn-primary">베스트 후기 등록</button>
			<button type="button" class="btn btn-warning">후기 수정</button>
			 -->
	         <a class="btn btn-primary" href="<%=contextPath %>/memReview.me">후기목록</a>
		</form>
		        
    </div>
	
    

	<div style="height : 100px"></div>

	
</body>
</html>
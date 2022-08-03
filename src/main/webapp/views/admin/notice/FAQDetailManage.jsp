<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.notice.model.vo.*"%>
<%
	FAQ f = (FAQ)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 정보</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">FAQ 정보</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>제목</th>
                    <td colspan="3"><%= f.getFaqTitle() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= f.getFaqWriter() %></td>
				</tr>
				<tr>
					<th>작성일</th>
                    <td><%= f.getFaqCreateDate() %></td>
				</tr>
				<tr>
					<th>최종 수정일</th>
                    <td><%= f.getFaqUpdateDate() %></td>
				</tr>
				<tr>
					<th>내용</th>
                    <td><%= f.getFaqContent() %></td>
				</tr>
				<tr>
					<th>게시여부</th>
                    <td><%= f.getFaqStatus() %></td>
				</tr>
				
			</table>
			<br><br>
			<a href="<%=contextPath%>/list.fa?cpage=1" type="button" class="btn btn-secondary">목록가기</a>
			<a href="<%=contextPath%>/adUpdateForm.fa?no=<%= f.getFaqNo() %>" type="button" class="btn btn-primary">수정</a>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.notice.model.vo.*, com.spacefit.mem.model.vo.*"%>
<%
	FAQ f = (FAQ)request.getAttribute("faq");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">FAQ 수정</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>제목</th>
                    <td colspan="3"><input type="text" value="<%= f.getFaqNo() %>" required></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="3"><input type="text" value="<%= loginUser.getMemName() %>" required></td>
				</tr>
				<tr>
					<th>작성일</th>
                    <td colspan="3"><input type="text" value="<%= f.getFaqCreateDate() %>" disabled></td>
				</tr>
				<tr>
					<th>최종 수정일</th>
                    <td colspan="3"><input type="text" value="<%= f.getFaqUpdateDate() %>" disabled></td>
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
			<button type="button" class="btn btn-primary">수정완료</button>
			<a href="<%=contextPath%>/adList.sp" type="button" class="btn btn-secondary">뒤로가기</a>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
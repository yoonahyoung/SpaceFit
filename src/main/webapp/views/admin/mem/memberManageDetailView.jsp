<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.spacefit.mem.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
	int memNo = (int)request.getAttribute("memNo");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">회원수정</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>회원번호</th>
					<td><%=m.getMemNo() %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=m.getMemId() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=m.getMemName() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><%=m.getMemIdNo() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=m.getMemPhone() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=m.getMemMail() %></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td><%=m.getGrName() %></td>
				</tr>
				<tr>
					<th>총 주문건</th>
					<td><%=m.getBookCountAll() %></td>
				</tr>
				<tr>
					<th>이번달 주문건</th>
					<td><%=m.getBookCountMonth() %></td>
				</tr>
				<tr>
					<th>총 주문액</th>
					<td><%=m.getBookAmountAll() %></td>
				</tr>
				<tr>
					<th>이번달 주문액</th>
					<td><%=m.getBookAmountMonth() %></td>
				</tr>
				<tr>
					<th>누적신고</th>
					<td><%=m.getRptCount() %></td>
				</tr>
				<tr>
					<th>누적추천</th>
					<td><%=m.getLikeCount() %></td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
						  <% if(m.getMemStatus().equals("Y")) { %>
						  	회원
						  <% } else if (m.getMemStatus().equals("N")) { %>
						  	탈퇴회원
						  <% } else { %>
						  	블랙리스트
						  <% } %>
					</td>
				</tr>
				<tr>
					<th>운영자여부</th>
					<td>
						  <% if(m.getMemAdmFlag().equals("A")) { %>
						  	관리자
						  <% } else {  %>
						  	일반
						  <% } %>
					</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td><%=m.getMemEnrollDate() %></td>
				</tr>
				<tr>
					<th>정보수정일</th>
					<td><%=m.getMemModifyDate() %></td>
				</tr>
			</table>
			<br><br>
	        <a class="btn btn-primary" href="<%=contextPath %>/memManage.me">회원목록</a>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
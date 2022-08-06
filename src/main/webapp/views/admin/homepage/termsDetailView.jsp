<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.notice.model.vo.Terms"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 상세페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<%
	 	Terms t = (Terms)request.getAttribute("t");
	%>
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">이용약관</h1>
        <br><br><br>

        <form action="<%= contextPath %>/adTermsUpdate.no" method="post")>
        	<input type="hidden" name="termsNo" value="<%= t.getTermsNo() %>">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>약관번호</th>
					<td><%= t.getTermsNo() %></td>
				</tr>
				<tr>
					<th>약관명</th>
					<td><input type="text" name="termsTitle" value="<%= t.getTermsTitle() %>"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><select name="termsStatus">
						  <option value="Y" <%="Y".equals(t.getTermsStatus())?"selected":""%>>게시중</option>
						  <option value="N" <%="N".equals(t.getTermsStatus())?"selected":""%>>보류</option>
						</select>
				 	</td>
				</tr>
				<tr>
					<th>게시영역</th>
					<td><input type="text" name="termsPage" value="<%= t.getTermsPage() %>"></td>
				</tr>
				<tr>
					<th>약관내용</th>
					<td><textarea rows="30" cols="90" name="termsContent" style="resize:none" required><%= t.getTermsContent() %></textarea></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%= t.getTermsEnrollDate() %></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><input type="text" name="termsNote" value="<%= (t.getTermsNote() == null) ? "" : t.getTermsNote() %>"></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" onclick="location.href='<%= contextPath %>/adTermsList.no'" class="btn btn-secondary">약관목록</button>&nbsp;
			<button type="submit" class="btn btn-primary">수정하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>
</body>
</html>
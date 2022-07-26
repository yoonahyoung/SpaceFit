<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너관리 상세페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	 <%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">배너 수정</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>배너번호</th>
					<td>00001</td>
				</tr>
				<tr>
					<th>배너명</th>
					<td><input type="text" value="배너명 A"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><select>
						  <option>게시중</option>
						  <option>보류</option>
						</select>
				 	</td>
				</tr>
				<tr>
					<th>배너이미지</th>
					<td><input type="file"></td>
				</tr>
				<tr>
					<th>등록url</th>
					<td><input type="text" value="링크 첨부하기"></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" class="btn btn-secondary">취소하기</button>&nbsp;
			<button type="button" class="btn btn-primary">수정하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>
	
</body>
</html>
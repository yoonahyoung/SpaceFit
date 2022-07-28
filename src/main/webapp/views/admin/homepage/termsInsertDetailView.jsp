<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">약관 등록</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				
				<tr>
					<th>약관명</th>
					<td><input type="text" value=""></td>
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
					<th>게시영역</th>
					<td><input type="text" value=""></td>
				</tr>
				<tr>
					<th>약관내용</th>
					<td><textarea rows="30" cols="90" style="resize:none" required></textarea></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><input type="text" value=""></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" class="btn btn-secondary">취소하기</button>&nbsp;
			<button type="button" class="btn btn-primary">등록하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>
	

</body>
</html>
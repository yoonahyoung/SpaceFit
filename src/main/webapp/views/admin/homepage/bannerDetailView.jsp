<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">약관 등록</h1>
        <br><br><br>

        <form action="<%=contextPath %>/adTermsInsert.no" method="post">
			<table class="table table-hover" id="dataTable">
				
				<tr>
					<th>약관명</th>
					<td><input type="text" name="termsTitle"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><select name="termsStatus">
						  <option value="Y">게시중</option>
						  <option value="N">보류</option>
						</select>
				 	</td>
				</tr>
				<tr>
					<th>게시영역</th>
					<td><input type="text" name="termsPage"></td>
				</tr>
				<tr>
					<th>약관내용</th>
					<td><textarea rows="30" cols="90" style="resize:none" name="termsContent" required></textarea></td>
				</tr>
				<tr>
					<th>비고</th>
					<td><input type="text" name="termsNote"></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" onclick="location.href='<%=contextPath%>/adTermsList.no'" class="btn btn-secondary">배너목록</button>&nbsp;
			<button type="submit" class="btn btn-primary">수정하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>
</body>
</html>
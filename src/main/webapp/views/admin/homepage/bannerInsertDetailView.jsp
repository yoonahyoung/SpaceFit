<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">배너 등록</h1>
        <br><br><br>

        <form action="<%=contextPath%>/adBannerInsert.ev" method="post" enctype="multipart/form-data">
        
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>배너명</th>
					<td><input type="text" name="banName"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><select name="banStatus">
						  <option value="N">보류</option>
						  <option value="Y">게시중</option>
						</select>
				 	</td>
				</tr>
				<tr>
					<th>배너이미지</th>
					<td><input type="file" name="banImg"></td>
				</tr>
				<tr>
					<th>등록url</th>
					<td><input type="text" name="banURL"></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" onclick="location.href='<%=contextPath%>/adBannerList.ev'" class="btn btn-secondary">배너목록</button>&nbsp;
			<button type="submit" class="btn btn-primary">등록하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>

</body>
</html>
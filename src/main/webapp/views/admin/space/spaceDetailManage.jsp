<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 정보</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">공간 정보</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>공간명</th>
					<td>공간명 들어올 자리</td>
				</tr>
				<tr>
					<th>최대 수용 인원</th>
                    <td>수용 인원 들어올 자리</td>
					<!-- <td><input type="text" value="user01" readOnly></td> -->
				</tr>
				<tr>
					<th>공간소개</th>
                    <td>공간소개 들어올 자리</td>
					<!-- <td><input type="text" value="김딘딘" readOnly></td> -->
				</tr>
				<tr>
					<th>대표사진</th>
                    <td colspan="3">
                        <!-- 기본에 선택되었던 사진 와야함 -->
                        <img id="titleImg" width="250" height="200">
                    </td>
				</tr>
                <tr>
					<th>추가사진</th>
                        <!-- 기본에 선택되었던 사진 와야함 -->
                        <td><img id="contentImg1" width="200" height="150"></td>
                        <td><img id="contentImg2" width="200" height="150"></td>
                        <td><img id="contentImg3" width="200" height="150"></td>
				</tr>
				<tr>
					<th>정보수정일</th>
                    <td>xx.xx.xx</td>
					<!-- <td><input type="text" value="정보수정일" readOnly></td> -->
				</tr>
			</table>
			<br><br>
			<button type="button" class="btn btn-primary">공간수정</button>
	        <button type="button" class="btn btn-danger">공간삭제</button>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
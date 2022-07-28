<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 발급 및 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">쿠폰 등록</h1>
        <br><br>
        
        <button type="button" class="btn btn-primary float-right" style="margin-right:10px; margin-bottom:15px;">등록하기</button>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>쿠폰명</th>
					<td><input type="text" value=""></td>
				</tr>
				<tr>
					<th>할인금액</th>
					<td><input type="text">&nbsp;&nbsp;원</td>
				</tr>
				
			</table>
	        
		</form>
		
		<br><br><br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">쿠폰 발급</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>전체회원쿠폰 발급</th>
					<td><input type="radio" value=""></td>
				</tr>
				<tr>
					<th>그룹회원쿠폰 발급</th>
					<td>
						<input type="radio" value="">&nbsp;&nbsp;&nbsp;
						<select>
						  <option>Basic</option>
						  <option>Silver</option>
						  <option>Gold</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>개별회원쿠폰 발급</th>
					<td>
						<input type="radio" value="">&nbsp;&nbsp;&nbsp;
						<input type="text" value="">
					</td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" class="btn btn-secondary">취소하기</button>&nbsp;
			<button type="button" class="btn btn-primary">발급하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>

</body>
</html>
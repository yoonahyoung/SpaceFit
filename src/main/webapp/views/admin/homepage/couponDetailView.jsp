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
        
        <form action="<%=contextPath %>/adCouponInsert.me" method="post">
        	<button type="submit" class="btn btn-primary float-right" style="margin-right:10px; margin-bottom:15px;">등록하기</button>

       
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>쿠폰명</th>
					<td><input type="text" name="cpName"></td>
				</tr>
				<tr>
					<th>할인금액</th>
					<td><input type="text" name="cpDiscount">&nbsp;&nbsp;원</td>
				</tr>
				<tr>
					<th>만료일</th>
					<td><input type="date" name="cpEndDate">&nbsp;&nbsp;(회원등록가능쿠폰일시 입력)</td>
				</tr>
				
			</table>
	        
		</form>
		
		<br><br><br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">쿠폰 발급</h1>
        <br><br><br>

        <form action="<%=contextPath %>/adMemCouponInsert.me" method="post">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>발급할 쿠폰번호</th>
					<td>
						<input type="number" name="cpNo">
					</td>
				</tr>
				<tr>
					<th>쿠폰 만료일</th>
					<td>
						<input type="date" name="mcpEndDate">
					</td>
				</tr>
				<tr>
					<th>전체회원쿠폰 발급</th>
					<td><input type="radio" name="cpGroup" value="전체회원"></td>
				</tr>
				<tr>
					<th>그룹회원쿠폰 발급</th>
					<td>
						<input type="radio" name="cpGroup" value="그룹회원">&nbsp;&nbsp;&nbsp;
						<select name="cpGroup_2">
						  <option value="1">Basic</option>
						  <option value="2">Silver</option>
						  <option value="3">Gold</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>개별회원쿠폰 발급</th>
					<td>
						<input type="radio" name="cpGroup" value="개별회원">&nbsp;&nbsp;&nbsp;
						<input type="text" name="cpGroup_3" placeholder="회원아이디 입력">
					</td>
				</tr>
				
				
			</table>
			<br><br>
			<button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/adCouponList.me'">쿠폰목록</button>&nbsp;
			<button type="submit" class="btn btn-primary">발급하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>

</body>
</html>
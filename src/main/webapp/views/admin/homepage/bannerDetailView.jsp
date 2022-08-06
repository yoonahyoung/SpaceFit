<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.event.model.vo.Banner"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 상세페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<% 
		Banner b = (Banner)request.getAttribute("b");
		String originName = (String)request.getAttribute("originName");
	%>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">배너 관리</h1>
        <br><br><br>

        <form action="<%=contextPath%>/adBannerUpdate.ev" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="banNo" value="<%=b.getBanNo()%>">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>배너번호</th>
					<td><%=b.getBanNo()%></td>
				</tr>
				<tr>
					<th>배너명</th>
					<td><input type="text" name="banName" value="<%=b.getBanName()%>"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><select name="banStatus">
						  <option value="Y" <%="Y".equals(b.getBanStatus())?"selected":""%>>게시중</option>
						  <option value="N" <%="N".equals(b.getBanStatus())?"selected":""%>>보류</option>
						</select>
				 	</td>
				</tr>
				<tr>
					<th>배너이미지</th>
					<td>
						<div>
                        	<img src="<%=contextPath %>/<%=b.getBanImg()%>" width="500" height="300">
                    	</div><br>
                        <input type="file" name="banImg">
					</td>
				</tr>
				<tr>
					<th>등록url</th>
					<td><input type="text" name="banURL" value="<%=b.getBanURL()%>"></td>
				</tr>
				
			</table>
			<br><br>
			<button type="button" onclick="location.href='<%=contextPath%>/adBannerList.ev'" class="btn btn-secondary">배너목록</button>&nbsp;
			<button type="submit" class="btn btn-primary">수정하기</button>
	        
		</form>
		        
    </div>

	<div style="height : 100px"></div>
</body>
</html>
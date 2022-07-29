<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.product.model.vo.*"%>
<%
	Space s = (Space)request.getAttribute("s");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">공간 수정</h1>
        <br><br><br>

        <form id="update-form">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>공간분류</th>
                    <td colspan="3">
						<select name="category">
							<option value="studio">스튜디오</option>
							<option value="practice">연습실</option>
							<option value="party">파티룸</option>
						</select>
						<script>
							$("#update-form option").each(function(){
								if($(this).val() == "<%= s.getSpaceCategory() %>"){
									$(this).attr("selected", true);
								}
							})
						</script>
					</td>
				</tr>
				<tr>
					<th>공간명</th>
                    <td colspan="3"><input type="text" value="<%=s.getSpaceName() %>"></td>
				</tr>
				<tr>
					<th>최대 수용 인원</th>
					<td colspan="3"><input type="number" value="<%=s.getSpaceLimit() %>"></td>
				</tr>
				<tr>
					<th>시간당 가격</th>
					<td colspan="3"><input type="number" value="<%=s.getSpacePrice() %>"></td>
				</tr>
				<tr>
					<th>공간소개</th>
                    <td colspan="3">
                        <textarea name="" id="" cols="100" rows="20" style="resize:none"><%=s.getSpaceInfo() %></textarea>
                    </td>
				</tr>
				<tr>
					<th>대표사진</th>
                    <td colspan="3">
                        <img id="titleImg" width="250" height="200" onclick="chooseFile(1);" src="<%=contextPath%>/<%=s.getSpacePic()%>"> <input type="file">
                    </td>
				</tr>
                <tr>
					<th>추가사진</th>
                    <td><img id="contentImg1" width="200" height="150" onclick="chooseFile(2);"> <input type="file"></td>
                    <td><img id="contentImg2" width="200" height="150" onclick="chooseFile(3);"> <input type="file"></td>
                    <td><img id="contentImg3" width="200" height="150" onclick="chooseFile(4);"> <input type="file"></td>
				</tr>
				<tr>
					<th>공간등록일</th>
					<td><input type="text" value="<%=s.getSpaceEnDate() %>" readOnly disabled></td>
				</tr>
			</table>

			<br><br>
			<button type="button" class="btn btn-primary">수정완료</button>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
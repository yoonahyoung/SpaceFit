<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">FAQ 등록</h1>
        <br><br><br>

        <form id="enroll-form" action="<%=contextPath%>/adInsert.fa" method="post">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>제목</th>
                    <td colspan="3"><input type="text" required name="title" style="width:600px"></td>
				</tr>
				<tr>
					<th>내용</th>
                    <td colspan="3"><textarea name="content" cols="100" rows="20" style="resize:none" required></textarea></td>
				</tr>
				
			</table>
			<br><br>
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-danger">초기화</button>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
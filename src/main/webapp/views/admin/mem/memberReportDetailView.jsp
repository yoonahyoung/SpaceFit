<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.mem.model.vo.Report"%>
<%
	Report r = (Report)request.getAttribute("r");
	String content = (String)request.getAttribute("content");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고상세조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">후기상세조회</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">			
				<tr>
					<th width="200px">글 번호</th>					
                    <td width="700px"><%= r.getRptRefNo() %><td>
				</tr>
				<tr>
					<th>종류</th>					
                    <td><%= r.getCategory() %><td>
				</tr>	
				<tr>
					<th>작성자</th>
					<td><%= r.getRptMemId() %></td>
				</tr>	
				
											
				<tr>
					<th>글 / 댓글 내용</th>					
                    <td><input type="textarea" value="<%= content %>" style="width:600px; height:300px;" readonly><td>
				</tr>					
			
			</table>
			<br><br>
			
			  <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
			  <button type="button" class="btn btn-sm btn-danger" onclick="location.href='<%=contextPath%>/statusChange.rp?rno=<%=r.getRptRefNo()%>&category=<%= r.getCategory() %>'">비공개 설정</button>										 
			  <button type="button" class="btn btn-sm btn-primary" onclick="location.href='<%=contextPath%>/blackListUpdateB.rp?memId=<%= r.getRptMemId()%>'">블랙리스트 설정</button>
			
			
		</form>
		        
    </div>

	<div style="height : 100px"></div>
	

	
</body>
</html>
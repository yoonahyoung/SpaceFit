<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.notice.model.vo.*"%>
<%
	FAQ f = (FAQ)request.getAttribute("f");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">FAQ 수정</h1>
        <br><br><br>

        <form id="update-form" action="<%=contextPath%>/adUpdate.fa?no=<%=f.getFaqNo() %>" method="post">
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>제목</th>
                    <td colspan="3"><input type="text" name="title" value="<%=f.getFaqTitle() %>" style="width:600px" required></td>
				</tr>
				<tr>
					<th>게시여부</th>
                    <td>
						<input type="radio" id="radioY" name="status" value="Y"> 
        				<label for="radioY" style="margin:0 10px 0 10px">Y</label>
        				<input type="radio" id="radioN" name="status" value="N"> 
        				<label for="radioN" style="margin:0 10px 0 10px">N</label>
					</td>
				</tr>
				<tr>
					<th>내용</th>
                    <td colspan="3"><textarea name="content" cols="100" rows="20" style="resize:none" required><%=f.getFaqContent() %></textarea></td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="btn btn-primary">수정완료</button>
			<button type="reset" class="btn btn-danger">초기화</button>
		</form>
		        
    </div>
    
    <script>
    	$(function(){
    		if(<%=f.getFaqStatus().equals("Y")%>){
	    		$("#radioY").prop('checked', true);
    		}else{
    			$("#radioN").prop('checked', true);
    		}
    		
    	}) 
    </script>

	<div style="height : 100px"></div>

	
</body>
</html>
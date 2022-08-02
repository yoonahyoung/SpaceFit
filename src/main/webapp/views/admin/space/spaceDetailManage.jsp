<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.attachment.model.vo.*, com.spacefit.product.model.vo.*"%>
<%
	Space s = (Space)request.getAttribute("s");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
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
					<th>공간분류</th>
                    <td colspan="3">
						<%if(s.getSpaceCategory().equals("studio")){ %>
							스튜디오                                        
                       	<%}else if(s.getSpaceCategory().equals("practice")){ %>
                    		연습실
                     	<%}else if(s.getSpaceCategory().equals("party")){ %>
                     		파티룸
                     	<%} %>
					</td>
				</tr>
				<tr>
					<th>공간명</th>
					<td><%= s.getSpaceName() %></td>
				</tr>
				<tr>
					<th>최대 수용 인원</th>
                    <td><%= s.getSpaceLimit() %></td>
				</tr>
				<tr>
					<th>시간당 가격</th>
                    <td><%= s.getSpacePrice() %></td>
				</tr>
				<tr>
					<th>공간소개</th>
                    <td><%= s.getSpaceInfo() %></td>
				</tr>
				<tr>
					<th>대표사진</th>
                    <td colspan="3">
                        <!-- 기본에 선택되었던 사진 와야함 -->
                        <img src="<%=contextPath%>/<%= s.getSpacePic() %>" width="250" height="200">
                    </td>
				</tr>
                <tr>
					<th>추가사진</th>
                        <!-- 기본에 선택되었던 사진 와야함 -->
                        <%for(int i=0; i<list.size(); i++){ %>
                        <td><img id="contentImg<%= i %>" width="200" height="150" src="<%= contextPath %>/<%= list.get(i).getFilePath() + list.get(i).getFileChangeName() %>"></td>
                        <%} %>
				</tr>
				<tr>
					<th>공간등록일</th>
                    <td><%= s.getSpaceEnDate() %></td>
					<!-- <td><input type="text" value="정보수정일" readOnly></td> -->
				</tr>
				
			</table>
			<br><br>
			<a href="<%=contextPath%>/adList.sp" type="button" class="btn btn-secondary">목록가기</a>
			<a href="<%=contextPath%>/adUpdateForm.sp?no=<%= s.getSpaceNo() %>" type="button" class="btn btn-primary">공간수정</a>
	        <a href="<%=contextPath%>/adDelete.sp?no=<%=s.getSpaceNo() %>" type="button" class="btn btn-danger">공간삭제</a>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
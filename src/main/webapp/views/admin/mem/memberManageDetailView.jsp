<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.spacefit.mem.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">회원수정</h1>
        <br><br><br>

        <form>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>회원번호</th>
					<td><%=list.get(0).getMemNo() %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=list.get(0).getMemId() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=list.get(0).getMemName() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><%=list.get(0).getMemIdNo() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="<%=list.get(0).getMemPhone() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="<%=list.get(0).getMemMail() %>"></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>
						<select>
						  <option selected><%=list.get(0).getGrName() %></option>
						  <option>Basic</option>
						  <option>Silver</option>
						  <option>Gold</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>총 주문건</th>
					<td><%=list.get(0).getBookCountAll() %></td>
				</tr>
				<tr>
					<th>이번달 주문건</th>
					<td><%=list.get(0).getBookCountMonth() %></td>
				</tr>
				<tr>
					<th>총 주문액</th>
					<td><%=list.get(0).getBookAmountAll() %></td>
				</tr>
				<tr>
					<th>이번달 주문액</th>
					<td><%=list.get(0).getBookAmountMonth() %></td>
				</tr>
				<tr>
					<th>누적신고</th>
					<td><%=list.get(0).getRptCount() %></td>
				</tr>
				<tr>
					<th>누적추천</th>
					<td><%=list.get(0).getLikeCount() %></td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
						<select>
						  <option selected><%=list.get(0).getMemStatus() %></option>
						  <option>회원</option>
						  <option>탈퇴회원</option>
						  <option>블랙리스트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>운영자여부</th>
					<td>
						<select>
						  <option selected><%=list.get(0).getMemAdmFlag() %></option>
						  <option>일반</option>
						  <option>관리자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td><input type="text" value="<%=list.get(0).getMemEnrollDate() %>" readOnly></td>
				</tr>
				<tr>
					<th>정보수정일</th>
					<td><input type="text" value="<%=list.get(0).getMemModifyDate() %>"></td>
				</tr>
			</table>
			<br><br>
			<button type="button" class="btn btn-primary">회원수정</button>
	        <button type="button" class="btn btn-secondary">회원목록</button>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기상세조회</title>
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
					<th>회원번호</th>
					<td>00001</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" value="user01" readOnly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="김딘딘" readOnly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" value="88/07/26"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="01088886666"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="user01@gmail.com"></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>
						<select>
						  <option selected>Basic</option>
						  <option>Basic</option>
						  <option>Silver</option>
						  <option>Gold</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>총 주문건</th>
					<td>15</td>
				</tr>
				<tr>
					<th>이번달 주문건</th>
					<td>2</td>
				</tr>
				<tr>
					<th>총 주문액</th>
					<td>500,000</td>
				</tr>
				<tr>
					<th>이번달 주문액</th>
					<td>15</td>
				</tr>
				<tr>
					<th>누적신고</th>
					<td>3</td>
				</tr>
				<tr>
					<th>누적추천</th>
					<td>21</td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
						<select>
						  <option selected>회원</option>
						  <option>회원</option>
						  <option>탈퇴회원</option>
						  <option>블랙리스트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
						<select>
						  <option selected>일반</option>
						  <option>일반</option>
						  <option>관리자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td><input type="text" value="회원가입일" readOnly></td>
				</tr>
				<tr>
					<th>정보수정일</th>
					<td><input type="text" value="정보수정일" readOnly></td>
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
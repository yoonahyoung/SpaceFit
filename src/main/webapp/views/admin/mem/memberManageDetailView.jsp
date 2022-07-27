<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/book.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
	 <div class="outerRv">
       
        <br>
        <h2 align="center">회원정보수정</h2>
        <br><br>
        
        <form>
		<table class="table table-hover">
			<tr>
				<td>회원번호</td>
				<td>00001</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" value="user01" readOnly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" value="김딘딘" readOnly></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" value="88/07/26"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" value="01088886666"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" value="user01@gmail.com"></td>
			</tr>
			<tr>
				<td>회원등급</td>
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
				<td>총 주문건</td>
				<td>15</td>
			</tr>
			<tr>
				<td>이번달 주문건</td>
				<td>2</td>
			</tr>
			<tr>
				<td>총 주문액</td>
				<td>500,000</td>
			</tr>
			<tr>
				<td>이번달 주문액</td>
				<td>15</td>
			</tr>
			<tr>
				<td>누적신고</td>
				<td>3</td>
			</tr>
			<tr>
				<td>누적추천</td>
				<td>21</td>
			</tr>
			<tr>
				<td>회원상태</td>
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
				<td>회원상태</td>
				<td>
					<select>
					  <option selected>일반</option>
					  <option>일반</option>
					  <option>관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>회원가입일</td>
				<td><input type="text" value="회원가입일" readOnly></td>
			</tr>
			<tr>
				<td>정보수정일</td>
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
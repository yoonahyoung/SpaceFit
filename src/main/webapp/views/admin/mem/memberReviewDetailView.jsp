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
        	<div class="row" id="photoReview">
			  <div class="col photoRev" id="photoRev1" name="photoRev1">이미지가 없습니다.</div>
			  <div class="col photoRev" id="photoRev2" name="photoRev2">이미지가 없습니다.</div>
			  <div class="col photoRev" id="photoRev3" name="photoRev3">이미지가 없습니다.</div>
			  <div class="col photoRev" id="photoRev3" name="photoRev3">이미지가 없습니다.</div>
			</div>
			<div style="height : 30px"></div>
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>후기번호</th>
					<td>00001</td>
				</tr>
				<tr>
					<th>예약번호</th>
					<td>00001</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="김딘딘" readOnly></td>
				</tr>
				<tr>
					<th>평점</th>
					<td>4</td>
				</tr>
				<tr>
					<th>후기내용</th>
					<td><input type="text" value="정말 좋았어요" readOnly></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>22/03/15</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>22/03/15</td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td>
						<input type="radio" name="memGrade" value="B" checked>Basic &nbsp;
                     	<input type="radio" name="memGrade" value="S">Silver&nbsp;
                     	<input type="radio" name="memGrade" value="G">Gold&nbsp;
					</td>
				</tr>
				<tr>
					<th>신고</th>
					<td>3</td>
				</tr>
				<tr>
					<th>추천</th>
					<td>21</td>
				</tr>
				<tr>
					<th>후기글 상태</th>
					<td>
						<input type="radio" name="revStatus" value="Y" checked>공개 &nbsp;
                     	<input type="radio" name="revStatus" value="N">비공개&nbsp;
                     	<input type="radio" name="revStatus" value="B">베스트후기&nbsp;
					</td>
				</tr>
				<tr>
					<th>게시글 주소로 이동</th>
					<td>
						<input type="button" class="btn btn-primary btn-sm" value="goToReview" onclick="revDetailView();">
					</td>
                       <script>
                      		 function revDetailView(){
           	       		location.href="<%=contextPath%>/memRevDetailView.me";
           				}
                       </script>
				</tr>
				<tr>
			</table>
			<br><br>
			<button type="button" class="btn btn-primary">베스트 후기 등록</button>
			<button type="button" class="btn btn-warning">후기 수정</button>
	        <button type="button" class="btn btn-secondary">후기목록</button>
		</form>
		        
    </div>
	
    

	<div style="height : 100px"></div>

	
</body>
</html>
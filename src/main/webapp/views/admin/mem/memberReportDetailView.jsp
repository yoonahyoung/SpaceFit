<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<th>신고번호</th>
					<td colspan="2">00001</td>
				</tr>
				<tr>
					<th>글 / 댓글 번호</th>
					<td><input type="radio" name="reviewRadio" value="R" checked>리뷰글 &nbsp;
                     	<input type="radio" name="commentRadio" value="C">댓글&nbsp;
                    </td>
                    <td>00001<td>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="2"><input type="text" value="user02" readOnly></td>
				</tr>
				<tr>
					<th>신고자</th>
					<td colspan="2"><input type="text" value="user05" readOnly></td>
				</tr>
				<tr>
					<th>글 / 댓글 내용</th>
					<td><input type="radio" name="reviewRadio" value="R" checked>리뷰글 &nbsp;
                     	<input type="radio" name="commentRadio" value="C">댓글&nbsp;
                    </td>
                    <td>야 니가 뭔데 나한테 이래라 저래라야 죽을래 진짜?ㅋㅋㅋㅋ<td>
				</tr>
				<tr>
					<th>신고사유</th>
					<td td colspan="2">
						<select>
						  <option selected>욕설 또는 비방</option>
						  <option>욕설 또는 비방</option>
						  <option>성적이고 음란한 대화</option>
						  <option>스팸이거나 금전적 내용</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>신고일</th>
					<td td colspan="2">22/03/15</td>
				</tr>
				<tr>
					<th>누적신고</th>
					<td td colspan="2">3</td>
				</tr>
				<tr>
					<th>글 / 댓글 상태</th>
					<td td colspan="2">
						<input type="radio" name="revStatus" value="Y" checked>공개 &nbsp;
                     	<input type="radio" name="revStatus" value="N">비공개&nbsp;
					</td>
				</tr>
				<tr>
					<th>게시글 주소로 이동</th>
					<td td colspan="2">
						<input type="button" class="btn btn-primary btn-sm" value="goToReview" onclick="revDetailView();">
					</td>
                       <script>
                      		 function revDetailView(){
           	       		location.href="<%=contextPath%>/memRevDetailView.me";
           				}
                       </script>
				</tr>
			</table>
			<br><br>
			<form>
			  <button class="btn btn-primary">게시글 / 댓글 복구</button>
			  <button class="btn btn-secondary">비공개 설정</button>
			  <button class="btn btn-dark">블랙리스트 등록</button>
			</form>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
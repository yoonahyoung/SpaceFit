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
                    <td colspan="3"><input name="" type="text" value="<%=s.getSpaceName() %>" required></td>
				</tr>
				<tr>
					<th>최대 수용 인원</th>
					<td colspan="3"><input type="number" value="<%=s.getSpaceLimit() %>" required></td>
				</tr>
				<tr>
					<th>시간당 가격</th>
					<td colspan="3"><input type="number" value="<%=s.getSpacePrice() %>" required></td>
				</tr>
				<tr>
					<th>공간소개</th>
                    <td colspan="3">
                        <textarea name="" id="" cols="100" rows="20" style="resize:none" required><%=s.getSpaceInfo() %></textarea>
                    </td>
				</tr>
				<tr>
					<th>대표사진</th>
                    <td colspan="3">
                        <img id="titleImg" width="250" height="200" onclick="chooseFile(1);" src="<%=contextPath%>/<%=s.getSpacePic()%>">
                    </td>
				</tr>
                <tr>
					<th>추가사진</th>
                    <td><img id="contentImg1" width="200" height="150" onclick="chooseFile(2);"></td>
                    <td><img id="contentImg2" width="200" height="150" onclick="chooseFile(3);"></td>
                    <td><img id="contentImg3" width="200" height="150" onclick="chooseFile(4);"></td>
				</tr>
				<tr>
					<th>공간등록일</th>
					<td><input type="text" value="<%=s.getSpaceEnDate() %>" readOnly disabled></td>
				</tr>
			</table>
			
			<div id="file-area" style="display:none">
                <input type="file" name="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" onchange="loadImg(this, 4);">
            </div>
	
			<script>
				function chooseFile(num){
					$("input[name=file" + num + "]").click();
				}
				function loadImg(inputFile, num){
					if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일 읽어들여서 미리보기
						const reader = new FileReader();
						// 파일을 읽어들이는 메소드
						reader.readAsDataURL(inputFile.files[0]);
						
						// 파일 읽어들이기가 완료됐을 때 실행할 함수를 정의해두기
						reader.onload = function(e){
							switch(num){
								case 1: $("#titleImg").attr("src", e.target.result); break;
								case 2: $("#contentImg1").attr("src", e.target.result); break;
								case 3: $("#contentImg2").attr("src", e.target.result); break;
								case 4: $("#contentImg1").attr("src", e.target.result); break;
							}
						}
					}else{ // 파일취소됐을 경우 => 미리보기된 것도 사라지게
						switch(num){
							case 1: $("#titleImg").attr("src", null); break;
							case 2: $("#contentImg1").attr("src", null); break;
							case 3: $("#contentImg2").attr("src", null); break;
							case 4: $("#contentImg1").attr("src", null); break;
						}
					}
				}
			</script>

			<br><br>
			<button type="submit" href="<%=contextPath%>/adUpdate.sp?no=<%=s.getSpaceNo() %>" class="btn btn-primary">수정완료</button>
			<a href="<%=contextPath%>/adList.sp" type="button" class="btn btn-secondary">뒤로가기</a>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
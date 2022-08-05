<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>
	
     <div class="outerRv">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">공간 등록</h1>
        <br><br><br>

        <form id="enroll-form" action="<%=contextPath%>/adInsert.sp" method="post" enctype="multipart/form-data" >
			<table class="table table-hover" id="dataTable">
				<tr>
					<th>공간분류</th>
                    <td colspan="3">
						<select name="category">
							<option value="studio">스튜디오</option>
							<option value="practice">연습실</option>
							<option value="party">파티룸</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>공간명</th>
                    <td colspan="3"><input type="text" required name="spName"></td>
				</tr>
				<tr>
					<th>최대 수용 인원</th>
					<td colspan="3"><input type="text" required name="spLimit"></td>
				</tr>
				<tr>
					<th>시간당 가격</th>
					<td colspan="3"><input type="text" required name="spPrice"></td>
				</tr>
				<tr>
					<th>공간소개</th>
                    <td colspan="3">
                        <textarea name="spInfo" id="" cols="100" rows="20" style="resize:none; white-space:pre;" required ></textarea>
                    </td>
				</tr>
				<tr>
					<th>대표사진</th>
                    <td colspan="3">
                        <img id="titleImg" width="250" height="200" onclick="chooseFile(1);">
                    </td>
				</tr>
                <tr>
					<th>추가사진</th>
                        <td><img id="contentImg1" width="200" height="150" onclick="chooseFile(2);"></td>
                        <td><img id="contentImg2" width="200" height="150" onclick="chooseFile(3);"></td>
				</tr>
			</table>
			
			<!-- 대표이미지와 상세이미지 설정하기 -->
            <div id="file-area" style="display:none">
                <input type="file" name="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" onchange="loadImg(this, 3);">
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
							}
						}
					}else{ // 파일취소됐을 경우 => 미리보기된 것도 사라지게
						switch(num){
							case 1: $("#titleImg").attr("src", null); break;
							case 2: $("#contentImg1").attr("src", null); break;
							case 3: $("#contentImg2").attr("src", null); break;
						}
					}
				}
			</script>
	
			<br><br>
			<button type="submit" class="btn btn-primary">공간등록</button>
			<button type="reset" class="btn btn-danger">초기화</button>
		</form>
		        
    </div>

	<div style="height : 100px"></div>

	
</body>
</html>
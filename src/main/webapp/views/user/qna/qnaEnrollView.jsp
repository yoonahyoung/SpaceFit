<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의등록</title>
<style>
    .outer{
		height: 700px;
        width: 800px;
        margin: auto;
        margin-top: 50px;
    }
    th{
        font-size: 16px;
    }
	select, option {
	text-align: center;
	width: 80px;
    height: 25px;
	}
	table{
		width: 700px;
		text-align: center;
		color: black;
	}
    #enroll-form input, #enroll-form textarea{
        width: 100%;
        box-sizing: border-box;
    }

</style>
</head>
<body>
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2 align="center" style="color:#0D6EFD ;">1 : 1 문의</h2>
        <br>

        <form action="<%=contextPath%>/insert.bo" id="enroll-form" method="post" enctype="multipart/form-data">
            <table align="center" >
                <tr>
                    <th width="70">유형</th>
                    <td width="50">
                        <select name="category">
							<option value="">공간</option>
							<option value="">결제</option>
							<option value="">예약</option>
							<option value="">기타</option>
                        </select>
                    </td>
					<th width="40">공간</th>
                    <td width="50">
						<!-- 공간목록에서 가져와야함 -->
						<select name="" id="">
							<option value="">파티룸A</option>
							<option value="">파티룸B</option>
							<option value="">파티룸C</option>
							<option value="">파티룸D</option>
						</select>
                    </td>
					<th idth="70">제목</th>
                    <td colspan="5"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="5"><textarea rows="10" name="content" required style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
            </table>
            <br>

            <div align="right">
                <button class="btn btn-sm btn-primary" type="submit">작성</button>
                <button type="reset" class="btn btn-sm btn-secondary" onclick="history.back();">취소</button>
            </div>
        </form>

        <br><br>

    </div>
    
<%@ include file="../common/userFooter.jsp" %>

</body>
</html>
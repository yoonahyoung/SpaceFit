<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../../../resources/user/css/member.css">
</head>
<body>

   <%@ include file="../common/userMenubar.jsp" %>
   
   <h2 align="center">비밀번호 변경</h2>
   <br>
   

    <div class="card pwdChangeCard">
        <div class="pwdChangeDiv">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">현재 비밀번호</label>
                <input class="form-control" placeholder="현재 비밀번호를 입력해주세요"/>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">새 비밀번호</label>
                <input class="form-control" placeholder="신규 비밀번호를 입력해주세요"/>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">새 비밀번호 확인</label>
                <input class="form-control" placeholder="신규 비밀번호를 다시 입력해주세요"/>
            </div>
            
            <br><br>
            <div align="center">
                <button type="button" class="btn btn-secondary">취소하기</button>&nbsp;
                <button type="button" class="btn btn-primary">변경하기</button>
                <br>
            </div>
        
        </div>
    </div>
    
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	.pwdChangeDiv{
     width:400px;
     height:300px;
     position:absolute;
     top:50%;
     left:50%;
     margin:-150px 0px 0px -200px;
	}
	    
	.pwdChangeDiv input{
		 border-color:lightgray;
		 font-size:14px;
		 color:black;
	}
	
	.pwdChangeDiv label{
	     font-weight: 550;
	}
	    
	.pwdChangeCard {
	     width:550px;
	     height:480px;
	     border-radius: 30px;
	     box-shadow: 2px 2px 10px 0px #0D6EFD;
	     position:absolute;
	     top:43%;
	     left:43%;
	     margin:30px 0px 0px -140px;
	}
</style>
</head>
<body>

   <%@ include file="../common/userMenubar.jsp" %>
   
   <%
		String memId = loginUser.getMemId(); 
   %>
   
   <h2 align="center">비밀번호 변경</h2>
   <br>
   

    <div class="card pwdChangeCard">
        <div class="pwdChangeDiv">
        	<form action="<%=contextPath %>/updatePwd.me" method="post" id="mem-updatePwd-form">
        		<input type="hidden" name="memId" value="<%=memId%>">
	            <div class="mb-3">
	                <label for="exampleFormControlInput1" class="form-label">현재 비밀번호</label>
	                <input type="password" name="memPwd" class="form-control" placeholder="현재 비밀번호를 입력해주세요" required/>
	            </div>
	            <div class="mb-3">
	                <label for="exampleFormControlInput1" class="form-label">새 비밀번호</label>
	                <input type="password" name="updatePwd" class="form-control" placeholder="신규 비밀번호를 입력해주세요" required/>
	            </div>
	            <div class="mb-3">
	                <label for="exampleFormControlInput1" class="form-label">새 비밀번호 확인</label>
	                <input type="password" name="checkPwd" class="form-control" placeholder="신규 비밀번호를 다시 입력해주세요" required/>
	            </div>
	            
	            <br><br>
	            <div align="center">
	                <button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/updatePage.me'">취소하기</button>&nbsp;
	                <button type="submit" class="btn btn-primary" onclick="return validatePwd();">변경하기</button>
	                <br>
	            </div>
        	</form>
        	
        	<script>
        		function validatePwd(){
        			
        			if( $("input[name=updatePwd]").val() != $("input[name=checkPwd]").val() ){
        				alert("신규 비밀번호가 일치하지 않습니다. 다시 확인해주세요!");
        				return false;
        			}
        		}
        	</script>
        </div>
    </div>
    
    
</body>
</html>
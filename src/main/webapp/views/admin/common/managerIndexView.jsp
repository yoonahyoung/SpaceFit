<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    #logo-area{
        position:relative; height:800px;       
    }    
    #manageLogo{
        position:absolute; top:50%; transform:translateY(-50%) translateX(-50%);               
    }
 </style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<img src="<%= request.getContextPath() %>/resources/admin/img/로고1.png" alt="로고" width="25%" id="manageLogo">
</body>
</html>
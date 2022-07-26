<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit</title>
</head>
<body>
	<%@ include file="../myPage/login.jsp" %>
	<script type="text/javascript">
		alert("<%=request.getAttribute("errorMsg")%>");
	function load(){
		window.location.href = "<%=contextPath%>/views/user/myPage/login.jsp";
		}
</script>
</body>
</html>
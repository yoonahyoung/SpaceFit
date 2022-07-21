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
        /* 2 */
        /* width: 690px; height: 800px;
        line-height: 800px;
        text-align: center; */        
        /* 3 */
        /* height: 800px; */
    }
    /* #logoarea:after{display:inline-block; height:100%; content:""; vertical-align:middle;} */
    #content-area img{
        position:absolute; top:50%; transform:translateY(-50%) translateX(-50%);
        /* vertical-align: middle; */
        /* line-height:800px; */
       
    }
 </style>
</head>
<body>
	<%@ include file="menubar.jsp" %>
	
	<img src="../../../resources/admin/img/로고1.png" alt="로고" width="25%">
</body>
</html>
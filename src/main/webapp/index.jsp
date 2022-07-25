<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit</title>
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
    #logo-area img{
        position:absolute; top:50%; transform:translateY(-50%) translateX(-50%);
        /* vertical-align: middle; */
        /* line-height:800px; */
       
    }
    
     body{
            color:  #0D6EFD;
        }
        .card-body {
            box-shadow : 0px 0px 12px rgb(13, 109, 253, 0.7);
            border-radius: 15px;
            width: 90%;
        }
</style>
</head>
<body>
	<%@ include file="views/user/common/userMenubar.jsp" %>
	
	
	


</body>
</html>
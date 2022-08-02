<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        text-align: center;
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    td{
        color: black;
        font-size:16px;
    }

</style>
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
<div style="height: 150px;"></div>
<div class="outer">

    <form action="">

        <table align = center>
            <tr>
                <td>게시물 비밀번호를 입력해주세요 <br><br></td>
            </tr>
            <tr>
                <td>
                    <input type="password"> <button class="btn btn-sm btn-primary">확인</button>
                </td>
            </tr>            
        </table>
        
    </form>

</div>
<div style="height: 150px;"></div>
<%@ include file="../common/userFooter.jsp" %>
</body>
</html>
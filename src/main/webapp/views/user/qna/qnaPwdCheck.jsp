<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("qna");
%>
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
        margin-top: 150px;
    }


</style>
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
    <div class="outer">

        <form action="<%=contextPath%>/checkPwd.qa" id="checkPwdform" method="post">
            <input type="hidden" name="no" value="<%=q.getQnaNo()%>">
            <table align = center>
                <tr>
                    <div style="color: black; font-size: 20px;">게시물 비밀번호를 입력해주세요</div>  <br><br>
                </tr>
                <tr>
                    <input type="password" name="inputPwd" id="inputPwd"> &nbsp;
                    <button type="submit" class="btn btn-sm btn-primary">확인</button> &nbsp;
                <button class="btn btn-sm btn-secondary" type="reset">다시입력</button>
                </tr>            
            </table>            
        </form>
        
        <div style="height: 70px;"></div>
        <div"><button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">목록으로 돌아가기</button></div>
    </div>
<div style="height: 150px;"></div>
<%@ include file="../common/userFooter.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    System.out.println(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    .table{
        text-align: center;
    }
    th{
        font-size: 18px;
        vertical-align: middle;
    }
	h2{
		color: #0d6efd !important; 
	}
</style>
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">공지사항</h2>
    <br><br><br>

    <table class="table" id="detail-area">
        <tr>
            <th width="70">제목</th>
            <td colspan="5" width="430"></td>

        </tr>
        <tr>
            <th>유형</th>
            <td></td>
            <th width="70">작성자</th>
            <td></td>
            <th width="70">작성일</th>
            <td></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5">
                <p style="height: 400px;"></p>
            </td>
        </tr>
    </table>

    <br>
	<div align="right">
        <button type="button" class="btn btn-sm btn-primary" onclick="history.back();">뒤로가기</button>
        <a href="<%= contextPath %>/list.no" class="btn btn-sm btn-secondary">목록가기</a>
    </div>
    <div style="height : 60px"></div>
 </div>
<%@ include file="../common/userFooter.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 :1 문의</title>
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
    <h2 align="center">1 : 1 문의</h2>
    <br><br><br>

    <table class="table" id="detail-area">
        <tr>
            <th width="80">제목</th>
            <td colspan="7" width="430" align="left"><%=q.getQnaTitle() %></td>

        </tr>
        <tr>
            <th>질문유형</th>
            <td><%=q.getQnaCategory() %></td>
            <th>공간분류</th>
            <td><%=q.getSpaceCategory() %></td>
            <th width="80">공간</th>
            <td><%=q.getQnaTitle() %></td>
            <th width="80">작성자</th>
            <td><%=q.getQnaWriter() %></td>
            <th width="80">작성일</th>
            <td><%=q.getQnaCreateDate() %></td>
            <th width="80">조회수</th>
            <td><%=q.getCount() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="7" align="left">
                <p style="height: 400px;"><%=q.getQnaContent() %></p>
            </td>
        </tr>
    </table>

    <br>
	<div align="right">
        <a href="<%= contextPath %>/list.no?cpage=1" class="btn btn-sm btn-secondary">목록가기</a>
    </div>
    <div style="height : 60px"></div>
 </div>
<%@ include file="../common/userFooter.jsp" %>
</body>
</html>
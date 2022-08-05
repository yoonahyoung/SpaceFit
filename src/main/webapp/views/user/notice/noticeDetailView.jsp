<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
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
	.pre{
		white-space:pre;
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
            <th width="80">제목</th>
            <td colspan="7" width="430" align="left"><%=n.getNoticeTitle() %></td>

        </tr>
        <tr>
            <th>유형</th>
            <td><%=n.getNoticeCategory() %></td>
            <th width="80">작성자</th>
            <td><%=n.getNoticeWriter() %></td>
            <th width="80">작성일</th>
            <td><%=n.getCreateDate() %></td>
            <th width="80">조회수</th>
            <td><%=n.getCount() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="7" align="left">
                <pre style="height: 400px;font-family: 'Noto Sans KR', sans-serif; font-family: 'Poppins', sans-serif;"><%=n.getNoticeContent() %></pre>
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
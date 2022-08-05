<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice, com.spacefit.mem.model.vo.Member"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
	Member loginUser = (Member)session.getAttribute("loginUser");
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
	.pre{white-space:pre;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
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
		<!-- 현재 로그인이 되어있고 로그인한 회원의 아이디가 해당 공지사항 작성자 아이디 일치할경우 -->
        <% if(loginUser != null && n.getNoticeWriter().equals(loginUser.getMemId()) ) { %>
	        <a href="<%=contextPath%>/updateForm.no?no=<%=n.getNoticeNo() %>" class="btn btn-sm btn-primary">수정</a> 
	        <a href="<%=contextPath %>/delete.no?no=<%=n.getNoticeNo() %>" class="btn btn-sm btn-danger" onclick="return deleteConfirm();">삭제</a>
    	<% } %>
	        <a href="<%= contextPath %>/adminList.no?cpage=1" class="btn btn-sm btn-secondary">목록</a>
    </div>
    <div style="height : 60px"></div>
 </div>
 <script>
    function deleteConfirm(){
        
        let result = confirm('정말 삭제하시겠습니까?');

        return result;
    }
 </script>
</body>
</html>
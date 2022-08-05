<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.QnA, com.spacefit.attachment.model.vo.Attachment"%>
<%
	QnA q = (QnA)request.getAttribute("qna");
	Attachment at = (Attachment)request.getAttribute("at");
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
	.pre{white-space:pre;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">1 : 1 문의</h2>
    <br><br><br>

    <table class="table" id="detail-area">
        <tr>
            <th width="100">제목</th>
            <td colspan="11" width="430" align="left"><%=q.getQnaTitle() %></td>

        </tr>
        <tr>
            <th>질문유형</th>
            <td><%=q.getQnaCategory() %></td>
            <th>공간분류</th>
            <td><%=q.getSpaceCategory() %></td>
            <th width="80">공간</th>
            <td><%=q.getQnaSpaceNo() %></td>
            <th width="80">작성자</th>
            <td><%=q.getQnaWriter() %></td>
            <th width="80">작성일</th>
            <td><%=q.getQnaCreateDate() %></td>
            <th width="80">조회수</th>
            <td><%=q.getCount() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="11" align="left">
                <pre style="height: 400px;font-family: 'Noto Sans KR', sans-serif; font-family: 'Poppins', sans-serif;"><%=q.getQnaContent() %></pre>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="11" align="left">
                <% if( at == null) { %>
                    <!-- case1. 첨부파일이 없을 경우 -->
                    첨부파일이 없습니다.
                <% } else { %>
                    <!-- case2. 첨부파일이 있을 경우 -->
                    <a download="<%= at.getFileOriginName() %>" href="<%=contextPath%>/<%=at.getFilePath() + at.getFileChangeName()%>"><%= at.getFileOriginName() %></a>
            		<% } %>
            </td>
        </tr>
    </table>

    <br>
	<div align="right">
		<% if (q.getQnaGroup() != 1){ %>
        <a href="<%=contextPath%>/reply.qa?no=<%=q.getQnaNo()%>" class="btn btn-sm btn-primary">답변하기</a> 
	    <% } %>
	    <a onclick="goQnAList();" class="btn btn-sm btn-secondary">목록가기</a>
    </div>
    <div style="height : 60px"></div>
 </div>

<script>
    function goQnAList(){
        location.href="<%=contextPath%>/adminList.qa?cpage=1";
    }
</script>
</body>
</html>
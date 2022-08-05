<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice"%>
<%
    Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
    #title, textarea{
        width: 100%;
        box-sizing: border-box;
    }
    textarea{
        height: 400px;
    }
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">공지사항 수정</h2>
    <br><br><br>
    
	<form action="<%=contextPath%>/update.no" id="update-form" method="post">
	<input type="hidden" name=no value="<%=n.getNoticeNo()%>">
    <table class="table" id="update-area">
        <tr>
            <th width="70">유형</th>
            <td width="70" align="left" style="padding: 12px 8px 0px 8px;">
                <input type="radio" name="category" id="nomal" value="일반"> <label for="normal">일반</label>
            </td>
            <td width="80" style="padding: 12px 8px 0px 8px;">
                <input type="radio" name="category" id="event" value="이벤트"><label for="event">이벤트</label>
            </td>
            <th width="70">제목</th>
            <td colspan="5" width="430">
                <input type="text" id="title" name="title" required value="<%=n.getNoticeTitle() %>">
            </td>

        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5">
                <textarea rows="10" name="content" style="resize: none;white-space:pre;" required><%=n.getNoticeContent()%></textarea>
            </td>
        </tr>
    </table>

    <br>
		<div align="right">
            <button onclick="<%=contextPath%>/adminDetail.no?no=<%=n.getNoticeNo() %>" class="btn btn-sm btn-primary">수정</button>
	        <a class="btn btn-sm btn-secondary" onclick="history.back();">취소</a>
	    </div>
    </form>
    <div style="height : 60px">
    </div>
 </div>
 <script>

 	<% if(n.getNoticeCategory().equals("일반")) {%>
 		$("#nomal").attr("checked", true);
 	<%} else {%>
 		$("#event").attr("checked", true);
 	<%}%>

 </script>
</body>
</html>
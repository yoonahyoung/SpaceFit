<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	String alertMsg = (String)request.getAttribute("alertMsg");
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
    }
    .table>tbody>tr:hover{
   	background:#E1F0FF;
   	cursor:pointer;
    }
	h2{
		color: #0d6efd !important; 
	}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">공지사항</h2>
    <br><br><br>
    <div align="right">
        <a href="<%=contextPath%>/enrollForm.no" class="btn btn-sm btn-primary">공지등록</a>
    </div>
    <br>
    <table class="table" align="center">
        <thead>
            <tr>
                <th width="100">글번호</th>
                <th width="100">유형</th>
                <th width="350">글제목</th>
                <th width="100">작성자</th>
                <th width="100">조회수</th>
                <th width="100">작성일</th>
            </tr>
		</thead>
		<tbody>
        <%if(list.isEmpty()) { %>
            <!-- case1. 공지글이 없을 경우 -->
            <tr>
                <td colspan="6">존재하는 공지사항이 없습니다.</td>
            </tr>
		<% } else{ %>
            <!-- case2. 공지글이 있을 경우 -->
            	<% for(Notice n : list) { %>
            <tr>
				<td><%= n.getNoticeNo() %></td>
				<td><%= n.getNoticeCategory() %></td>
				<td><%= n.getNoticeTitle() %></td>
				<td><%= n.getNoticeWriter() %></td>
				<td><%= n.getCount() %></td>
				<td><%= n.getCreateDate() %></td>
            </tr>
            <% } %>
		<% } %>     
        </tbody>
    </table>

    <br>
    <div class="paging-area" align="center">    
		        
        <button class="btn btn-sm btn-outline-primary">&lt;</button>        
        <button class="btn btn-sm btn-outline-primary" disabled>1</button>        
        <button class="btn btn-sm btn-outline-primary">2</button> 
        <button class="btn btn-sm btn-outline-primary">3</button>    
        <button class="btn btn-sm btn-outline-primary">4</button> 
        <button class="btn btn-sm btn-outline-primary">5</button>       
        <button class="btn btn-sm btn-outline-primary">&gt;</button>
        
    </div>
    <div style="height : 60px"></div>
 </div>
 <!-- 이렇게 해야 값이 담겨있을때만 alert가 실행된다 -->
    <% if(alertMsg != null) { %> 
		<script>
			alert("<%=alertMsg%>");   <%-- "" 반드시!! 따옴표!!로 묶어줘야함 안하면 alert(회원가입성공);--%>
		</script>		
		<% request.removeAttribute("alertMsg"); %> 
	<% } %>
</body>
</html>
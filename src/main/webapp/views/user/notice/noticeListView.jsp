<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
<%@ include file="../common/userMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">공지사항</h2>
    <br><br><br>

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
<%@ include file="../common/userFooter.jsp" %>
     <script>
    	$(function(){
    		$(".table>tbody>tr").click(function(){
    			const num = $(this).children().eq(0).text(); // 클릭했을때의 글번호
    			
    			// 요청할url?키=밸류&키=밸류...
    			// 요청시전달값(키=밸류) => 쿼리스트링
				
    			// /web/detail.no?no=xx
    			location.href = '<%= contextPath%>/detail.no?no=' + num;
    		})
    	})
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.QnA, com.spacefit.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
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
    .noClick{
        pointer-events: none; 
    }
</style>
</head>
<body>
<%@ include file="../common/userMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">일대일 문의</h2>
    <br><br><br>
    <div align="right">
        <a  href="<%=contextPath%>/myList.qa?cpage=1" class="btn btn-sm btn-secondary">내글조회</a>
        <a  href="<%=contextPath%>/enrollForm.qa" class="btn btn-sm btn-primary">문의등록</a>
    </div>
    <table class="table" align="center">
        <thead>
            <tr>
                <th width="90">글번호</th>
                <th width="100">질문유형</th>
                <th width="100">공간분류</th>
                <th width="100">공간</th>
                <th width="300">글제목</th>
                <th width="100">작성자</th>
                <th width="100">조회수</th>
                <th width="115">작성일</th>
            </tr>
		</thead>
		<tbody>
		<tbody>
        <%if(list.isEmpty()) { %>
            <!-- case1. 공지글이 없을 경우 -->
            <tr>
                <td colspan="8" style="pointer-events: none;">존재하는 문의사항이 없습니다.</td>
            </tr>
		<% } else{ %>
            <!-- case2. 공지글이 있을 경우 -->
            	<% for(QnA n : list) { %>
            <tr>
				<td><%= n.getQnaNo() %></td>
				<td><%= n.getQnaCategory() %></td>
                <td><%= n.getSpaceCategory() %></td>
                <td><%= n.getQnaSpaceNo() %></td>
				<td><%= n.getQnaTitle() %></td>
				<td><%= n.getQnaWriter() %></td>
				<td><%= n.getCount() %></td>
				<td><%= n.getQnaCreateDate() %></td>
            </tr>
            <% } %>
		<% } %>     
        </tbody>
    </table>

    <br>
    <div class="paging-area" align="center">    
		        
		<% if(currentPage != 1) { %>
           <button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage-1%>';">&lt;</button>
           <% } %>
		<% for(int p = startPage ; p <= endPage; p++) { %>
			
			<% if(p == currentPage) { %>
				<button class="btn btn-sm btn-outline-primary" disabled><%=p %></button>
			<% } else { %>
          			<button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/list.qa?cpage=<%=p%>';"><%= p %></button>
			<% } %>        
			 
		<% } %>
		<% if(currentPage != maxPage){ %>
           <button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage+1%>';">&gt;</button>
           <% } %>
        
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
    			location.href = '<%= contextPath%>/pwdcheck.qa?no=' + num;
    		})
    	})
    </script>
</body>
</html>
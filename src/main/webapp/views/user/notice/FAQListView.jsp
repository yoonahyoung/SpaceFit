<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.notice.model.vo.FAQ"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    .table{
        text-align: left;
    }
    th{
        font-size: 18px;
    }
    tbody>tr>th{
        height:85px;
        line-height:85px;
    }
    tbody>tr>td{
        display:none;
    }
    tbody p{
        padding:35px 0 25px 0;
    }
    .table>tbody>tr:hover{
   	background:#E1F0FF;
   	cursor:pointer;
    }
	h2{
		color: #0d6efd !important; 
	}
    #faqTr{
        padding-top:50px;
    }
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp" %>
	
	<div class="outer">
    <br>
    <h2 align="center">자주 묻는 질문</h2>
    <br><br><br>

    <table class="table" align="center">
        <thead>
            <tr>
                <th> 좀 더 편리하게 사용하시도록 도움 드릴게요</th>
            </tr>
		</thead>
		<tbody>
        <%if(list.isEmpty()) { %>
            <!-- case1. 글이 없을 경우 -->
            <tr>
                <td>존재하는 FAQ가 없습니다.</td>
            </tr>
        <% } else{ %>
            <!-- case2. 글이 있을 경우 -->
            	<% for(FAQ f : list) { %>
		            <tr>
		            	<th id="fTitle">Q. <%=f.getFaqTitle() %></th>
		            </tr>
		            <tr>
		            	<td id="fContent"><p><b>A. </b> <%=f.getFaqContent() %></p></td>
		            </tr>
	            <% } %>
			<% } %>     
        </tbody>
    </table>

    <br>
    
    <div style="height : 60px"></div>
 </div>
	
	
    <script>
        $(function(){
            $("th").click(function(){
                if($("td").css("display") == "none" ){
                     
                    // 보여지게끔
                    $("td").slideDown();

                    // 요 방식이 아코디언 형식
                }else{
                    // 사라지게끔
                    $("td").slideUp();
                }
            })
        })
    </script>
</body>
</html>
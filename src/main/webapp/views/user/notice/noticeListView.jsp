<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <tr>
				<td>10</td>
				<td>일반</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>9</td>
				<td>일반</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>8</td>
				<td>이벤트</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>7</td>
				<td>이벤트</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>6</td>
				<td>이벤트</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>5</td>
				<td>이벤트</td>
				<td>제목555</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            <tr>
				<td>4</td>
				<td>이벤트</td>
				<td>제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>   
			<tr>
				<td>3</td>
				<td>이벤트</td>
				<td>세번째제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            
            
			<tr>
				<td>2</td>
				<td>이벤트</td>
				<td>두번째제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>
            
			<tr>
				<td>1</td>
				<td>이벤트</td>
				<td>첫번째제목</td>
				<td>admin</td>
				<td>3</td>
				<td>2020.12.29</td>
            </tr>        
        </thead>
        
        <tbody>

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
</body>
</html>
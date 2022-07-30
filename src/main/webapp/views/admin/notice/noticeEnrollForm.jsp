<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.mem.model.vo.Member"%>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
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
    <h2 align="center">공지사항 등록</h2>
    <br><br><br>
    
	<form action="insert.no" id="enroll-form" method="post">
    <!-- 관리자 번호 같이 보내기 -->
    <input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
    <table class="table" id="detail-area">
        <tr>
            <th width="70">유형</th>
            <td width="70" align="left" style="padding: 12px 8px 0px 8px;">
                <input type="radio" name="category" id="nomal" checked value="일반"> <label for="normal">일반</label>
            </td>
            <td width="80" style="padding: 12px 8px 0px 8px;">
                <input type="radio" name="category" id="event" value="이벤트"><label for="event">이벤트</label>
            </td>
            <th width="70">제목</th>
            <td colspan="5" width="430">
                <input type="text" id="title" name="title" required>
            </td>

        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5">
                <textarea rows="10" name="content" style="resize: none;" required></textarea>
            </td>
        </tr>
    </table>

    <br>
		<div align="right">
	        <button class="btn btn-sm btn-primary">등록</button>
	        <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">취소</button>
	    </div>
    </form>
    <div style="height : 60px">
    </div>
    
 </div>
</body>
</html>
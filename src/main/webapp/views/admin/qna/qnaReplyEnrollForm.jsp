<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.QnA, com.spacefit.mem.model.vo.Member"%>
<%
	QnA q = (QnA)request.getAttribute("qna");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 등록</title>
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
    select, option{
        text-align: center;
        width: 100px;
    }
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">답변 등록</h2>
    <br><br><br>
<form action="replyInsert.qa" method="post" enctype="multipart/form-data">
    <!-- 회원번호 같이 보내기 -->
    <input type="hidden" name="refNo" value="<%=q.getQnaNo()%>">
    <input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
    <input type="hidden" name="spaceNo" value="<%=q.getQnaSpaceNo()%>">
    <input type="hidden" name="qnaCategory" value="<%=q.getQnaCategory()%>">
    <input type="hidden" name="password" value="<%=q.getQnaPwd()%>">
    <table class="table" id="detail-area">
        <tr>
            <th width="90">질문유형</th>
            <td width="80">
                <select name="" id="qnaCategory" disabled>
                    <option><%=q.getQnaCategory() %></option>
                </select>
            </td>
            <th width="90">공간분류</th>
            <td width="100">
                <select onclick="spaceList();" disabled>
                    <option value="<%= q.getSpaceCategory()%>"><%= q.getSpaceCategory()%></option>
                </select>
            <th width="70">공간</th>
            <td width="100">

                <!-- 기본선택 -->
                
                <select disabled>
                    <option value="<%= q.getQnaSpaceName()%>"><%= q.getQnaSpaceName()%></option>
                </select>

            </td>
        <tr>
            <th width="70">제목</th>
            <td width="350" colspan="5">
            <input type="text" name="replyTitle" id="title" value="ㄴ답변입니다." disabled>
            </td>
        </tr>
            
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="7">
                <textarea rows="10" name="replyContent" required style="resize: none;"></textarea>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="7" align="left"><input type="file" name="upfile"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td colspan="7" align="left">
                <input type="radio" name="public" id="pu" disabled><label for="pu">&nbsp;공개글</label>&nbsp;
                <input type="radio" name="public" id="sc" disabled><label for="sc">&nbsp;비밀글</label> &nbsp;
                <input type="password" name="password" id="pwd" disabled>
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
<script>
    // 공개글 기본값 -> 비밀번호 입력못하도록 설정
    if($("#pu").is(":checked")){
        
    }else{
        
    }

    <% if(q.getQnaPublic().equals("Y")) {%>
 		$("#pu").attr("checked", true);
        $("#pwd").attr("disabled", true);
 	<%} else {%>
 		$("#sc").attr("checked", true);
 		$("#pwd").attr("value",'<%=q.getQnaPwd()%>');
         $("#pwd").attr("disabled", true);
 	<%}%>

</script>
</html>
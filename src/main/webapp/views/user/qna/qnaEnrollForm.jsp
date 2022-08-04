<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.Category"%>
<%
	ArrayList<Category> partyList = (ArrayList<Category>)request.getAttribute("partyList");
	ArrayList<Category> practiceList = (ArrayList<Category>)request.getAttribute("practiceList");
	ArrayList<Category> studioList = (ArrayList<Category>)request.getAttribute("studioList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일문의 등록</title>
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
<%@ include file="../common/userMenubar.jsp" %>
 <div class="outer">
    <br>
    <h2 align="center">1 : 1 문의 등록</h2>
    <br><br><br>
<form action="insert.qa" method="post" enctype="multipart/form-data">
    <!-- 회원번호 같이 보내기 -->
    <input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
    <table class="table" id="detail-area">
        <tr>
            <th width="90">질문유형</th>
            <td width="80">
                <select name="category" id="qnaCategory">
                    <option value="선택" selected>--선택--</option>
                    <option value="공간">공간</option>
                    <option value="결제">결제</option>
                    <option value="예약">예약</option>
                    <option value="기타">기타</option>
                </select>
            </td>
            <th width="90">공간분류</th>
            <td width="100">
                <select name="spaceCategory" id="spaceCategory">
                    <option value="선택">--선택--</option>
                    <option value="studio" id="studio">스튜디오</option>
                    <option value="practice" id="practice">연습실</option>
                    <option value="party" id="party">파티룸</option>
                </select>
            <th width="70">공간</th>
            <td width="100" align="center">

                <div class="list" id="basic">
                    <select name="spaceNo" id="basic">
                        <option value="선택"selected>--선택--</option>
                    </select>
                </div>
    
                <div id="studioList" class="list" style="display: none;">
                    <select name="studioSpaceNo" id="studio">
                        <option value="선택"selected>--선택--</option>
                        <% for(Category c : studioList) { %>
                        <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                        <% } %>
                    </select>
                </div>
    
                <div id="practiceList" class="list" style="display: none;">
                    <select name="practiceSpaceNo" id="practice">
                        <option value="선택"selected>--선택--</option>
                        <% for(Category c : practiceList) { %>
                        <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                        <% } %>
                    </select>
                </div>
    
                <div id="partyList" class="list" style="display: none;">
                    <select name="partySpaceNo" id="party">
                        <option value="선택"selected>--선택--</option>
                        <% for(Category c : partyList) { %>
                        <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                        <% } %>
                    </select>
                </div>

            </td>
        <tr>
            <th width="70">제목</th>
            <td width="350" colspan="5">
            <input type="text" name="title" id="title">
            </td>
        </tr>
            
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="7">
                <textarea rows="10" name="content" required style="resize: none;"></textarea>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="7" align="left"><input type="file" name="upfile"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td colspan="7" align="left">
                <input type="radio" name="public" id="pu" checked onclick="publi();"><label for="pu">&nbsp;공개글</label>&nbsp;
                <input type="radio" name="public" id="sc" onclick="secret();"><label for="sc">&nbsp;비밀글</label> &nbsp;
                <input type="password" name="password" maxlength="8" placeholder="8자리 이내로 입력해주세요" id="pwd">
            </td>
        </tr>
    </table>

    <br>
	<div align="right">
		
        <button class="btn btn-sm btn-primary" onclick="return check();">등록</button>
        <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">취소</button>
    </div>
    </form>
    <div style="height : 60px">
    </div>
    
 </div>
<%@ include file="../common/userFooter.jsp" %>
</body>
<script>
    // 공개글 기본값 -> 비밀번호 입력못하도록 설정
    if($("#pu").is(":checked")){
        $("#pwd").attr("disabled", true);
    }else{
        $("#pwd").attr("disabled", false);
    }
    function publi(){
        $("#pwd").attr("disabled", true);
    }
    function secret(){
        $("#pwd").attr("disabled", false);
    }
    function check(){
        if($("#qnaCategory").val()=='선택'||$("#spaceCategory").val()=='선택'){
                alert("유형 및 공간을 선택하세요");
            return false;
        }
    }
    
    /*
    function select(){
        $(this).attr("selected", true);
    }
    */

        // 공간분류 선택시 선택된 공간분류의 공간만 선택할 수 있도록
        $("select[name=spaceCategory]").change(function(){
            let tag = document.getElementsByClassName("list");
            const basic = document.getElementById("basic");

            for(let i=0 ; i<tag.length ; i++){
                if($(this).val() == "선택"){
                    basic.style.display = "block";
                    basic.style.display = "inline";
                    tag[i].style.display = "none";
                }
                if($(this).val()+"List" == tag[i].id){
                    tag[i].style.display = "block";
                    tag[i].style.display = "inline";
                }else
                    tag[i].style.display = "none";
            }
        });
</script>
</html>
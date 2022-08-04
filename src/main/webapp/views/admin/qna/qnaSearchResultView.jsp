<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.qna.model.vo.QnA, com.spacefit.common.model.vo.PageInfo,com.spacefit.qna.model.vo.Category"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	
	ArrayList<Category> partyList = (ArrayList<Category>)request.getAttribute("partyList");
	ArrayList<Category> practiceList = (ArrayList<Category>)request.getAttribute("practiceList");
	ArrayList<Category> studioList = (ArrayList<Category>)request.getAttribute("studioList");
	ArrayList<Category> allList = (ArrayList<Category>)request.getAttribute("allList");
	
	for(QnA q : list) {
		if(q.getSpaceCategory().equals("practice")) {
			q.setSpaceCategory("연습실");
		} else if(q.getSpaceCategory().equals("studio")) {
			q.setSpaceCategory("스튜디오");
		}else if(q.getSpaceCategory().equals("party")) {
			q.setSpaceCategory("파티룸");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
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
    th, span{
        font-size: 18px;
    }
    .table>tbody>tr:hover{
   	background:#E1F0FF;
   	cursor:pointer;
    }
	h2{
		color: #0d6efd !important; 
	}
    select{
        text-align: center;
        width: 100px;
        height:31px;
    }
    .list{
        display: inline;
    }

    #search-area{
        border: 3px solid #0d6efd;
        border-radius: 15px;
        width: 100%;
        box-sizing: border-box;
    }
    
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="outerRv">
    <br>
    <h2 align="center">일대일 문의</h2>
    <br><br><br>
    <form action="<%=contextPath%>/search.qa?cpage=1" method="post">
        <div align="center" id="search-area">
            <br>
            <span>질문유형</span>
            <select name="qnaCategory" id="qnaCategory">
                <option value="전체" selected>--전체--</option>
                <option value="공간">공간</option>
                <option value="결제">결제</option>
                <option value="예약">예약</option>
                <option value="기타">기타</option>
            </select>
            <span>공간분류</span>
            <select name="spaceCategory" id="spaceCategory">
                <option value="전체">--전체--</option>
                <option value="studio" id="studio">스튜디오</option>
                <option value="practice" id="practice">연습실</option>
                <option value="party" id="party">파티룸</option>
            </select>
            <span>공간</span>
            
            <div class="list" id="allList">
                <select name="spaceNo" id="basic">
                    <option value="전체">--전체--</option>
                    <% for(Category c : allList) { %>
                    <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                    <% } %>
                </select>
            </div>

            <div id="studioList" class="list" style="display: none;">
                <select name="studioSpaceNo" id="studio">
                    <option value="전체">--전체--</option>
                    <% for(Category c : studioList) { %>
                    <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                    <% } %>
                </select>
            </div>

            <div id="practiceList" class="list" style="display: none;">
                <select name="practiceSpaceNo" id="practice">
                    <option value="전체">--전체--</option>
                    <% for(Category c : practiceList) { %>
                    <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                    <% } %>
                </select>
            </div>

            <div id="partyList" class="list" style="display: none;">
                <select name="partySpaceNo" id="party">
                    <option value="전체">--전체--</option>
                    <% for(Category c : partyList) { %>
                    <option value="<%=c.getSpaceNo()%>"><%= c.getSpaceName() %></option>
                    <% } %>
                </select>
            </div>
            
            <span>답변여부</span>
            <select name="isSolved">
                <option value="전체">--전체--</option>
                <option value="대기">답변대기</option>
                <option value="완료">답변완료</option>
            </select>&nbsp;&nbsp;
            <button class="btn btn-sm btn-primary">검색</button>
            <br><br>
        </div>
    </form>
    <br><br>
    <div align="center">
        <h4>
        <% if(keyword != null){%>
            <%=keyword%>
        <%}%>
        </h4>
    </div>

    <br><br><br>
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
                <td colspan="8">존재하는 문의사항이 없습니다.</td>
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
    <div style="height : 60px"></div>
 </div>
     <script>
    	$(function(){
    		$(".table>tbody>tr").click(function(){
    			const num = $(this).children().eq(0).text(); // 클릭했을때의 글번호
    			
    			// 요청할url?키=밸류&키=밸류...
    			// 요청시전달값(키=밸류) => 쿼리스트링
				
    			// /web/detail.no?no=xx
    			location.href = '<%= contextPath%>/adminDetail.qa?no=' + num;
    		})
    	})

        // 공간분류 선택시 선택된 공간분류의 공간만 선택할 수 있도록
        $("select[name=spaceCategory]").change(function(){
            let tag = document.getElementsByClassName("list");
            const allList = document.getElementById("allList");

            for(let i=0 ; i<tag.length ; i++){
                if($(this).val() == "전체"){
                    allList.style.display = "block";
                    allList.style.display = "inline";
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

</body>
</html>
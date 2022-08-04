<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.event.model.vo.Banner"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 관리</title>
<style>

	.wrapBannerManage{ 
		color:black;
		width:1500px;
	}
	.ban-card-title{
		font-weight:600;
	}
	
	.card-body>*{
		float:left;
	}
	
	.ban-card{
		width:350px;
		box-shadow: 2px 2px 20px 0px #E7F1FF;
	}
	
	.ban-card-margin{
		margin-bottom:30px;
	}
</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<%
	 	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");
	%>
	
	<br><br>
	<h2 align="center" style="color:black;">배너 관리</h2>
	<br><br><br>
	    
	<div class="wrapBannerManage">
		
		<div class="btnWrap float-right" style="padding-right:10px;">
	        <button type="button" class="btn btn-danger">삭제하기</button>
	        <button type="button" class="btn btn-secondary" onclick="bannerUpdateDetailView();">수정하기</button>
	        <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/adBannerInsertView.ev'">등록하기</button>
	    </div>
	    <br><br><br>
	    
        <div class="row">
        	
        	<% if(list.isEmpty()) { %>
        		<p align="center">조회 가능한 배너가 없습니다.</p>
        	 <% }else { %>
        	 
        	 	<% for(Banner b : list) { %>
		            <div class="col-md-6 col-lg-3 ban-card-margin" id="ban-card">
		                <div class="card ban-card">
		                    <img class="img-fluid" src="<%= b.getBanImg() %>" alt="">
		                    <div class="card-body">
		                        <h5 class="ban-card-title"><%= b.getBanName() %></h5><br><br>
		                        <span class="card-text"><b>배너번호 : </b></span>
		                        <span id="banNo">&nbsp;<%= b.getBanNo() %></span><br>
		                        <span class="card-text"><b>등록일 : </b></span>
		                        <span>&nbsp;<%= b.getBanEnrollDate() %></span><br>
		                        <span class="card-text"><b>수정일 : </b></span>
		                        <span>&nbsp;<%= b.getBanModifyDate() %></span><br>
		                        <span class="card-text"><b>등록URL : </b></span>
		                        <span>&nbsp;<%= b.getBanURL() %></span>
		                    </div>
		                    <div class="card-footer" style="background:white;">
		                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
		                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;<%= ( b.getBanStatus().equals("N") ) ? "보류중" : "게시중" %></b></small></span>
		                    </div>
		                </div>
		                <br>
		                <input type="checkbox" id="ban-check">
		            </div>
		        <% } %>
		        
	        <% } %>
            <script>
            	
            </script>
            
           
        </div>
        
        
    </div>
    
    <script>
    	
    	$("#ban-card").click(function(){
			
    		location.href = "<%=contextPath%>/adBannerDetail.ev?no=" + $(this).find('#banNo').text();
			
		});
		

			
			
			
		
			
			
		
   		
    	
    </script>
    
    <br><br><br><br><br><br>

</body>
</html>
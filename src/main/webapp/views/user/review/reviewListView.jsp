<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.review.model.vo.Review, com.spacefit.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기관리내역</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/review.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha512-0S+nbAYis87iX26mmj/+fWt1MmaKCv80H+Mbo+Ne7ES4I6rxswpfnC6PxmLiw33Ywj2ghbtTw0FkLbMWqh4F7Q==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<style>
	#rvEnd{
		padding-left: 45%;
	}
</style>
</head>
<body>
    <%@ include file="../common/userMenubar.jsp"%>    
      
    <div class="container rvlv2">

        <!-- 정렬 -->
        <div class="rvlv2-header" align="center"><h3>후기관리</h3></div>
                
        <div class="rvlv2-menu">            
        </div>


        <div class="rvlv2-main" align="center">
        
        	<% if(list.isEmpty()){ %>
	            <!-- 후기내역없을때 -->
	            <div align="center" style="margin-top: 200px; width:800px; height:700px"> 조회된결과가 없습니다.</div> 
	        <%} else{ %>    
            	<!-- 후기내역있을때 --> 
            	<% for(Review rv : list) { %>        
		            <div class="card mb-3" style="max-width: 800px;">
		                <div class="row g-0" align="start">
		                    <div class="col-md-4">		                         
		                        <img src="<%=contextPath%>/<%= rv.getMainImgUrl() %>" class="rounded-start" style="width: 250px; height:200px">
		                    </div>
		                    <div class="col-md-6">
		                        <div class="card-body vertical-center-rv2">
		                            <span id="rvlv2-status"><b><%= rv.getSpaceNo() %></b></span> &nbsp;&nbsp;&nbsp;&nbsp;
		                            <span><small><%= rv.getBookDate() %></small></span>
		                            <br>                            
		                            <div class="card-title">
		                           		 <!--별점이 올 자리-->
		                           		 <% for(int i=0; i<5; i++) {%>		                           		 	
		                           		 		<%if(i < rv.getReviewStar()) {%>
                                        			<span id='starYellow'>★</span> 
                                        		<% } else{ %>	                                   		
                                        			<span id='starWhite'>★</span>
                                    			<% } %>
		                           		 <% } %>
		                            
		                            </div>
		                            
		                            <div class="card-text ellipsisRv"><small><%= rv.getReviewContent() %></small></div>                            
		                        </div>
		                    </div>
		                    <div class="col-md-2 end-center-rv2">
		                        <a href='<%=contextPath %>/rdetail.rv?no=<%=rv.getReviewNo() %>' id="rvEnd">
				        			<span class='material-symbols-outlined text-primary'>
				        				arrow_forward_ios
				        			</span>
				        		</a>
		                    </div>
		                </div>
		            </div>
		        <%} %>    
			          
                
               
        <div class="rvlv2-footer" align="center">  
            
            <!-- 페이징바 영역 -->         
            <div class="paging-area" align="center">    
        		
        		
	        	<%if(currentPage != 1){ %>  <!--시용자가보게될페이지가 1이아니면 저 이전페이지로가는버튼이보이게 -->
	           	 	<button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/rlist.rv?cpage=<%= currentPage -1 %>';">&lt;</button>
				<% } %>
        	
                 <% for(int p=startPage; p<=endPage; p++) { %>
				   
				   		<% if(p == currentPage) { %> <%-- 사용자가 현재 보고있는 페이지의 버튼은 비활성화 --%>
				   			<button class="btn btn-sm btn-outline-primary" disabled><%= p %></button>
				   		<%} else {%>
		           			<button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/rlist.rv?cpage=<%= p %>';"><%= p %></button>
		           		<%} %>
		         <% } %>    
		         
		         <% if(currentPage != maxPage) {%>
	            	<button class="btn btn-sm btn-outline-primary" onclick="location.href='<%=contextPath%>/rlist.rv?cpage=<%= currentPage+1 %>'">&gt;</button>
	            <% } %>
                                
            </div>
        </div>
        
    	<%} %> 
           
     </div>
     
         
     
  </div>   
  
  <%@ include file="../common/userFooter.jsp" %>
</body>
</html>
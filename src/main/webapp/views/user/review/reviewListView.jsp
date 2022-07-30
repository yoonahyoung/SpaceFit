<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.review.model.vo.Review"%>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
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
		                            <span id="rvlv2-status"><b><%= rv.getSpaceName() %></b></span> &nbsp;&nbsp;&nbsp;&nbsp;
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
                        
            <div class="paging-area" align="center">    
        
                <button class="btn btn-sm btn-outline-primary">&lt;</button>        
                <button disabled class="btn btn-sm btn-outline-primary">1</button>        
                <button class="btn btn-sm btn-outline-primary">2</button> 
                <button class="btn btn-sm btn-outline-primary">3</button>          
                <button class="btn btn-sm btn-outline-primary">&gt;</button>
                
            </div>
        </div>
        
    	<%} %> 
    
    

    <!-- 후기삭제 Modal -->
    <!--  
    <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="deleteBkModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">                            
           </div>           
           <div class="modal-body" align="center">
           	  <form action="  " method=post>  
	              <h4>해당 후기를 삭제하시겠습니까?</h4>
	                 <br>
	                 <div>
	                    <button type="submit" class="btn btn-sm btn-primary" style="width: 60px;">네</button>
	                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" style="width: 60px;">아니오</button>
	                 </div>                       
              </form> 
           </div>
           <div class="modal-footer">
           </div>
        </div>
        </div>
        -->
     </div>
     
     
  </div>   
</body>
</html>
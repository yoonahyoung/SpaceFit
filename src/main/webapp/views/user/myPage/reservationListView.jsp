<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.common.model.vo.PageInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/book.css">
<!-- 구글아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
    .end-center-rv1{         
    position:absolute; top:50%; transform:translateY(-50%) translateX(550%);          
	}

	#bookListArea{min-height: 800px; }
</style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp" %>

    <div class="container rvlv1">

        <!-- 정렬 -->
        <div class="rvlv1-header" align="center"><h3>예약내역리스트</h3></div>
       
        <div class="rvlv1-menu">
            <select name="booktype" id="booktype" onchange="selectBookList(1);">
                <option>전체</option>
                <option>예약확정</option>
                <option>이용완료</option>
                <option>예약취소</option>
            </select>
            <select name="bookOrderBy" id="bookOrderBy" onchange="selectBookList(1);">
                <option value="book_date">대여날짜순</option>
                <option value="book_no">예약번호순</option>
            </select>                   
            
        </div>

        <div class="rvlv1-main" id="bookListArea" align="center">
                                      
			<!-- 예약내역정보가 올 자리 -->
			
        </div>

               
        <div class="rvlv1-footer" align="center">  
           <!-- 페이징 자리--> 
        </div>
        
                
        <script>
        	$(function(){
        		
        		selectBookList(1);     
        		//setInterval(selectBookList, 1200);        		
        	})	
        	
        	function selectBookList(page){
        		
        		$.ajax({
        			url: "<%= contextPath %>/blist.bo",
        			data:{
        				   	booktype: $("#booktype").val(),
        				    bookOrderBy: $("#bookOrderBy").val(),
        				    cpage:page        				    
        			},
        			type:"post",
        			success:function(result){
        				
        				console.log(result);
        				
        				let contextPath = "<%= contextPath %>";
        				
        				let bookColor = "";        				
        				let value ="";   
        				let pageValue = "";
        				        				
        				let list = result.list; // [{}, {}, {}, ...]
        				let pi = result.pi; // { }
        				
        				if(list.length == 0){
        					value += "<div align='center' style='margin-top: 200px'> 조회된결과가 없습니다.</div>";
        				}else{
        					
	        				for(let i=0; i<list.length; i++){
	        					
	        					switch(list[i].bookCategory){
	        						case '예약확정' : bookColor = "#fcbbf1"; break;
	        						case '이용완료' : bookColor = "#e1ee32"; break;
	        						case '예약취소' :	bookColor = "#E7F1FF"; break;
	        					}
	        					
	        					
		        				value += "<div class='card mb-3 bookcard' style='max-width: 800px;'>"
				        				+   "<div class='row g-0' align='start'>"
				        				+      	"<div class='col-md-4'>"
				        				+         	"<img src='"+ contextPath + "/" + list[i].spacePicture + "' class='rounded-start' style='width: 260px; height:200px'>"
				        				+      	"</div>"
				        				+    	"<div class='col-md-6'>"
				        				+    		 "<div class='card-body vertical-center-rv1'>"
				        				+        	 	"<span id='rvlv1-status' class='rounded-pill' style='background:"+ bookColor  +"'><small>" + list[i].bookCategory + "</small></span>"
				        				+        	 	"<br><br>"
				        				+        		"<h5 class='card-title'>" + list[i].spaceNo + "</h5>"
				        				+        		"<p class='card-text'>"+ list[i].bookDate + "  &nbsp;&nbsp;" +list[i].bookInTime + ":00 ~ " + list[i].bookOutTime + ":00 </p>"
				        				+        		"<p class='card-text'><small class='text-muted'>" + list[i].bookPrice + "원" + "</small></p>"
				        				+     	 	"</div>"
				        				+     	"</div>"
				        				+     	"<div class='col-md-2 end-center-rv1'>"
				        				+       	  "<a href='"+ contextPath + "/bdetail.bo?no=" + list[i].bookNo + "'>"
				        				+         	    "<span class='material-symbols-outlined text-primary'>"
				        				+        	         "arrow_forward_ios"
				        				+        	     "</span>"
				        				+        	 "</a>"
				        				+     	"</div>"
				        				+ 	"</div>"
				        				+"</div>"	
		        				
		        				//console.log(list[i].spacePicture);				        				
	        				}
	        					        					        				
	        				if(pi.currentPage != 1){
	                			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectBookList(" + (pi.currentPage - 1) + ")'>&lt;</button>"	
	                		}
	                		
	                		for(let p=pi.startPage; p<=pi.endPage; p++) { 
	        				   
	        		   			if(p == pi.currentPage) { 
	        				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
	        				   	}else {
	        				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectBookList(" + p +")'>" + p + "</button>"
	        		           	} 
	        		         }     
	                 
	        		         if(pi.currentPage != pi.maxPage) {
	        		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectBookList(" + (pi.currentPage + 1) + ")'>&gt;</button>"
	        		         } 
	        		          
	        				
        				}
        				
	        			$("#bookListArea").html(value);
           		        $(".rvlv1-footer").html(pageValue);	
							  				
        			},
        			
        			error:function(){
        				
        				console.log("예약내역리스트 조회용 ajax통신 실패");
        				
        			}
        			
        		});
        		
        	}
        	
        
        	
        
        	
        
        </script>
        
        
    </div>
    
    <%@ include file="../common/userFooter.jsp" %>
</body>
</html>
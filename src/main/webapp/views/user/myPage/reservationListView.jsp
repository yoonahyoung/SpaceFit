<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp" %>

    <div class="container rvlv1">

        <!-- 정렬 -->
        <div class="rvlv1-header" align="center"><h3>예약내역리스트</h3></div>
       
        <div class="rvlv1-menu">
            <select name="booktype" id="booktype">
                <option>전체</option>
                <option>예약확정</option>
                <option>이용완료</option>
                <option>예약취소</option>
            </select>
            <select name="bookOrderBy" id="bookOrderBy">
                <option value="book_date">대여날짜순</option>
                <option value="book_no">예약번호순</option>
            </select>                   
            
        </div>

        <div class="rvlv1-main" id="bookListArea" align="center">
            <!-- 예약현황없을때 -->
            <!-- <div align="center" style="margin-top: 200px"> 조회된결과가 없습니다.</div> -->
            
            <!-- 예약현황있을때 -->             
              
            <!-- <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                        <img src="request.getContextPath() /resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 260px; height:200px">
                    </div>
                    <div class="col-md-6">
                    <div class="card-body vertical-center-rv1">
                        <span id="rvlv1-status" class="rounded-pill" style="background:#f196e2"><small>예약확정</small></span>
                        <br><br>
                        <h5 class="card-title">파티룸A</h5>
                        <p class="card-text">2022.05.10 10:00~19:00</p>
                        <p class="card-text"><small class="text-muted">10000원</small></p>
                    </div>
                    </div>
                    <div class="col-md-2 end-center-rv1">
                        <a href="">
                            <span class="material-symbols-outlined text-primary">
                                arrow_forward_ios
                            </span>
                        </a>
                    </div>
                </div>
            </div> -->
                               

        </div>

               
        <div class="rvlv1-footer" align="center">  
                        
            <div class="paging-area" align="center">    
        
                <button class="btn btn-sm btn-outline-primary">&lt;</button>        
                <button disabled class="btn btn-sm btn-outline-primary">1</button>        
                <button class="btn btn-sm btn-outline-primary">2</button> 
                <button class="btn btn-sm btn-outline-primary">3</button>  
                <button class="btn btn-sm btn-outline-primary">4</button>     
                <button class="btn btn-sm btn-outline-primary">5</button>             
                <button class="btn btn-sm btn-outline-primary">&gt;</button>
                
            </div>
        </div>
        
                
        <script>
        	$(function(){
        		
        		selectBookList();        		      		
        		
        	})	
        	
        	function selectBookList(){
        		
        		$.ajax({
        			url: "<%= contextPath %>/blist.bo",
        			data:{
        				   	booktype: $("#booktype").val(),
        				    bookOrderBy: $("#bookOrderBy").val()        				
        			},
        			type:"post",
        			success:function(list){
        				
        				
        				let value ="";       				
        				if(list.length == 0){
        					value += "<div align='center' style='margin-top: 200px'> 조회된결과가 없습니다.</div>";
        				}else{
	        				for(let i=0; i<list.length; i++){
		        				value += "<div class='card mb-3' style='max-width: 800px;'>"
		        				+   "<div class='row g-0' align='start'>"
		        				+      	"<div class='col-md-4'>"
		        				+         	"<img src='/SpaceFit/"+ list[i].spacePicture + "' class='rounded-start' style='width: 260px; height:200px'>"
		        				+      	"</div>"
		        				+    	"<div class='col-md-6'>"
		        				+    		 "<div class='card-body vertical-center-rv1'>"
		        				+        	 	"<span id='rvlv1-status' class='rounded-pill' style='background:#f196e2'><small>" + list[i].bookCategory + "</small></span>"
		        				+        	 	"<br><br>"
		        				+        		"<h5 class='card-title'>" + list[i].spaceNo + "</h5>"
		        				+        		"<p class='card-text'>"+ list[i].bookDate + " " + list[i].bookInTime + "~" + list[i].bookOutTime + "</p>"
		        				+        		"<p class='card-text'><small class='text-muted'>" + list[i].bookPrice + "원" + "</small></p>"
		        				+     	 	"</div>"
		        				+     	"</div>"
		        				+     	"<div class='col-md-2 end-center-rv1'>"
		        				+       	  "<a href=''>"
		        				+         	    "<span class='material-symbols-outlined text-primary'>"
		        				+        	         "arrow_forward_ios"
		        				+        	     "</span>"
		        				+        	 "</a>"
		        				+     	"</div>"
		        				+ 	"</div>"
		        				+"</div>"	
		        				
		        				console.log(list[i].spacePicture);
	        				}
	        				
	        				$("#bookListArea").html(value);
        				}

        				
        				
        				
        			},
        			
        			error:function(){
        				
        				console.log("예약내역리스트 조회용 ajax통신 실패");
        				
        			}
        			
        		});
        		
        	}
        
        
        </script>
        
        
    </div>
</body>
</html>
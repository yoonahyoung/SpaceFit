<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.reservation.model.vo.Book"%>
<% 
 	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
	#dataTable>tbody>tr:hover{
		cursor:pointer;
	}
</style>
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>
    
    <div class="container-fluid">
        <br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">예약내역리스트</h1>
           <br><br><br>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                  <div class="col-lg" align="left">
                  
                        <table class="pull-right">
                            <tr>
                                <td><select class="form-control mr-sm-0" name="searchType" id="searchType" style="height: 35px;">                                        
                                        <option value="spaceNo">공간명</option>
                                        <option value="userID">회원아이디</option>
                                        <option value="userName">예약자명</option>
                                </select></td>
                                <td><input type="text" class="form-control" placeholder="검색어 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;"></td>
                                <td><button type="button" id="searchBtn" class="btn btn-sm btn-primary" onclick="selectAdminBookList(1);">검색</button></td>
                            </tr>        
                        </table>                       
                          
                  </div>
                  <div class="col-lg" align="right"> 
                  	    <select  name="booktype" id="booktype" onchange="selectAdminBookList(1);">
			                <option selected>전체</option>
			                <option>예약확정</option>
			                <option>이용완료</option>
			                <option>예약취소</option>
			            </select>
			            <select name="bookOrderBy" id="bookOrderBy" onchange="selectAdminBookList(1);">
			                <option value="book_date">대여날짜순</option>
			                <option value="book_no" selected>예약번호순</option>
			            </select>       
                  </div>
                </div>
                <div class="card-body">
                   	 <div class="table-responsive">
	                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>번호</th>
	                                    <th>공간명</th>
	                                    <th>대여날짜</th>
	                                    <th>체크인시간</th>
	                                    <th>체크아웃시간</th>
	                                    <th>인원</th>    
	                                    <th>가격</th>
	                                    <th>회원아이디</th>
	                                    <th>예약자명</th>
	                                    <th>예약자이메일</th>
	                                    <th>예약자연락처</th> 
	                                    <th>주차</th>     
	                                    <th>동물</th>
	                                    <th>의자</th>
	                                    <th>보면대</th>                  
	                                </tr>
	                            </thead>
	                            
	                           <tbody id="listArea">
	                           	                           		                             
	                           </tbody>
	                           
	                        </table>                      
                   	   </div>
                   	   
                   	   <div class="paging-area" align="center"></div>
                   	   
                 </div>
	                   
                 <div style="height : 60px"></div>
             </div>
            
         </div>

     </div>  

        <!-- /.container-fluid -->
     <br><br>        	
        
      <script>
      	$(function(){
      		
      		selectAdminBookList(1);
      		//setInterval(selectAdminBookList, 1200);
      		
      		selectDetailBook();
		        
		})
      	
      	function selectAdminBookList(page){
      		
      		$.ajax({        			
      			url: "<%= contextPath %>/ablist.bo",
      			data:{
  				    searchType:$("#searchType").val(),
  				    searchText:$("#searchText").val(),
      				booktype: $("#booktype").val(),
  				    bookOrderBy: $("#bookOrderBy").val(),
  				  	cpage:page 
      			},
      			type:"post",
      			success:function(result){
      				let contextPath = "<%= contextPath %>"
      				let value = "";
      				let pageValue = "";
      				
      				let list = result.list; // [{}, {}, {}, ...]
    				let pi = result.pi; // { }
      				
      				if(list.length == 0){
      					value += "<tr>"
      					       + "<td colspan='15'> 예약내역이 없습니다. </td>"
                                 + "</tr>";
      				}else{
      					
      					for(let i=0; i<list.length; i++){
      						
       					value += "<tr>"
                               +  	"<td>" +  list[i].bookNo + "</td>"
                               +   	"<td>" +  list[i].spaceNo + "</td>"
                               +    "<td>" +  list[i].bookDate + "</td>"
                               +    "<td>" +  list[i].bookInTime + "</td>"
                               +    "<td>" +  list[i].bookOutTime + "</td>"
                               +    "<td>" +  list[i].bookCount + "</td>"
                               +    "<td>" +  list[i].bookPrice + "</td>"
                               +    "<td>" +  list[i].memberNo + "</td>"
                               +    "<td>" +  list[i].bookName + "</td>"
                               +    "<td>" +  list[i].bookEmail + "</td>"
                               +    "<td>" +  list[i].bookPhone + "</td>"
                               +    "<td>" +  list[i].bookCar + "</td>"
                               +    "<td>" +  list[i].bookAnimal + "</td>"
                               +    "<td>" +  list[i].bookChair + "</td>"
                               +    "<td>" +  list[i].bookStand + "</td>"
                               + "</tr>";
                             
      					}
      					
      					if(pi.currentPage != 1){
                			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAdminBookList(" + (pi.currentPage - 1) + ")'>&lt;</button>"	
                		}
                		
                		for(let p=pi.startPage; p<=pi.endPage; p++) { 
        				   
        		   			if(p == pi.currentPage) { 
        				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
        				   	}else {
        				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAdminBookList(" + p +")'>" + p + "</button>"
        		           	} 
        		         }     
                 
        		         if(pi.currentPage != pi.maxPage) {
        		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectAdminBookList(" + (pi.currentPage + 1) + ")'>&gt;</button>"
        		         } 
      				}
      				

      				$("#listArea").html(value);
      				$(".paging-area").html(pageValue);
      				
      				
      			},
      			error:function(){
      				console.log("관리자 예약내역리스트 조회용 ajax통신 실패");
      			}
      			
      		});
      		
      	}
      	
      	function selectDetailBook(){
      		
      		$("#dataTable").on("click", "tr", function(){
      			location.href = "<%= contextPath %>/abdetail.bo?no=" + $(this).children().eq(0).text();
      		})
		
      	}
      
      </script>	
  
    	<div style="height : 100px"></div>


	</body>
</html>
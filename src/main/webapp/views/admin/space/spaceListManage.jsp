<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.product.model.vo.Space, com.spacefit.common.model.vo.PageInfo"%>   
<%
	ArrayList<Space> list = (ArrayList<Space>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>공간리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
<style>

</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
        
    <div class="container-fluid">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">공간 정보 조회</h1>
        <br><br><br>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-lg" align="right">
                        <div>
                            <div align="center" style="display:inline-block">
                                <div class="input-group" align="center" style="width:400px">
                                    <input type="text" class="form-control bg-light border-1 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>

                            </div>
                            <div align="right" style="width:400px; display:inline-block">
                                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                    <select name="selectSp" class="selectBox" onchange="selectPaging(1);">
	                                    <option value="*" selected>전체</option>
	                                    <option value="studio">스튜디오</option>
	                                    <option value="practice">연습실</option>
	                                    <option value="party">파티룸</option>
                                    </select>
                                </form>
                            </div>
                            <div style="width:100px; display:inline-block">
                                <a type="button" class="btn btn-secondary" href="<%=contextPath%>/adEnroll.sp">공간추가</a>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered spaceListTable" id="dataTable" width="80%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th width="100px">번호</th>
                                        <th width="400px">공간명</th>
                                        <th width="100px">분류</th>
                                        <th width="100px">게시일</th>
                                    </tr>
                                </thead>
                                <tbody id="areaList">
                                	 <%for(Space s : list){ %>
                                    <tr id="trId">
                                        <td><%= s.getSpaceNo() %></td>
                                        <td><%= s.getSpaceName() %></td>
                                        <td>
                                        	<%if(s.getSpaceCategory().equals("studio")){ %>
												스튜디오                                        
                                        	<%}else if(s.getSpaceCategory().equals("practice")){ %>
                                        		연습실
                                        	<%}else if(s.getSpaceCategory().equals("party")){ %>
                                        		파티룸
                                        	<%} %>
                                        </td>
                                        <td><%= s.getSpaceEnDate() %></td>
                                    </tr>
                                    <%} %> 
                                    <tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging-area" align="center">    
		        
                            <% if(currentPage != 1){ %> <!-- 1번 페이지가 아닐 시에 이전페이지 버튼이 생기도록 -->
				            <button onclick="location.href='<%=contextPath%>/adList.sp?cpage=<%=currentPage-1%>';" class="btn btn-sm btn-outline-primary">&lt;</button>
							<%} %>
							
							<% for(int p=startPage; p<=endPage; p++){ %>
							
								<% if(p == currentPage){ %>
									<button disabled class="btn btn-sm btn-outline-primary"><%= p %></button> <!-- 현재 페이지의 버튼은 비활성화 -->
								<% }else{ %>
				            		<button onclick="location.href='<%=contextPath%>/adList.sp?cpage=<%=p%>';"  class="btn btn-sm btn-outline-primary"><%= p %></button>
				            	<% } %>
							<%} %>
							
							<% if(currentPage != maxPage){ %> <!-- 마지막 페이지가 아닐 시에 다음페이지 버튼이 생기도록 -->
				            <button onclick="location.href='<%=contextPath%>/adList.sp?cpage=<%=currentPage+1%>';" class="btn btn-sm btn-outline-primary">&gt;</button>
				            <%} %>
                            
                        </div>
                    </div>
                </div>

                </div>
				<br><br>
				
				 <script>
		        	$(function(){
		        		selectPaging(1);
		        		
		        		$("#areaList").on("click", "tr", function(){
		        			location.href="<%=contextPath%>/adDetail.sp?no=" + $(this).children().eq(0).text();
		        		})
		        		
		        	})
		        		
		        	
		        	function selectPaging(page){
		        		$.ajax({
		        			url:"<%=contextPath%>/ajaxList.sp",
		        			data:{selectSp:$("select[name=selectSp] option:selected").val(),
		        				  cpage:page},
		        			success:function(h){
		        				let contextPath = "<%=contextPath%>";
		        				let pi = h.pi;
		        				let list = h.list;
		        				let el = ""; // 공간 뿌려주는 변수
		        				let pageVal = ""; // paging처리해주는 변수
		        				if(list.length == 0){
		          					el += "<tr>"
		          					       + "<td colspan='4'> 공간이 없습니다. </td>"
		                                     + "</tr>";
		          				}else{
		          					for(let i=0; i<list.length; i++){
		          						switch(list[i].spaceCategory){
		          						case"studio": list[i].spaceCategory = "스튜디오"; break;
		          						case"practice": list[i].spaceCategory = "연습실"; break;
		          						case"party": list[i].spaceCategory = "파티룸"; break;
		          						}
	                        			el +=	"<tr>"
			                                  + 	"<td>"+ list[i].spaceNo +"</td>"
			                                  + 	"<td>"+ list[i].spaceName +"</td>"
			                                  + 	"<td>"+ list[i].spaceCategory +"</td>"
			                                  + 	"<td>"+ list[i].spaceEnDate +"</td>"
			                                  + "</tr>";
		                                 
		        					}
		          					
		          					if(pi.currentPage != 1){ 
		          						pageVal += "<button class='btn btn-sm btn-outline-primary' onclick='selectPaging(" + (pi.currentPage-1) + ");'>&lt;</button>";
		          						
									}
									
									for(let p=pi.startPage; p<=pi.endPage; p++){
										if(p == pi.currentPage){
											pageVal += "<button disabled class='btn btn-sm btn-outline-primary'>" +  p  + "</button>";
											
										}else{ 
											 pageVal += "<button class='btn btn-sm btn-outline-primary' onclick='selectPaging("+ p +")';>"  + p + "</button>";
											
						            	} 
									} 
									
									 if(pi.currentPage != pi.maxPage){ 
									 pageVal += "<button class='btn btn-sm btn-outline-primary' onclick='selectPaging(" + (pi.currentPage+1) + ");'>&gt;</button>";
									 
						            } 
		                             
		          				}
                                	$("#areaList").html(el);
		        				 	$(".paging-area").html(pageVal); 
		        			}
			        		
		        		})
			        }
        		</script>
        
            </div>
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.product.model.vo.Space"%>   
<%
	ArrayList<Space> list = (ArrayList<Space>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>공간리스트</title>
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
                                    <select>
                                    <option selected id="all">전체</option>
                                    <option id="stdio">스튜디오</option>
                                    <option id="practice">연습실</option>
                                    <option id="party">파티룸</option>
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
                                <tbody>
                                	<%for(Space s : list){ %>
                                    <tr>
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
		        
                            <button class="btn btn-sm btn-outline-primary">&lt;</button>        
                            <button disabled class="btn btn-sm btn-outline-primary">1</button>        
                            <button class="btn btn-sm btn-outline-primary">2</button> 
                            <button class="btn btn-sm btn-outline-primary">3</button>    
                            <button class="btn btn-sm btn-outline-primary">4</button> 
                            <button class="btn btn-sm btn-outline-primary">5</button>       
                            <button class="btn btn-sm btn-outline-primary">&gt;</button>
                            
                        </div>
                    </div>
                </div>

                </div>
                <!-- /.container-fluid -->
				<br><br>
				
				 <script>
		        	$(function(){
		        		$(".spaceListTable>tbody>tr").click(function(){
		        			location.href="<%=contextPath%>/adDetail.sp?no=" + $(this).children().eq(0).text();
		        		})
		        	})
		        	
		        	$(function(){
		        		$("#studio").selected(function(){
		        			$("studio")
		        			$("#practice").attr(display, "none");
		        			$("#party").attr(display, "none");
		        		})
		        	})
        		</script>
        
            </div>
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="com.spacefit.common.model.vo.PageInfo, java.util.ArrayList, com.spacefit.notice.model.vo.FAQ" %>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
	
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
<title>faq리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/spaceManage.css">
<style>

</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
        
    <div class="container-fluid">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">FAQ관리</h1>
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
                            <div style="width:100px; display:inline-block">
                                <a type="button" class="btn btn-secondary" href="<%=contextPath%>/adEnroll.fa">글작성</a>
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
                                        <th width="400px">제목</th>
                                        <th width="100px">작성자</th>
                                        <th width="100px">게시일</th>
                                        <th width="100px">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%if(list.isEmpty()){ %>
                                		<td colspan="5"> 등록된 게시글이 없습니다.</td>
                                	<%}else{ %>
		                            	<%for(FAQ f : list){ %>
		                                    <tr>
		                                        <td><%= f.getFaqNo() %></td>
		                                        <td><%= f.getFaqTitle() %></td>
		                                        <td><%= f.getFaqWriter() %></td>
		                                        <td><%= f.getFaqCreateDate() %></td>
		                                        <td><%= f.getFaqStatus() %></td>
		                                    </tr>
                                    	<%} %>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging-area" align="center">    
			
							<% if(currentPage != 1){ %> <!-- 1번 페이지가 아닐 시에 이전페이지 버튼이 생기도록 -->
				            <button onclick="location.href='<%=contextPath%>/list.fa?cpage=<%=currentPage-1%>';" class="btn btn-sm btn-outline-primary">&lt;</button>
							<%} %>
							
							<% for(int p=startPage; p<=endPage; p++){ %>
							
								<% if(p == currentPage){ %>
									<button disabled class="btn btn-sm btn-outline-primary"><%= p %></button> <!-- 현재 페이지의 버튼은 비활성화 -->
								<% }else{ %>
				            		<button onclick="location.href='<%=contextPath%>/list.fa?cpage=<%=p%>';"  class="btn btn-sm btn-outline-primary"><%= p %></button>
				            	<% } %>
							<%} %>
							
							<% if(currentPage != maxPage){ %> <!-- 마지막 페이지가 아닐 시에 다음페이지 버튼이 생기도록 -->
				            <button onclick="location.href='<%=contextPath%>/list.fa?cpage=<%=currentPage+1%>';" class="btn btn-sm btn-outline-primary">&gt;</button>
				            <%} %>
				
				        </div>
		        
                        </div>
                    </div>
                </div>

                </div>
                <!-- /.container-fluid -->
				<br><br>
				
				 <script>
		        	 $(function(){
		        		$(".spaceListTable>tbody>tr").click(function(){
		        			location.href="<%=contextPath%>/detail.fa?no=" + $(this).children().eq(0).text();
		        		})
		        	})
        		</script>
        
            </div>
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src=""></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "java.util.ArrayList, com.spacefit.mem.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	String errorMsg = (String)session.getAttribute("errorMsg");
	int todayMem = (int)request.getAttribute("todayMem");
	int goldMem = (int)request.getAttribute("goldMem");


	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<title>Space Fit 회원 정보 조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
<style>
	


</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
     <!--  <div class="outerRv"> -->
     
     	<div class="container-fluid">
		<br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">회원 정보 조회</h1>
        <br><br><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<div style="height : 60px"></div>
                        	  <div class="row" id="reviewChart">
								  <div class="col-4" id="todaysReview">
								  	<span>오늘 가입한 회원</span><br>
								  	<h4><%=todayMem %></h4>	
								  </div>
								  <div class="col-4" id="avgStar">
								  	<span>전제회원</span><br>
								  	<h4><%=list.size() %></h4>	
								  </div>
								  <div class="col-4" id="avgReview">
								  	<span>골드회원</span><br>
								  	<h4><%=goldMem %></h4>	
								  </div>
								</div>
								
							  <div style="height : 60px"></div>
							  <div id="selectSelection">
								<div class="row" id="selectDivMem">
							  		<div>
								  	  <button class="btn btn-success" onclick="gradeUp();">등급상향</button>
								  	  <button class="btn btn-warning" onclick="gradeDown();">등급하향</button>
								  	  <button class="btn btn-primary" onclick="generalChange();">회원으로 변경</button>
									  <button type="submit" class="btn btn-secondary" onclick="adminChange();">관리자로 변경</button>
									  <button type="submit" class="btn btn-dark" onclick="blackChange();">블랙리스트 해제</button>
									  <!-- <button class="btn btn-danger">회원탈퇴</button> -->
							  		</div>
							  	</div>
						  		<select id="orderBySel" name="orderBySel" onchange="changeSelect()">
								  <option value="newest" selected>최신회원 조회</option>
								  <option value="bestOrder">이번달주문건수</option>
								  <option value="reported">누적신고순</option>
								  <option value="like">누적추천순</option>
								  <option value="adminOnly">관리자 조회</option>
								  <option value="userOnly">회원 조회</option>
								  <option value="black">블랙리스트 조회</option>
								</select>
								<select id="orderBySel" name="orderBySel" onchange="changeSelect()">
								  <option value="" selected>이번달 주문건수별</option>
								  <option value="forBasic">0건이상 3건미만</option>
								  <option value="forSilver">3건이상 5건미만</option>
								  <option value="forGold">5건이상 7건미만</option>
								</select>
							  </div>

							<div style="height : 30px"></div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered memberListTable" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th><input type="checkbox" name="choiceAll" id="choiceAll"></th>
	                                        	<th>회원번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>전화번호</th>
	                                            <th>회원등급</th>
	                                            <th>누적신고</th>
	                                            <th>누적추천</th>
	                                            <th>관리자여부</th>
	                                            <th>회원상태</th>
	                                            <th>이번달 주문건수</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </thead>
	                                     <tfoot>
	                                        <tr>
	                                        	<th>선택</th>
	                                        	<th>회원번호</th>
	                                            <th>아이디</th>
	                                            <th>이름</th>
	                                            <th>전화번호</th>
	                                            <th>회원등급</th>
	                                            <th>누적신고</th>
	                                            <th>누적추천</th>
	                                            <th>관리자여부</th>
	                                            <th>회원상태</th>
	                                            <th>이번달 주문건수</th>
	                                            <th>상세보기</th>
	                                        </tr>
	                                    </tfoot>
	                                   
	                                    <tbody id="memListTBody">
	                                    	
	                                    </tbody>
	                                </table>
								</div>
	                        </div>
	                        
	                        <form action="<%= contextPath %>/changeAdm.me" id="adminForm" method="post">
	                        	<input type="hidden" name="strAdminNo" value="" id="strAdminNo">
	                        </form>
	                        
	                        <form action="<%= contextPath %>/changeGen.me" id="genForm" method="post">
	                        	<input type="hidden" name="strGenNo" value="" id="strGenNo">
	                        </form>
	                        
	                        
	                        <form action="<%= contextPath %>/gradeUp.me" id="gradeUpForm" method="post"> 
	                        	<input type="hidden" name="strGradeUpNo" value="" id="strGradeUpNo">
	                        </form>
	                        
	                        <form action="<%= contextPath %>/gradeDown.me" id="gradeDownForm" method="post"> 
	                        	<input type="hidden" name="strGradeDownNo" value="" id="strGradeDownNo">
	                        </form>
	                        
	                        <form action="<%= contextPath %>/changeBlack.me" id="blackForm" method="post">
	                        	<input type="hidden" name="strBlackNo" value="" id="strBlackNo">
	                        </form>
	                               
                  <script>
                      
                      
                      
                 $(function(){
                	 changeSelect();
                      })
                      
                     
                  function adminChange(){
                      	let strAdminCheck = "";
                      	
                      	$("#memListTBody :checkbox:checked").each(function(){
                      		
                      		strAdminCheck += $(this).val() + ",";
                      	})
                      	
                      	strAdminCheck = strAdminCheck.substring(0, strAdminCheck.lastIndexOf(","));
                      	
                      	//console.log("자바스크립트에서 확인하는 strAdminCheck : " + strAdminCheck);
                      	
                      	$("#strAdminNo").val(strAdminCheck);
                      	//console.log($("#strAdminNo").val());
                      	$("#adminForm").submit();
                      	//console.dir(adminForm);
                      }
                 
                 function generalChange(){
                   	let strGenCheck = "";
                   	
                   	$("#memListTBody :checkbox:checked").each(function(){
                   		
                   		strGenCheck += $(this).val() + ",";
                   	})
                   	
                   	strGenCheck = strGenCheck.substring(0, strGenCheck.lastIndexOf(","));
                   	
                   	
                   	$("#strGenNo").val(strGenCheck);
                   	$("#genForm").submit();
                   }
                 
                 
                 function gradeUp(){
                    	let strGradeUpCheck = "";
                    	
                    	$("#memListTBody :checkbox:checked").each(function(){
                    		
                    		strGradeUpCheck += $(this).val() + ",";
                    	})
                    	
                    	strGradeUpCheck = strGradeUpCheck.substring(0, strGradeUpCheck.lastIndexOf(","));
                    	
                    	
                    	$("#strGradeUpNo").val(strGradeUpCheck);
                    	$("#gradeUpForm").submit();
                    }
                 
                 function gradeDown(){
                 	let strGradeDownCheck = "";
                 	
                 	$("#memListTBody :checkbox:checked").each(function(){
                 		
                 		strGradeDownCheck += $(this).val() + ",";
                 	})
                 	
                 	strGradeDownCheck = strGradeDownCheck.substring(0, strGradeDownCheck.lastIndexOf(","));
                 	
                 	
                 	$("#strGradeDownNo").val(strGradeDownCheck);
                 	$("#gradeDownForm").submit();
                 }
                 
                 function blackChange(){
                    	let strBlackCheck = "";
                    	
                    	$("#memListTBody :checkbox:checked").each(function(){
                    		
                    		strBlackCheck += $(this).val() + ",";
                    	})
                    	
                    	strBlackCheck = strBlackCheck.substring(0, strBlackCheck.lastIndexOf(","));
                    	
                    	
                    	$("#strBlackNo").val(strBlackCheck);
                    	$("#blackForm").submit();
                    }
                     
                 
                 
                 
                 
                 
     function checkAll() {
   		if($("#choiceAll").is(':checked')) {
   			$("#memListTBody :checkbox").prop("checked", true);
   		} else {
   			$("#memListTBody :checkbox").prop("checked", false);
   		}
   	}           
                 
                      
	function changeSelect(){
			let orderBy = $("#orderBySel").val();
			let contextPath = "<%= contextPath %>"
			const memListTBody = $("#memListTBody");
			 $.ajax({
				       url:"<%=contextPath%>/orderByMem.me",
			  		 data:{
			  			orderBy:orderBy
			  		 },
			  		 type:"post",
			  		 success:function(memList){
			  			if(memList.length == 0){
			           					// 회원리스트가 비어있다면
			   							let value ='<tr><td colspan="11">존재하는 회원이 없습니다.</td></tr>'
			   							memListTBody.html(value);
			   						} else {
				  			let value = ""
				  			for(let i = 0; i<memList.length; i++) {
				  				/* $(function(){
					  					if( memList[i].memAdmFlag == 'A') {
					  						$("#adminFlag").val("Admin").attr('selected', 'selected');
					  					} else {
					  						$("#adminFlag").val("General").attr('selected', 'selected');
					  					}
					  				}) */
				  	if(memList[i].memAdmFlag == 'A') {
				  		memAdmFlag = "관리자"
				  	} else {
				  		memAdmFlag = "일반"
				  	}
	  				
			  		if (memList[i].grName == "Basic") {
	  					grSelectVal = "Basic";
	  				} else if  (memList[i].grName == "Silver") {
	  					grSelectVal = "Silver";
	  				} else {
	  					grSelectVal = "Gold";
	  				}
	  					
			  		if (memList[i].memStatus == "Y") {
			  			memStatus = "회원"
	  				} else if  (memList[i].memStatus == "N") {
	  					memStatus = "탈퇴회원"
	  				} else {
	  					memStatus = "블랙리스트"
	  				}
		  				
		  			value += 
			  			'<tr>'
	                                  + ' 	  <td><input type="checkbox" name="choice" id="choice" value="' + memList[i].memNo + '"></td> '
	                                  + '     <td>' + memList[i].memNo + '</td> '
	                                  + '     <td>' + memList[i].memId + '</td> '
	                                  + '     <td>' + memList[i].memName + '</td> '
	                                  + '     <td>' + memList[i].memPhone + '</td> '
	                                  + '     <td>' + grSelectVal  + '</td> '
	                                  + '     <td>' + memList[i].rptCount + '</td> '
	                                  + '     <td>' + memList[i].likeCount + '</td> '
	                                  + '     <td>' + memAdmFlag + '</td> '
	                                  + '     <td>' + memStatus + '</td> '
	                                  + '     <td>' + memList[i].bookCountMonth + '</td> '
	                                  + '     <td><a class="btn btn-primary btn-sm" href="'+contextPath+'/memDetailView.me?no='+ memList[i].memNo +'">상세조회</a></td>'
	                                  + '  </tr> '
	                                  + '<input type="hidden" value="'+ memList[i].memNo +'">'
	  					 }
		  				memListTBody.html(value);
		  				
			  		 }
	  		 },
	  		 error:function(){
	  			console.log("회원목록 조회용 ajax 통신 실패");
	  		 }
	  		 
	  	 })
	}
					
					
					
					</script>
	                      <!-- 
							<div class="paging-area" align="center">    
		        
								<button class="btn btn-sm btn-outline-primary">&lt;</button>        
								<button disabled class="btn btn-sm btn-outline-primary">1</button>        
								<button class="btn btn-sm btn-outline-primary">2</button> 
								<button class="btn btn-sm btn-outline-primary">3</button>    
								<button class="btn btn-sm btn-outline-primary">4</button> 
								<button class="btn btn-sm btn-outline-primary">5</button>       
								<button class="btn btn-sm btn-outline-primary">&gt;</button>
								
							</div>
							-->
							<div style="height : 60px"></div>
	                    </div>
                	</div>
     			</div>  
    
                <!-- /.container-fluid -->
				<br><br>        		
          <!--  </div>-->  
    <div style="height : 100px"></div>
	<!-- 자바스크립트 파일 연동 -->
	<script type="text/javascript" src="<%=contextPath %>/resources/admin/js/member.js"></script>
	<script type="text/javascript" src=""></script>
</body>
</html>
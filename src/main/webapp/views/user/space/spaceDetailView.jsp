<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,
    							 com.spacefit.review.model.vo.Review,
    							 com.spacefit.product.model.vo.Space,
    							 com.spacefit.attachment.model.vo.Attachment,
    							 com.spacefit.review.model.vo.Comment
    							 "%>
<%
	String thisPath = request.getContextPath();
	ArrayList<Review> rvList = (ArrayList<Review>)request.getAttribute("rvList");
	int avgStars = (Integer)request.getAttribute("avgStars");
	Space s = (Space)request.getAttribute("s");
	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("at");
	
	ArrayList<Comment> comList = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/space.css">
<!-- Swiper CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.3.0/swiper-bundle.min.css"/>
<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<link href='<%= request.getContextPath() %>/resources/user/css/calendar.css' rel="stylesheet" />


<title>Insert title here</title>
<style>
/* 캘린더 */
body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
</style>
</head>
<body>



	<%@ include file="../common/userMenubar.jsp" %>

    <main id="main">
    <form action="<%=contextPath%>/결제페이지" method="get" id="detailForm">
        <!-- ======= space view ======= -->
        <section class="agent-single">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-md-7">
                                <!-- 사진파트 -->
                                <div class="row">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8">
                                            <div id="property-single-carousel" class="swiper">
                                                <div class="swiper-wrapper">
                                                	<div class="carousel-item-b swiper-slide">
                                                        <img src="<%=thisPath%>/<%= s.getSpacePic() %>" alt="">
                                                    </div>
                                                	<%for(Attachment a : atList){ %>
                                                    <div class="carousel-item-b swiper-slide">
                                                        <img src="<%=thisPath%>/<%=a.getFilePath()%>/<%=a.getFileChangeName() %>" alt="">
                                                    </div>
                                                    <%} %>
                                                </div>
                                            </div>
                                        <div class="property-single-carousel-pagination carousel-pagination"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="miniSub">
                                        OUR SPACE
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="detailNav">
                                        <div class="col-md-12">
                                            <ul class="nav nav-pills-a nav-pills mb-3 section-t3" id="pills-tab" role="tablist" style="background-color:lightgray; padding-top:0px;">
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link active" id="pills-gonggan-tab ayNav" data-bs-toggle="pill" href="#pills-gonggan" role="tab" aria-controls="pills-gonggan" aria-selected="true">공간소개</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-sisul-tab ayNav" data-bs-toggle="pill" href="#pills-sisul" role="tab" aria-controls="pills-sisul" aria-selected="false">시설안내</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-eyoung-tab ayNav" data-bs-toggle="pill" href="#pills-eyoung" role="tab" aria-controls="pills-eyoung" aria-selected="false">이용안내</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-sDetailQNA-tab ayNav" data-bs-toggle="pill" href="#pills-sDetailQNA" role="tab" aria-controls="pills-sDetailQNA" aria-selected="false">Q&A</a>
                                            </li>
                                            </ul>
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="pills-gonggan" role="tabpanel" aria-labelledby="pills-gonggan-tab">
                                                    <%= s.getSpaceInfo() %>
                                                </div>
                                                <div class="tab-pane fade" id="pills-sisul" role="tabpanel" aria-labelledby="pills-sisul-tab">
                                                    <ol>
                                                        <li> 빔 프로젝터(티빙 및 유튜브 가능)</li>
                                                        <li>파티룸 및 루프탑 이용시 각종 식기류(맥주잔, 와인잔, 컵, 쟁반 접시류 등)</li>
                                                        <li>공기청정기, 에어프라이어, 커피머신, 냉난방기, 전자렌지</li>
                                                        <li>음식물 반입 및 조리(파티룸, 루프탑) 가능 (배달음식 가능)</li>
                                                        <li>전체 연습실 블루투스 스피커 및, 마샬 앰프 제공</li>
                                                        <li>스튜디오 조명 DAEHAN 썬빔 KIT-SUN05 (소프트박스) x2, 룩스패드 x3</li>
                                                    </ol>
                                                </div>
                                                <div class="tab-pane fade" id="pills-eyoung" role="tabpanel" aria-labelledby="pills-eyoung-tab">
                                                    <ol>
                                                        <li>보안, 안전 및 인원체크를 위해 입구 CCTV가 작동되고 있습니다.</li>
                                                        <li>스페이스핏은 숙박업소가 아니기 때문에 숙박시설에서 제공되는 물품이 제공되지 않습니다.</li>
                                                        <li>건물내(실내) 전체 금연입니다.</li>
                                                        <li>부대시설 고장 및 파손시 전액 금액청구</li>
                                                        <li>지나치게 음악소리를 크게 틀거나 소리를 지르는 행위는 삼가 해주세요.</li>
                                                        <li>시간엄수 부탁드리며, 퇴실전 뒷정리 부탁드립니다.</li>
                                                    </ol>
                                                </div>
                                                <div class="tab-pane fade" id="pills-sDetailQNA" role="tabpanel" aria-labelledby="pills-sDetailQNA-tab">
                                                    testQNA
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div id="miniSub">
                                        <span>REVIEW ZONE</span> <span id="minisubSmall">전체상품평 15개</span>
                                    </div> 
                                </div>
                                <div class="row">
                                
                                
                                    <div id = "rvContentList">
                                        <!--  ~review보이는 공간~ -->
	                                    <% if (!rvList.isEmpty()) { %> <!-- 리뷰리스트가 엠티가 아니면 -->
	                                    
		                                        <hr>
		                                        <div class="introRv">
		                                            <div class="stars" >
		                                            	<% for(int i=0; i<avgStars; i++) { %>
		                                                   <span id='starYellow'>★</span>
	                                                   	<% } %>
	                                                   	<% int whiteStar1 = 5-avgStars; %>
	                                                   	<% for(int i=0; i<whiteStar1; i++){ %>
	                                                       	<span id='starWhite'>★</span>
	                                                    <% } %>
		                                            </div>
		                                            <h4>" 스페이스핏의 고객님들은 이 장소를 이렇게 평가하셨어요! "</h4><br>
		                                        </div>
		                                        <div class="rvPhotoZone">
		                                            <tr class="rvPhotos"> 
		                                                <td>
		                                                    <span class="material-symbols-outlined">
		                                                    arrow_back_ios
		                                                    </span>
		                                                </td>                       
		                                                <td><img class="titleImg" width="200" height="160" onclick=""></td>
		                                                <td><img class="titleImg" width="200" height="160" onclick=""></td>
		                                                <td><img class="titleImg" width="200" height="160" onclick=""></td>
		                                                <td>
		                                                    <span class="material-symbols-outlined">
		                                                    arrow_forward_ios
		                                                    </span>
		                                                </td>
		                                            </tr>
		                                        </div>
		                                        <div id="rvOrderBy">
		                                            <a>추천순</a>&ensp;|&ensp;<a>최신순</a>&ensp;|&ensp;<a>우수후기</a>
		                                        </div>
		                                        
		                                        <% for(Review r : rvList) { %>  
		                                        <div class="container-fluid eachRvList">
		                                            <div class="row">
		                                                <div class="col-lg-3"> 
		                                                    <img class="titleImg" width="150" height="120" onclick="">
		                                                    <span id="titleImgSpan">후기작성일 : <%=r.getReviewModifyDate() %></span>
		                                                </div>
		                                                <div class="col-lg-6" id="eachRvListHeader">
		                                                    <h4><%=r.getSpaceName() %></h4>
		                                                        <span id="commentSpan">
		                                                            <button type="button" id="showCom" class="collapsed"
		                                                             data-bs-toggle="collapse" data-bs-target="#flush-collapse<%= r.getReviewNo() %>" aria-expanded="false" aria-controls="flush-collapse<%= r.getReviewNo() %>"
		                                                              onclick="commentList(<%= r.getReviewNo() %>);">
			                                                            후기댓글보기
			                                                            <input type="hidden" id="rvNo" value="<%=r.getReviewNo()%>">
			                                                         </button>
		                                                        </span>
		                                                    <hr>
		                                                    <div id ="showStars">
		                                                        <div class="smallStars" >
		                                                        	<% for(int i=0; i<r.getReviewStar(); i++) { %>
		                                                        		<span id='starYellow'>★</span>
		                                                        	<% } %>
				                                                   	<% int whiteStar2 = 5-(r.getReviewStar()); %>
				                                                   	<% for(int i=0; i<whiteStar2; i++){ %>
		                                                            	<span id='starWhite'>★</span>
		                                                            <% } %>
		                                                        </div>
		                                                        <span id="countLike"><span><%=r.getAllLikeCount() %></span>명이 이 후기를 추천했어요!</span><br>
		                                                    </div>
		                                                    <textarea id="rvContentDiv">
		                                                        <%=r.getReviewContent() %>
		                                                    </textarea>
		                                                </div>
		                                                <div class="col-lg-3 memInfoDiv">
		                                                    <div class="mem">
		                                                        <span class="material-symbols-outlined memProfilePic" id="memProfilePic">
		                                                            account_circle
		                                                        </span>
		                                                        <span id="memSpan">
		                                                            <div><%=r.getMemId() %></div>
		                                                            <span>회원등급 :</span><span><%=r.getGradeName() %></span>
		                                                        </span>
		                                                    </div>
		                                                    <br>
		                                                    <div class="rvLikeAndReport">
		                                                    	<% if (directMemNo == 0) { %>
		                                                    		<button type="button" class="btn btn-primary btn-sm" id="login-btn" onclick="loginForm();">로그인하고 추천!</button>
		                                                    	<% } else { %>
			                                                        <button type="button" class="btn btn-primary btn-sm" data-value="<%= r.getReviewNo() %>" onclick="likeUpdate(this);">후기추천</button>
			                                                        <button type="button" class="btn btn-danger btn-sm">후기신고</button>
			                                                        <input type="hidden" value="<%= directMemNo %>" name="memNo" id="memNo">
			                                        				<input type="hidden" value="<%= r.getReviewNo() %>" name="rvNo" id="rvNo">
			                                        			<% } %>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <br><br>
		                                            <div class="collapse commentDiv" id="flush-collapse<%= r.getReviewNo() %>"  aria-labelledby="flush-heading<%= r.getReviewNo() %>" data-bs-parent="#accordionFlushExample">
	                                                    <div class="parentCommentAll" id="parentCommentAll"></div>
                                                        <div id="writeComment">
                                                            <table id="writeTable" align="center">
                                                                <thead>
                                                                    <tr>
                                                                    	<% if(directMemNo == 0) { %>
	                                                                        <th id="justText">댓글작성</th>
	                                                                        <th><textarea rows="3" cols="50" style="resize:none;"readonly>로그인 후 이용가능한 서비스입니다.</textarea></th>
	                                                                        <td><button class="btn btn-primary" type="button">댓글등록</button></td>
	                                                                     <% } else { %>
	                                                                     	<th id="justText">댓글작성</th>
	                                                                        <th><textarea rows="3" cols="50" style="resize:none;" id="comContent"></textarea></th>
	                                                                        <td><button class="btn btn-primary" type="button" onclick="insertComment();" >댓글등록</button></td>
	                                                                     <% } %>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
		                                            </div>
		                                        </div>
	                                        	<% } %>
	                                        	
	                                        	
	                                    <% } else { %>
	                                    	 <h4>" 아직 작성된 후기가 없습니다 "</h4><br>
										<% } %>
										
										
										
									</div>
									
                         <!--  ~review보이는 공간~ -->
                                    
                               
                            </div>
                            
                            
                            
                            <div class="col-md-1"></div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="title-box-d" style="margin-bottom:0; margin-top:30px;">
                                            <h1 class="title-d"><%=s.getSpaceName() %></h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <h4 style="margin-top:35px; border-bottom:2px solid #0D6EFD" id="aySelect">옵션선택</h4>
                                    <span class="col-sm-4"> 이용인원  </span>
                                    <select name="limit" required>
                                        <%for(int i=2; i<21; i++){ %>
                                        	<option value="<%=i%>"><%= i %>명</option>
                                        <%} %>
                                    </select>
                                    <span class="col-sm-4"> 주차  </span>
                                    <select name="parking" required>
                                        <option value="N" selected>요청하지 않아요</option>
                                        <option value="Y">요청할게요</option>
                                    </select>
                                    <span class="col-sm-4"> 반려동물  </span>
                                    <select name="animal" required>
                                        <option value="N" selected>동반하지 않아요</option>
                                        <option value="Y">동반할게요</option>
                                    </select>
                                    <span class="col-sm-4"> 보면대  </span>
                                    <select name="stand" required>
                                        <option value="N" selected>필요하지 않아요</option>
                                        <option value="Y">필요해요</option>
                                    </select>
                                    <span class="col-sm-4"> 미니의자  </span>
                                    <select name="chiar" required>
                                        <option value="N" selected>필요하지 않아요</option>
                                        <option value="Y">필요해요</option>
                                    </select>
                                </div>

                                <div class="row">
                                    <h4 style="margin-top:40px; border-bottom:2px solid #0D6EFD">날짜선택</h4>
                                    <!-- calendar 태그 -->  
                                    <div id='calendar-container'>    
                                        <div id='calendar'></div>  
                                    </div>  
                                </div>
                                <br><br>
                                <h5>선택 날짜 : <b id="chDate"></b></h5>
                                <input type="hidden" class="chDate" name="date" required>
	
                                <div class="row">
                                    <h4 style="margin-top:40px; border-bottom:2px solid #0D6EFD">시간선택</h4>
                                    <span class="col-sm-4"> 체크인  </span>
                                    <select name="detailCI" class="detailCI" required>
                                    	<%for(int i=9; i<22; i++){ %>
                                        	<option value="<%=i%>">
                                        		<% if(i==9){%>
                                        			0<%= i %>:00
                                        		<%}else{%>
                                        			<%= i %>:00
                                        		<%} %>
                                        	</option>
                                        <%} %>
                                    </select>
                                    <span class="col-sm-4"> 체크아웃  </span>
                                    <select name="detailCO" class="detailCO" required>
                                       <%for(int i=10; i<22; i++){ %>
                                        	<option value="<%=i%>"><%= i %>:00</option>
                                        <%} %>
                                    </select>
                                </div>

                                <div class="row">
                                    <h4 style="margin-top:40px; border-bottom:2px solid #0D6EFD">총 금액</h4>
                                    <div><span class="col-sm-4" id="price"> </span><b>원</b></div>
                                    <input type="hidden" name="price" class="price" required>
                                </div>
                                <script>
                                	$(".detailCO").change(function(){
                                        const pp = $(".detailCO>option:selected").val() - $(".detailCI>option:selected").val();
                                        $("#price").text(pp * <%= s.getSpacePrice() %>);
                                        $(".price").val((pp * <%= s.getSpacePrice() %>));
                                	})
                                </script>
                                

                                <div class="row">
                                <!-- limit, parking, animal, stand, chair, date, detailCI, detailCO, price  -->
                                	<input type="hidden" name="no" value="<%=s.getSpaceNo() %>">
                                    <div id="ayBtn" style="text-align:center; margin-top:100px;">
                                        <button type="button" class="btn btn-primary" onclick="formSumbit(1);">바로결제</button>
                                        <button type="button" onclick="formSubmit(2);" class="btn btn-outline-dark">보관함</button>
                                        <button type="button" onclick="insertLove();" class="btn btn-outline-danger">찜하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </form>
    </main>
    <script>
    	function formSubmit(num){ // num이 1일시 결제, num이 2일시 보관함
    		if(num == 1){
    			$("#detailForm").attr("action", "결제페이지");
	    		$("#detailForm").submit();
    		}else{
    			$.ajax({
    				url:'<%=contextPath %>/cart.sp',
    				data:{no:<%=s.getSpaceNo() %>
    					, limit:$("select[name=limit]").val()
    					, parking:$("select[name=parking]").val()
    					, animal:$("select[name=animal]").val()
    					, stand:$("select[name=stand]").val()
    					, chair:$("select[name=chair]").val()
    					, date:$("input[name=date]").val()
    					, detailCI:$("select[name=detailCI]").val()
    					, detailCO:$("select[name=detailCO]").val()
    					, price:$("input[name=price]").val()
    					},
    				success:function(cfMsg){
    					if(confirm(cfMsg)){
    						location.href="<%=contextPath%>/views/user/myPage/cartListView.jsp";
    					}
    				}
    				
    			})
    		}
    	}
    	
    	function insertLove(){
    		<%-- $.ajax({
    			url:'<%=contextPath%>/insert/lo',
    			data:{no:<%=s.getSpaceNo() %>},
    			success:
    		}) --%>
    	}
    </script>

    <script>
    
	$(function(){
		calendarRendering();
	})
   
    function calendarRendering(){
    	var calendarEl = document.getElementById('calendar');
		
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
		    locale: 'ko',
		    
		    selectable:true,
		    dateClick:function(info){
		    	//console.log(info.dateStr); // 선택한 날짜 2022-08-02
		    	$("#chDate").html(info.dateStr);
		    	$(".chDate").val(info.dateStr);
		    	
			    	$.ajax({
			    		url: '<%=contextPath%>/calender.sp',
			    		data:{no:<%=s.getSpaceNo()%>, date:info.dateStr},
			    		success: function(list){
			    			//console.log(list);
			    			// 캘린더에서 클릭된 날짜를 토대로 시간 선택 할 수 있게 해주기
			    			// 즉, 캘린더에 예약된 내역들을 굳이 뿌리지 않을 것임
			    			
			    			// 예약 없는 날은 disabled해제
		    				$(".detailCI").children().each(function(){
		    					$(this).attr('disabled',false).css("background", "white");
		    				});
		    				$(".detailCO").children().each(function(){
		    					$(this).attr('disabled',false).css("background", "white");
		    				});
		    				
			    			// 예약된 시간들은 disabled처리
		    				for(let i=0; i<list.length; i++){
		    					for(let j=list[i].bookInTime; j<=list[i].bookOutTime; j++){
		    						$("select option[value*="+ j + "]").attr('disabled',true).css("background", "lightgrey");
		    					}
			    			}
			    		},
			    	});
		    }
		});
		calendar.render();
		
    }
    </script>
    
    
    <script>
				                       function likeUpdate(e){
				                    	   let rvNo = $(e).data("value")
				                    		 
				                    			  $.ajax({
						                    			url:"<%=contextPath %>/likeUpdate.lk",
						                    			data:{
						                    				memNo:$("#memNo").val(),
						                    				rvNo:rvNo
						                    			},
						                    			success:function(result){
						                    				if(result == "likeOk"){
						                    					// 추천이 완료된 데이터, 예약번호가 넘어옴
						            							alert("추천해주셔서 감사합니다!");
						                    					// 바로 표시되게 하는 걸 못하게씀 ㅜㅜ
						            						} else {
						            							// 후기 중복확인
						            							alert("이미 추천한 후기입니다!");
						            							}
						                    			},
						                    			error:function(){
						                    				console.log("추천 +1 AJAX 통신 실패");
						                    			}
						                    		})
				                    		  }
					                    
				                       function loginForm(){
				           	       		location.href="<%=contextPath%>/loginForm.me";
				           				}
				                       
				                       
				                       function commentList(e){
				                    	   const commentDiv = $(window.event.target).parents(".eachRvList").find(".parentCommentAll");
				                    	   console.log(commentDiv);
				                    	   $.ajax({
				                    		   url : "<%=contextPath%>/comList.com",
				                    		   data:{
				                    			   rvNo:e,
					                    			},
				                    		   success:function(comList){
				                    				if(comList.length == 0){
				                    					// 댓글리스트가 비어있다면
				            							let value ='<h4> 아직 작성된 댓글 없습니다 </h4><br>'
				            								commentDiv.html(value);
				            						} else {
				            							// 댓글리스트가 있다면
				            							let value = ""
				            								for(let i = 0; i<comList.length; i++) {
				            									value += ' <div class="commentMem row"> '
					            												+ '<div class="parentMem col-lg-6">'
					            												+ 	'<span class="material-symbols-outlined memProfilePic" id="memProfilePic">'
					            												+		'account_circle'
					            												+		'</span>'
					            												+		'<span id="memSpan">'
					            												+			comList[i].memId
					            												+		'</span>'
					            												+		'<span id="dateSpan">'
					            												+			comList[i].comEnrollDate
					            												+		'</span>'
					            												+ '</div>'
					            												+ '<div class="parentInfo col-lg-6">'
					            												+	'<button type="button" class="comBtn" id="reDelete">삭제하기</span>'
					            												+	'<button type="button" class="comBtn" id="reReport">신고하기</span>'
					            												+	'<button type="button" class="comBtn" id="reComment">대댓달기</span>'
					            												+	'<input type="hidden" value="' + comList[i].parentNo + '" id="hiddenPno">'
					            												+ '</div>'
					            												+ '<hr>'
					            												+ '<div id="showComment">'
					            												+ 	'<div class="parentComment">'
					            												+		'<textarea id="commentArea">' + comList[i].comContent + '</textarea >'
					            												+	'</div>'
					            												+ '</div>'
				            												+ '</div>'
				            								}
				            							
				            							commentDiv.html(value);
				            							//$(".parentCommentAll").html(value);
				                    			}
				                    		   },
				                    			error:function(){
				                    				console.log("댓글조회용 AJAX 실패");
				                    			}
				                    	   })
				                       }
				                       
				                       // 대댓달기라는 버튼을 눌렀을때만 그 댓글의 hiddenPno를 가져오고, 대댓달기를 누르지 않으면 0이 되도록
									// 그럼 대댓을 생각하지 말고 일단 댓글만 생각해보자				                       
				                       function insertComment(){
				          	        	 $.ajax({
				          	        		 url:"<%=contextPath%>/coInsert.com",
				          	        		 data:{
				          	        			 comContent:$("#comContent").val(),
				          	        			 memNo:$("#memNo").val(),
				          	        			 rvNo:$("#rvNo").val()
				          	        		 },
				          	        		 type:"post",
				          	        		 success:function(result){
				          	        			 if(result > 0){
				          	        				 // 댓글작성 성공
				          	        				 // => 내가 작성한 댓글이 보여지기 위해서는 갱신된 댓글리스트 조회필요
				          	        				 commentList(rvNo);
				          	        				 $("#comContent").val(""); //textarea 초기회
				          	        			 }
				          	        		 },
				          	        		 error:function(){
				          	        			console.log("댓글작성 ajax 통신 실패");
				          	        		 }
				          	        		 
				          	        	 })
				          	         }
				                    	   
									</script>


    <!-- footer -->
    <%@ include file="../common/userFooter.jsp" %>

</body>

<script src="<%= thisPath %>/resources/user/templates/real_estate/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%= thisPath %>/resources/user/templates/real_estate/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="<%= thisPath %>/resources/user/templates/real_estate/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="<%= thisPath %>/resources/user/templates/real_estate/assets/js/main.js"></script>


<!-- jquery CDN -->  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>  

<!-- fullcalendar -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</html>
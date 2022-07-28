<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPath = request.getContextPath();
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


<title>Insert title here</title>
<style>

    
    /* 캘린더 */
        #calendar {
        max-width: 1100px;
        margin: 40px auto;
    }
    .fc-toolbar-chunk{
        width:100%;
    }
    .fc-toolbar-title{
        font-size:15px;
    }
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

    <main id="main">
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
                                                        <img src="<%=thisPath%>/resources/admin/img/best3.jpeg" alt="">
                                                    </div>
                                                    <div class="carousel-item-b swiper-slide">
                                                        <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="">
                                                    </div>
                                                    <div class="carousel-item-b swiper-slide">
                                                        <img src="<%=thisPath%>/resources/admin/img/연습실/연습실1/prac1_1.jpg" alt="">
                                                    </div>
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
                                                    test공간소개탭
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
                                        REVIEW ZONE
                                    </div> 
                                </div>
                                <div class="row">
                                    <div>~review보이는 공간~</div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="title-box-d" style="margin-bottom:0; margin-top:30px;">
                                            <h1 class="title-d">Property Description</h1>
                                        </div>
                                    </div>
                                    <div class="property-description">
                                        <p class="description color-text-a no-margin">
                                            다양한 파티를 원하는 분들을 위한 공간
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <h4 style="margin-top:35px; border-bottom:2px solid #0D6EFD" id="aySelect">옵션선택</h4>
                                    <span class="col-sm-4"> 이용인원  </span>
                                    <select name="limit">
                                        <%for(int i=2; i<21; i++){ %>
                                        	<option value="<%=i%>"><%= i %>명</option>
                                        <%} %>
                                    </select>
                                    <span class="col-sm-4"> 주차  </span>
                                    <select name="parking">
                                        <option value="N">요청하지 않아요</option>
                                        <option value="Y">요청할게요</option>
                                    </select>
                                    <span class="col-sm-4"> 반려동물  </span>
                                    <select name="animal">
                                        <option value="N">동반하지 않아요</option>
                                        <option value="Y">동반할게요</option>
                                    </select>
                                    <span class="col-sm-4"> 보면대  </span>
                                    <select name="stand">
                                        <option value="N">필요하지 않아요</option>
                                        <option value="Y">필요해요</option>
                                    </select>
                                    <span class="col-sm-4"> 미니의자  </span>
                                    <select name="chiar">
                                        <option value="N">필요하지 않아요</option>
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

                                <div class="row">
                                    <h4 style="margin-top:40px; border-bottom:2px solid #0D6EFD">시간선택</h4>
                                    <span class="col-sm-4"> 체크인  </span>
                                    <select name="detailCI">
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
                                    <select name="detailCO">
                                       <%for(int i=10; i<22; i++){ %>
                                        	<option value="<%=i%>"><%= i %>:00</option>
                                        <%} %>
                                    </select>
                                </div>

                                <div class="row">
                                    <div id="ayBtn" style="text-align:center; margin-top:100px;">
                                        <button class="btn btn-primary">바로결제</button>
                                        <button class="btn btn-outline-dark">보관함</button>
                                        <button class="btn btn-outline-danger">찜하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
	<script>  
        document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'UTC',
            themeSystem: 'bootstrap5',
            headerToolbar: {
            left: 'title',
            right: 'today prev,next'
            },
            weekNumbers: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: 'https://fullcalendar.io/api/demo-feeds/events.json'
        });

        calendar.render();
        });
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
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</html>
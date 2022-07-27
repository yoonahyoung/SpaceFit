<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.3.0/swiper-bundle.min.css"/>
<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  


<title>Insert title here</title>
<style>
    /* main *{
        border:1px solid black;
    } */
    /* 사진 */
    .swiper-wrapper img{
        height:auto;
        max-width:100%;
        object-fit: scale-down;
    }
    .swiper-wrapper{
        text-align:center;
        line-height:574px;
    }

    /* minisub */
    #miniSub{
        font-size:40px;
        font-weight:600;
        margin-top:100px;
        color:#0D6EFD;
    }
    .nav-item a{
        font-size:25px;
        font-weight:250;
        text-align:center;
    }

    /* 선택 */
    select{

        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;

        color: #444;
        background-color: #fff;

        padding: 0.6em 1.4em 0.5em 0.8em;
        margin: 0;

        border: 1px solid #aaa;
        border-radius: 0.5em;
        box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
    }

    span.col-sm-4{
        font-size:20px;
        font-weight:400;
        margin-top:10px;
    }
    
    /* 버튼 */
    #ayBtn>button{
        margin:0 15px 0 15px;
    }
    
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
                            <div class="col-md-8">
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
                                                <a class="nav-link active" id="pills-video-tab ayNav" data-bs-toggle="pill" href="#pills-video" role="tab" aria-controls="pills-video" aria-selected="true">공간소개</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-plans-tab ayNav" data-bs-toggle="pill" href="#pills-plans" role="tab" aria-controls="pills-plans" aria-selected="false">시설안내</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-map-tab ayNav" data-bs-toggle="pill" href="#pills-map" role="tab" aria-controls="pills-map" aria-selected="false">이용안내</a>
                                            </li>
                                            <li class="nav-item col-sm-3">
                                                <a class="nav-link" id="pills-map-tab ayNav" data-bs-toggle="pill" href="#pills-map" role="tab" aria-controls="pills-map" aria-selected="false">Q&A</a>
                                            </li>
                                            </ul>
                                            <div class="tab-content" id="pills-tabContent">
                                            <div class="tab-pane fade show active" id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab">
                                                <iframe src="https://player.vimeo.com/video/73221098" width="100%" height="460" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                            </div>
                                            <div class="tab-pane fade" id="pills-plans" role="tabpanel" aria-labelledby="pills-plans-tab">
                                                <img src="assets/img/plan2.jpg" alt="" class="img-fluid">
                                            </div>
                                            <div class="tab-pane fade" id="pills-map" role="tabpanel" aria-labelledby="pills-map-tab">
                                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.1422937950147!2d-73.98731968482413!3d40.75889497932681!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25855c6480299%3A0x55194ec5a1ae072e!2sTimes+Square!5e0!3m2!1ses-419!2sve!4v1510329142834" width="100%" height="460" frameborder="0" style="border:0" allowfullscreen></iframe>
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
                                        	<option>
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
                                        	<option><%= i %>:00</option>
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
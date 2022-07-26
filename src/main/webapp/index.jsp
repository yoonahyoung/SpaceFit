<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.3.0/swiper-bundle.min.css"/>
<style>
	 #logo-area{
        position:relative; height:800px;
        /* 2 */
        /* width: 690px; height: 800px;
        line-height: 800px;
        text-align: center; */        
        /* 3 */
        /* height: 800px; */
    	}
    /* #logoarea:after{display:inline-block; height:100%; content:""; vertical-align:middle;} */
    #logo-area img{
        position:absolute; top:50%; transform:translateY(-50%) translateX(-50%);
        /* vertical-align: middle; */
        /* line-height:800px; */
       
    	}
    
     body{
            color:  #0D6EFD;
        }
        .card-body {
            box-shadow : 0px 0px 12px rgb(13, 109, 253, 0.7);
            border-radius: 15px;
            width: 90%;
        }
        
	/*---------- intro section -----------*/
	.swiper-slide{
		flex-shrink:0;
		width:100%;
		height:100%;
		position:relative;
		transition-property:transform
		}
	/* -------------- space section ----------------- */
	  .col-md-4 .card-box-d{
	    height:100%;
	  }
	  .img-d.img-fluid{
	    object-fit:contain;
	  }
	  .card-overlay.card-overlay-hover{
	    height:100%;
	  }
	  .intro.intro-carousel.swiper.position-relative{
	  	margin-top:-200px;
	  }
	  .card-body-d *{
	    color:skyblue;
	  }
      .link-two{
      	text-decoration:none;
      	color:white;
      }	
      .intro-subtitle.intro-price a{
    	text-decoration:none;
      }
  
</style>
</head>
<body>
	<%@ include file="views/user/common/userMenubar.jsp" %>
	
	<!-- ======= Intro Section ======= -->
  <div class="intro intro-carousel swiper position-relative">

    <div class="swiper-wrapper">
      <div class="swiper-slide carousel-item-a intro-item bg-image img1" style="background-image: url(resources/admin/space_upfiles/studio/main2.jpg)">
      <a href=""></a>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image img2" style="background-image: url(resources/admin/space_upfiles/studio/main3.jpg)">
      <a href=""></a>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image img3" style="background-image: url(resources/admin/space_upfiles/studio/main1.jpg)">
      <a href=""></a>
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </div><!-- End Intro Section -->

  <main id="main">


    <!-- ======= space Section1 ======= -->
    <section class="section-agents section-t8">
    <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
            </div>
          </div>
        </div>
        <div class="row" id="mainSp1">
        <!-- 공간이 들어올 자리 -->
       </div>
      </div>
    </section><!-- End Space Section -->

    <!-- ======= space Section2 ======= -->
    <section class="section-agents section-t8 section-t8-2">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
            </div>
          </div>
        </div>
        <div class="row" id="mainSp2">
       
        </div>
      </div>
    </section>
    <!-- End Space Section -->
	 <script>
          	$(function(){
          		$.ajax({
          			url:"<%=contextPath%>/list.in",
          			success:function(list){
          				let contextPath = "<%=contextPath%>";
          				let sp1 = ""; // 공간뿌려주는 변수
          				let sp2 = "";
          				
          				for(let i=3; i<6; i++){ // 위에 3개짜리 한줄
          				   sp1 += "<div class='col-md-4'>"
          					   + 	"<div class='card-box-d'>"
          					   +		"<div class='card-img-d'>"
          					   + 			"<img src='" + contextPath + "/" + list[i].spacePic + "' class='img-d img-fluid'>"
		          	           + 		"</div>"
		          	           +		"<div class='card-overlay card-overlay-hover'>"
		          	           +			"<div class='card-header-d'>"
		          	           + 				"<div class='card-title-d align-self-center'>"
		          	           +					"<h3 class='title-d'>"
		          	           + 						"<a href='" + contextPath + "/detail.sp?no=" + list[i].spaceNo + "' class='link-two'>" + list[i].spaceName + "<br></a>"
		          	           + 					"</h3>"
		          	           +				"</div>"
		          	           +			"</div>"
		          	           +		"<div class='card-body-d'>"
		          	           +	"<div class='info-agents color-a'>"
		          	           + "<p>"
		          	           + 	"<strong> 최대 인원 : <span>" + list[i].spaceLimit +"</span>명 </strong>"
		          	           + "</p>"
		          	           + " </div></div></div></div></div>"
          				}
          				for(let i=6; i<9; i++){ // 밑에 3개짜리 한줄
           				   sp2 += "<div class='col-md-4'>"
           					   + 	"<div class='card-box-d'>"
           					   +		"<div class='card-img-d'>"
           					   + 			"<img src='" + contextPath + "/" + list[i].spacePic + "' class='img-d img-fluid'>"
 		          	           + 		"</div>"
 		          	           +		"<div class='card-overlay card-overlay-hover'>"
 		          	           +			"<div class='card-header-d'>"
 		          	           + 				"<div class='card-title-d align-self-center'>"
 		          	           +					"<h3 class='title-d'>"
 		          	           + 						"<a href='" + contextPath + "/detail.sp?no=" + list[i].spaceNo + "' class='link-two'>" + list[i].spaceName + "<br></a>"
 		          	           + 					"</h3>"
 		          	           +				"</div>"
 		          	           +			"</div>"
 		          	           +		"<div class='card-body-d'>"
 		          	           +	"<div class='info-agents color-a'>"
 		          	           + "<p>"
 		          	           + 	"<strong> 최대 인원 : <span>" + list[i].spaceLimit +"</span>명 </strong>"
 		          	           + "</p>"
 		          	           + " </div></div></div></div></div>"
           				}
          				$("#mainSp1").html(sp1);
          				$("#mainSp2").html(sp2);
          			}
          		})
          	})
          	
          	$(function(){
          		
          		$.ajax({
          			url:"<%=contextPath%>/spacefitBanner.co",
          			success:function(img){
          				
          				if(img == null){
							console.log("조회결과없음");
						}else{
							
							let img1 = "url(" + img[0] + ")";
							let img2 = "url(" + img[1] + ")";
							let img3 = "url(" + img[2] + ")";
							
							$(".img1").css("background-image", img1);
							$(".img2").css("background-image", img2);
							$(".img3").css("background-image", img3);
							
						}
          				
					}, // success function end
					error:function(){
						console.log("ajax 통신 실패");
					}
				})
          				
          	})
          </script>
   

    <!-- ======= Review Section ======= -->
    <section class="section-testimonials section-t8 nav-arrow-a">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
              <div class="title-box">
                <h2 class="title-a">REVIEW ZONE</h2>
              </div>
            </div>
          </div>
        </div>

        <div id="testimonial-carousel" class="swiper">
          <div class="swiper-wrapper">

            <div class="carousel-item-a swiper-slide">
              <div class="testimonials-box">
                <div class="row">
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-img">
                      <img src="resources/admin/space_upfiles/party/loof1_4.jpg" alt="" class="img-fluid">
                    </div>
                  </div>
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-ico">
                      <i class="bi bi-chat-quote-fill"></i>
                    </div>
                    <div class="testimonials-content">
                      <p class="testimonial-text">
                        워크샵 장소로 회사 근처 단독 공간을 찾다가 예약하게 되었는데 무엇보다 위치와 루프탑 공간이 좋았어요! 실내 공간도 함께 이용할 수 있었고 요즘같은 날 따뜻할 때 야외에서 프라이빗한 모임 장소를 찾는 분들께 적극 추천합니다.
                      </p>
                    </div>
                    <div class="testimonial-author-box">
                      <img src="assets/img/mini-testimonial-1.jpg" alt="" class="testimonial-avatar">
                      <h5 class="testimonial-author">Albert & Erika</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End carousel item -->

            <div class="carousel-item-a swiper-slide">
              <div class="testimonials-box">
                <div class="row">
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-img">
                      <img src="resources/admin/space_upfiles/party/party1_2.jpg" alt="" class="img-fluid">
                    </div>
                  </div>
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-ico">
                      <i class="bi bi-chat-quote-fill"></i>
                    </div>
                    <div class="testimonials-content">
                      <p class="testimonial-text">
                      생일파티겸 겸사겸사 파티룸 예약했는데 공간도 넓고 테이블도 컸고, 특히 소파가 있어서 편하게 쉴 수 있었어요. 저희 들어가기 전에 미리 테이블 세팅도 무료로 해주셔서 감동이었어요~ 여러번 문의 들렸는데도 친절하게 말씀해주셔서 좋았어요~ 다음에 또 이용할게요♡
                      </p>
                    </div>
                    <div class="testimonial-author-box">
                      <img src="assets/img/mini-testimonial-2.jpg" alt="" class="testimonial-avatar">
                      <h5 class="testimonial-author">Pablo & Emma</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End carousel item -->

          </div>
        </div>
        <div class="testimonial-carousel-pagination carousel-pagination"></div>

      </div>
    </section><!-- End Testimonials Section -->

  </main><!-- End #main -->
	
	<%@ include file="views/user/common/userFooter.jsp" %>

</body>
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/js/main.js"></script>
</html>
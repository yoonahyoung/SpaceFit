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
	
</style>
</head>
<body>
	<%@ include file="views/user/common/userMenubar.jsp" %>
	
	<!-- ======= Intro Section ======= -->
  <div class="intro intro-carousel swiper position-relative">

    <div class="swiper-wrapper">
      <div class="swiper-slide carousel-item-a intro-item bg-image" style="background-image: url(resources/user/templates/real_estate/assets/img/slide-1.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">부가세 별도
                      <br> 78345
                    </p>
                    <h1 class="intro-title mb-4 ">
                      <span class="color-b">STUDIO </span> 
                      <br> 
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a"> 1 hour | 25,000</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image" style="background-image: url(resources/user/templates/real_estate/assets/img/slide-2.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">부가세 별도
                      <br> 78345
                    </p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b">RECODINGROOM </span> 
                      <br>
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a">1 hour | 10,000 </span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image" style="background-image: url(resources/user/templates/real_estate/assets/img/slide-2.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">부가세 별도
                      <br> 78345
                    </p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b">PartyRoom </span>
                      <br> 
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a">1 hour | 20,000 </span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </div><!-- End Intro Section -->

  <main id="main">


    <!-- ======= space Section ======= -->
    <section class="section-agents section-t8">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
              <div class="title-box">
                <h2 class="title-a">OUR SPACE</h2>
              </div>
              <div class="title-link">
                <a href="agents-grid.html">더 많은 상품보기
                  <span class="bi bi-chevron-right"></span>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/스튜디오/스튜디오2/164473698_a017e0caf9119cc47e6729799c0161ba.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Margaret Sotillo
                        <br> Escala</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                  orta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/연습실/연습실1/164109516_bf1953c1219b66cd90b5f7f5a95faaec.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Stiven Spilver
                        <br> Darw</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                    um porta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/파티룸/파티룸1/163348399_2b85d57baf573c11e9304c8e093cfb1f.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Emma Toledo
                        <br> Cascada</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                    ictum porta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Space Section -->

    <!-- ======= space Section ======= -->
    <section class="section-agents section-t8 section-t8-2">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/스튜디오/스튜디오1/studio10.jpeg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Margaret Sotillo
                        <br> Escala</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                     porta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/파티룸/파티룸2/165337647_a1e70d5c96835eaaef6592f9b8f5f894.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Stiven Spilver
                        <br> Darw</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                    orta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="../spacefit/연습실/연습실1/164109525_fe41d2807dcb628d6f2c12ec5150d31b.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">Emma Toledo
                        <br> Cascada</a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <p class="content-d color-text-a">
                    dictum porta two.
                  </p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>Phone: </strong> +54 356 945234
                    </p>
                    <p>
                      <strong>Email: </strong> agents@example.com
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Space Section -->

   

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
                      <img src="../spacefit/스튜디오/스튜디오1/studio12.jpeg" alt="" class="img-fluid">
                    </div>
                  </div>
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-ico">
                      <i class="bi bi-chat-quote-fill"></i>
                    </div>
                    <div class="testimonials-content">
                      <p class="testimonial-text">
                        이 가격에 이 공간 실화냐. 가슴이 웅장해진다.
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
                      <img src="../spacefit/파티룸/파티룸1/164402491_f3ccdd27d2000e3f9255a7e3e2c48800.jpg" alt="" class="img-fluid">
                    </div>
                  </div>
                  <div class="col-sm-12 col-md-6">
                    <div class="testimonial-ico">
                      <i class="bi bi-chat-quote-fill"></i>
                    </div>
                    <div class="testimonials-content">
                      <p class="testimonial-text">
                        나이 서른먹고 어릴적에 맥도날드에서 생일파티 한번도 안해봐서 해보고 싶었거든요. 좋은 선택이었던것 같아요. 근데 운영자님 왜 안오셨어요?
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.3.0/swiper-bundle.esm.browser.js"></script>
</body>
</html>
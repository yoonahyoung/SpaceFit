<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spaceListView</title>

  	<link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/css/util.css">
  	<link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/css/main.css">
    <link rel="icon" type="image/png" href="<%=thisPath%>/resources/user/templates/cozastore/images/icons/favicon.png"/>
  <!--===============================================================================================-->	
  	<link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/css-hamburgers/hamburgers.min.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/animsition/css/animsition.min.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/select2/select2.min.css">
  <!--===============================================================================================-->	
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/daterangepicker/daterangepicker.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/slick/slick.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/MagnificPopup/magnific-popup.css">
  <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<%=thisPath%>/resources/user/templates/cozastore/vendor/perfect-scrollbar/perfect-scrollbar.css">
  <!--===============================================================================================-->
  
  <style>
    .img-a.img-fluid{
      height:545px;
      width:450px;
    }
    .intro-single{
      margin-top:-150px;
    }
    .title-single-box{
      margin-top:-100px;
    }
    .intro-single.intro-single2{
      margin-top:0px;
      margin-bottom:-50px;
    }
    .qw-btn:hover{
      background-color:#0D6EFD;
    }
    .block2-txt-child1.flex-col-l a{
      text-decoration:none;
    }
    .block2-txt-child1.flex-col-l a:hover{
      color:#0D6EFD;
    }
    .block2-pic.hov-img0 img{
      width:307px;
      height:380px;
    }
    .flex-w.flex-sb-m.p-b-52{
      padding-bottom:10px;
    }
  </style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

  <main id="main">

    <!-- ======= Intro Single1 ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">이 달의 인기공간</h1>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row">
  
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="<%=thisPath%>/resources/admin/img/best1.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">204 Mount
                        <br /> Olive Road Two</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">rent | $ 12.000</span>
                    </div>
                    <a href="<%=contextPath%>/views/user/space/spaceDetailView.jsp" class="link-a">Click here to view
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">Area</h4>
                        <span>340m
                          <sup>2</sup>
                        </span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Beds</h4>
                        <span>2</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Baths</h4>
                        <span>4</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">204 Mount
                        <br /> Olive Road Two</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">rent | $ 12.000</span>
                    </div>
                    <a href="property-single.html" class="link-a">Click here to view
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">Area</h4>
                        <span>340m
                          <sup>2</sup>
                        </span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Beds</h4>
                        <span>2</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Baths</h4>
                        <span>4</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="<%=thisPath%>/resources/admin/img/best3.jpeg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">204 Mount
                        <br /> Olive Road Two</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">rent | $ 12.000</span>
                    </div>
                    <a href="property-single.html" class="link-a">Click here to view
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">Area</h4>
                        <span>340m
                          <sup>2</sup>
                        </span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Beds</h4>
                        <span>2</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Baths</h4>
                        <span>4</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ======= Intro Single2 ======= -->
    <section class="intro-single intro-single2">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">SPACE OVERVIEW</h1>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

<!-- 쇼핑몰시작 -->
    <div class="bg0 m-t-23 p-b-140">
      <div class="container">
        <div class="flex-w flex-sb-m p-b-52">
          <div class="flex-w flex-l-m filter-tope-group m-tb-10">
            <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
              All
            </button>
  
            <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".party">
              파티룸
            </button>
  
            <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".studio">
              스튜디오
            </button>
  
            <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".practiceRoom">
              연습실
            </button>
  
          </div>
  
        </div>
 
        
        
        <div class="row isotope-grid">
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item party">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best1.jpg" alt="IMG-PRODUCT">
  
                <a href="<%=contextPath%>/views/user/space/spaceDetailView.jsp" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Herschel supply
                  </a>
  
                  <span class="stext-105 cl3">
                    <span>20,000</span>원/시간
                  </span>
                </div>
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item studio">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best1.jpg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Only Check Trouser
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>

              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item party">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best1.jpg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Classic Trench Coat
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item practiceRoom">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Front Pocket Jumper
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item party">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Shirt in Stretch Cotton
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item party">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Pieces Metallic Printed
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item practiceRoom">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best2.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Femme T-Shirt In Stripe
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item studio">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best3.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Herschel supply 
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item studio">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best3.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Herschel supply
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
  
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item practiceRoom">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <img src="<%=thisPath%>/resources/admin/img/best3.jpeg" alt="IMG-PRODUCT">
  
                <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 qw-btn">
                  Quick View
                </a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    Square Neck Back
                  </a>
  
                  <span class="stext-105 cl3">
                    원/시간
                  </span>
                </div>
  
              </div>
            </div>
          </div>
        </div>
  
        
      </div>
    </div>
    <!-- 쇼핑몰 끝 -->


  </main><!-- End #main -->


	<%@ include file="../common/userFooter.jsp" %>

  <!-- Vendor JS Files -->
  <script src="<%=thisPath%>/resources/user/templates/cozastore/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=thisPath%>/resources/user/templates/cozastore/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="<%=thisPath%>/resources/user/templates/cozastore/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="<%=thisPath%>/resources/user/templates/cozastore/assets/js/main.js"></script>

  <!--===============================================================================================-->	
	<script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/jquery/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/animsition/js/animsition.min.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/bootstrap/js/popper.js"></script>
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/bootstrap/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/select2/select2.min.js"></script>
    <script>
      $(".js-select2").each(function(){
        $(this).select2({
          minimumResultsForSearch: 20,
          dropdownParent: $(this).next('.dropDownSelect2')
        });
      })
    </script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/daterangepicker/moment.min.js"></script>
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/daterangepicker/daterangepicker.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/slick/slick.min.js"></script>
    <script src="<%=thisPath%>/resources/user/templates/cozastore/js/slick-custom.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/parallax100/parallax100.js"></script>
    <script>
          $('.parallax100').parallax100();
    </script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <script>
      $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
              delegate: 'a', // the selector for gallery item
              type: 'image',
              gallery: {
                enabled:true
              },
              mainClass: 'mfp-fade'
          });
      });
    </script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/isotope/isotope.pkgd.min.js"></script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/sweetalert/sweetalert.min.js"></script>
    <script>
      $('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
        e.preventDefault();
      });
  
      $('.js-addwish-b2').each(function(){
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function(){
          swal(nameProduct, "is added to wishlist !", "success");
  
          $(this).addClass('js-addedwish-b2');
          $(this).off('click');
        });
      });
  
      $('.js-addwish-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
  
        $(this).on('click', function(){
          swal(nameProduct, "is added to wishlist !", "success");
  
          $(this).addClass('js-addedwish-detail');
          $(this).off('click');
        });
      });
  
      /*---------------------------------------------*/
  
      $('.js-addcart-detail').each(function(){
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function(){
          swal(nameProduct, "is added to cart !", "success");
        });
      });
    
    </script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script>
      $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
          wheelSpeed: 1,
          scrollingThreshold: 1000,
          wheelPropagation: false,
        });
  
        $(window).on('resize', function(){
          ps.update();
        })
      });
    </script>
  <!--===============================================================================================-->
    <script src="<%=thisPath%>/resources/user/templates/cozastore/js/main.js"></script>


</body>

</body>
</html>
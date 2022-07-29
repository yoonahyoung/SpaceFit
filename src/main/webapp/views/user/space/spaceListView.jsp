<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.product.model.vo.*"%>
<%
	String thisPath = request.getContextPath();
	ArrayList<Space> list = (ArrayList<Space>)request.getAttribute("list");
	ArrayList<Space> topList = (ArrayList<Space>)request.getAttribute("topList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spaceListView</title>

<!-- css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/space.css">

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
  
  		  <%for(Space s : topList){ %>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
              	<a href="<%=thisPath%>/detail.sp">
	                <img src="<%=thisPath%>/<%=s.getSpacePic() %>" alt="" class="img-a img-fluid">
              	</a>
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="<%=thisPath%>/detail.sp?no=<%=s.getSpaceNo()%>"><%= s.getSpaceName() %></a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a"> 1시간 | <%= s.getSpacePrice() %>원</span>
                    </div>
                    <a href="<%=thisPath%>/detail.sp?no=<%=s.getSpaceNo()%>" class="link-a">Click here to view
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">수용인원</h4>
                        <span><%=s.getSpaceLimit() %></span>
                      </li>
                      <li>
                        <h4 class="card-info-title">분류</h4>
                        <span><%=s.getSpaceCategory() %></span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
		  <%} %>
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
  
            <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".practice">
              연습실
            </button>
  
          </div>
  
        </div>
 
        
        
        <div class="row isotope-grid">
  
       	<%for(int i=0; i<list.size(); i++){ %>
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item <%=list.get(i).getSpaceCategory()%>">
            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
              	<a href="<%=thisPath%>/detail.sp?no=<%=list.get(i).getSpaceNo()%>">              	
	                <img src="<%=thisPath%>/<%= list.get(i).getSpacePic() %>" alt="IMG-PRODUCT">
              	</a>
              </div>
  
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="<%=thisPath%>/detail.sp?no=<%=list.get(i).getSpaceNo()%>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                    <%= list.get(i).getSpaceName() %>
                  </a>
  
                  <span class="stext-105 cl3">
                    <span><%= list.get(i).getSpacePrice() %></span>원/시간
                  </span>
                </div>
              </div>
            </div>
          </div>
          <%} %>
  
        </div>
  
        
      </div>
    </div>
    <!-- 쇼핑몰 끝 -->


  </main><!-- End #main -->


	<%@ include file="../common/userFooter.jsp" %>
  <!-- 일반 js리스트 -->
  




	
<!------------------------------- bootstrap js리스트 ---------------------------------------------->

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
</html>
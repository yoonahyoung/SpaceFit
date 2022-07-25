<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spacefit.mem.model.vo.Member"%>
<% 
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 시도전 loginUser == null / 로그인 성공시 : Member객체 있음
%>   
<html>
<head>
<meta charset="UTF-8">
<title>Space Fit</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
    <!-- Favicons -->
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/img/favicon.png" rel="icon">
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
    <!-- Vendor CSS Files -->
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
    <!-- Template Main CSS File -->
    <link href="<%= contextPath %>/resources/user/templates/real_estate/assets/css/style.css" rel="stylesheet">
  
    <!-- =======================================================
    * Template Name: EstateAgency - v4.8.0
    * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
    
    <!-- 내 자바스크립트(수업용), 구글아이콘 -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  <!--cdn방식 연동-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
  
	<!-- 부트스트랩 5.1 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


  <!--Mypage CSS File -->
  <!--
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  -->
  



  <!-- =======================================================
  * Template Name: EstateAgency - v4.7.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


   <!--/ 여기있는 style css 열지마세요! collapse 마이페이지 부분인데 아주 복잡합니다! /-->
  <style>
 body{
  font-family: 'Noto Sans KR','Noto Sans KR';
  font-family: 'Poppins', 'Noto Sans KR';
}

.outer{
      color: white;
      width: 1000px;
      margin: auto;
  }

.form-control {
  color : #0D6EFD;
  border : 1px solid  #0D6EFD;
}

#searchBtn{
  color : #0D6EFD;
  border : 1px solid  #0D6EFD;
}

#searchBtn:hover{
  background-color : #0D6EFD;
  color : white;
}

.close-box-collapse{
  margin-right: -30px;
}

   /*------------------------------------------ blue header ------------------------------------------*/
.offcanvas-body {
    padding : 0;
  }

  
.offcanvas-header #logo{
  color : white;
  font-weight: 600;
  font-size: 40px;
  position: absolute;
  top:15px;
  left: 30px;

}

.offcanvas-header {
  display: grid;
  background-color : #0D6EFD;
  height: 200px;
  width: 100%;
  z-index: -1;
  color: white;
}
.btn-close{
  filter: invert(91%) sepia(92%) saturate(1%) hue-rotate(88deg) brightness(108%) contrast(99%);
  position: absolute;
  right: 30px;
  top:50px;
}

.offcanvas-header{
  justify-content: center;
  align-items: center;
}



#login-btn{
  background-color: white;
  color: #0D6EFD;
  border : none;
  padding: 10px;
  border-radius: 15px;
  box-shadow : 0px 0px 3px rgb(0, 0, 0, 0.5);
  margin-bottom : -100px;
  font-size : 15px;
}

#login-btn:hover{
  background-color:#E7F1FF;
  font-weight: bold;
}


     /*------------------------------------------ 예약 ~ 위시 ------------------------------------------*/
 .btnMypage {
  width: 35px;
  height: 5px;
  margin: 6px 0;
  background-color : #0D6EFD;
}
.iconCol{
  margin-top: -16px;
  color: black;
  font-size: 13px;
  text-decoration: none;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: 30px;

}

.iconCol:hover{
  background-color:#E7F1FF;
  color: black;
  font-size: 13px;
  text-decoration: none;
  font-weight: bold;
}

.iconRow{
    height: 80px;
}

.iconRow img{
  filter: invert(49%) sepia(57%) saturate(7494%) hue-rotate(196deg) brightness(103%) contrast(106%);
  width: 60px;
}

#icon2, #icon3 {
  width: 36px;
  margin : 12px;
}
/*------------------------------------------ welcome ------------------------------------------*/

#welcome {
  background-color:#E7F1FF;
  display: grid;
  height: 70px;
  width: 100%;
  z-index: -1;
  margin-top: 40px;
  color: #0D6EFD;
  font-weight: bold;
}

#welcome span {
  margin : auto;
}


/*------------------------------------------ 공지, 자주묻는질문 ------------------------------------------*/
* {box-sizing: border-box}



 /*------------------------------------------ footer  goToAdmin ------------------------------------------*/
.goToAdmin{
    display: grid;
    background-color : #0D6EFD;
    height: 100px;
    width: 100%;
    color: white;
    position: absolute;
    bottom: 2px ;
    text-decoration: none;
    border : none;
  }

  .goToAdmin:hover{
    font-weight: bold;
    cursor: pointer;
  }

  .goToAdmin span{
    margin: auto;
  }


     /*------------------------------------------ 메뉴바들 ------------------------------------------*/


 .accordion-button:hover{
   background-color:#E7F1FF;
 }

 
 .accordion-button::after {
	 flex-shrink: 0;
	 width: 1.25rem;
	 height: 1.25rem;
	 margin-left: auto;
	 content: "";
	 background-image: none;
	 background-repeat: no-repeat;
	 background-size: 1.25rem;
	 transition: transform .2s ease-in-out;
}


.myPageCol{
  border: none;
  background-color: white;
  
}

.myPageCol:hover{
  background-color: #EEEEEE;
}

.accordion-body {
  padding: 0px;
}

   /*------------------------------------------ 큰 회원가입------------------------------------------*/

.big-signin{
    display: grid;
    height: 230px;
    width: 100%;

}

.big-signin-btn{
  font-size: 16px;
  color:  #0D6EFD;
  box-shadow : 0px 0px 10px rgb(0, 129, 255, 0.3);
  padding : 40px 60px 40px 60px;
  border-radius: 30px;
  margin: auto;
  margin-top: 50px;
}

.big-signin-btn:hover{
  font-weight: bold;
  color:  #0D6EFD;
  box-shadow : 0px 0px 10px rgba(145, 199, 253, 0.3);
  
}

    /*------------------------------------------ blue header ------------------------------------------*/




.profile{
  border: none;
  background-color : #0D6EFD;
  color : white;
  font-size: 13px;
  
}

.profile #userIcon{
  margin-top: 80px;
  width:40px;
  filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(201deg) brightness(106%) contrast(106%);
  margin-bottom: -20px;
}

.button.profile.text{
	padding : 0px;
}

   /*------------------------------------------ 예약 ~ 위시 ------------------------------------------*/
    
   /*------------------------------------------ welcome ------------------------------------------*/

   /*------------------------------------------ 아이콘들------------------------------------------*/


	  /*------------------------------------------ footer goToAdmin ------------------------------------------*/

   /*------------------------------------------ 메뉴바들 ------------------------------------------*/
.text-brand {
  color: #000000;
  font-size: 2rem;
  font-weight: 600;
}
 </style>
</head>

<body>
		<div class="wrap">
	
	  <% if(loginUser == null) { %> 
	  <!--/ 로그인 전 마이페이지 /-->

	   <div class="box-collapse">
	    <div class="offcanvas-header">
	      <div id="logo">SPACEFIT</div>
	      <span class="close-box-collapse right-boxed bi bi-x"></span>
	      
	       <button type="button" id="login-btn"style="height: 50px; width: 220px;" onclick="loginForm();">
	         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp; | &nbsp;회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       </button>
	       <script>
		       function loginForm(){
	       		// url로 직접 jsp요청시 디렉토리 구조가 url에 노출될 수 있음 => 보안에 취약
	       		// 단순한 페이지 요청도 servlet 거쳐서 포워딩 시켜서 보여지게 할것임
	       		// 즉 이 때 url에는 서블릿 매핑값만 노출
	       		location.href="<%=contextPath%>/loginForm.me";
				}
	       </script>
	  
	    </div>
	    <div class="offcanvas-body">
	      <div class="row iconRow">
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/reserve.svg" id="icon1"><br><span>예약조회</span></a>
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/cart.svg" id="icon2"><br><span class="pp">장바구니</span></a>
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/heart.svg" id="icon3"><br><span class="pp">위시리스트</span></a>
	      </div>
	  
	      <div id="welcome">
	        <span>WELCOME!</span>
	      </div>
		
	      <div>
	
	      </div>
	      <div class="accordion accordion-flush" id="accordionFlushExample">
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingOne">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	              공지사항
	            </button>
	          </h2>
	        </div>
	
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingTwo">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	              자주묻는질문
	            </button>
	          </h2>
	        </div>
	
	      </div>
	
	      <div class="big-signin">
	        <button type="button" class="btn big-signin-btn">스페이스 클라우드의<br> 모든 혜택을 누릴 수 있도록<br> 회원가입 해 보세요!</button>
	      </div>
	        <button class="footer goToAdmin" href=""><span>관리자페이지로 이동</span></button>
	    </div>
	  
	  <% } else { %>

		<div class="box-collapse">
	    <div class="offcanvas-header">
	      <div id="logo">SPACEFIT</div>
	      <span class="close-box-collapse right-boxed bi bi-x"></span>
	      
	      <div class="container profileContainer">
	        <div class="row profile">
	          <button class="profile icon"> <img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/userIcon.svg" id="userIcon"> </button>
	          <button class="profile text"><p><br><b><%=loginUser.getMemName() %></b> 환영합니다. <br> 예약일 <b>D-7</b> 남았네요!</p> </button>
	        </div>
	      </div>
	  
	    </div>
	    <div class="offcanvas-body">
	      <div class="row iconRow">
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/reserve.svg" id="icon1"><br><span>예약조회</span></a>
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/cart.svg" id="icon2"><br><span class="pp">장바구니</span></a>
	        <a class="col iconCol" href=""><img src="<%= contextPath %>/resources/user/templates/real_estate/img/icon/heart.svg" id="icon3"><br><span class="pp">위시리스트</span></a>
	      </div>
	  
	      <div id="welcome">
	        <a href=<%=contextPath %>>로그아웃</span>
	      </div>
	  
	      <div class="accordion accordion-flush" id="accordionFlushExample">
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingOne">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	              공지사항
	            </button>
	          </h2>
	        </div>
	  
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingTwo">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	              자주묻는질문
	            </button>
	          </h2>
	        </div>
	  
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingThree">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	              1:1문의
	            </button>
	          </h2>
	        </div>
	  
	  
	        <div class="accordion-item">
	          <h2 class="accordion-header" id="flush-headingFour">
	            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
	              내글확인
	            </button>
	          </h2>
	          <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
	            <div class="accordion-body container">
	              <div class="row myPageRow">
	                <button class="col myPageCol"> 1:1 문의답변 </button>
	                <button class="col myPageCol"> 내 후기 </button>
	              </div>
	            </div>
	          </div>
	       </div>
	       </div>
	  
	       <div class="accordion-item">
	        <h2 class="accordion-header" id="flush-headingFive">
	          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
	            알림
	          </button>
	        </h2>
	        <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
	          <div class="accordion-body container">
	            <div class="row myPageRow">
	              <button class="col myPageCol"> 내 글 알림 </button>
	              <button class="col myPageCol"> 시스템 알림 </button>
	            </div>
	          </div>
	        </div>
	      </div>
	  
	      <div class="accordion-item">
	        <h2 class="accordion-header" id="flush-headingSix">
	          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
	            회원정보
	          </button>
	        </h2>
	        <button class="footer goToAdmin" href=""><span>관리자페이지로 이동</span></button>
	
	      </div>
	  	</div>
	
	  <% } %>
	 
	   
	
	
	  
	</div><!-- End cllapse section_mypage  -->
	
	  <!-- ======= Header/Navbar ======= -->
	  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top" style="height:100px">
	    <div class="container">
	      <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
	        <span></span>
	        <span></span>
	        <span></span>
	      </button>
	      
	      <a class="navbar-brand text-brand" href="index.html" style="margin-left:100px">SPACE<span class="color-b">FIT</span>
	      </a>
	      
	      <!-- search bar -->
	      <div class="container" >
	        <div class="d-flex align-items-center" style="line-height:20">
         	  <input class="form-control" type="search" placeholder="#파티룸  #연습실  #스튜디오" aria-label="Search" style="width:300px; margin-left:150px; border:0px; border-bottom: 1px solid; border-radius:0" >
         	  <button id="searchBtn" class="btn btn-outline-success flex-shrink-0" type="submit" style="margin:auto; border:0px;">검색</button>
	        </div>
	      </div>  
	
	
	      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
	        <ul class="navbar-nav" style="margin-left:200px">
	
	          <li class="nav-item">
	            <a class="nav-link active" href="index.html">HOME</a>
	          </li>
	
	
	          <li class="nav-item">
	            <a class="nav-link " href="property-grid.html">SPACE</a>
	          </li>
	
	          <li class="nav-item">
	            <a class="nav-link " href="contact.html">RESERVE</a>
	          </li>
	        </ul>
	      </div>
	
	      
	      <div class="containor">
	      <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" style="margin-left:420px; width:45px; height:45px;">
	        <span class="material-symbols-outlined" style="margin-left:-2px">
	          menu
	          </span>
	      </button>
	      
	      </div>
	    </div>
	    <span class="col-md-12 mb-2">
	      
	    </span>
	  </nav><!-- End Header/Navbar -->
</div>	  
	
<div id="header-areaSize" style="height:200px"></div>

<div class="content-outer">
		
		<!-- content내용 기입 -->
		



<div id="preloader"></div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
	<!-- Vendor JS Files -->
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="<%= contextPath %>/resources/user/templates/real_estate/assets/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
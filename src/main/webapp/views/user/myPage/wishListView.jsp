<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.3.0/swiper-bundle.min.css"/>
<style>
	/* -------------- space section ----------------- */

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
	  
	  .card-body-d .img-d{
	  	width:300px;
	  	height:200px;
	  }
      .link-two{
      	text-decoration:none;
      	color:white;
      }	
      .intro-subtitle.intro-price a{
    	text-decoration:none;
      }
      
      .card-box-d{
      	margin-bottom:50px;	
      }
      
      
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>
	
	<h2 align="center">위시리스트</h2>
	<br><br>
	
	<div class="wishWrap"  align="center">
		<div class="row" style="width:1200px;">
			<div align="right" style="margin-bottom:30px;">
				<select>
				  <option>최신찜순</option>
				  <option>오래된찜순</option>
				</select>
			</div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<%=contextPath%>/resources/admin/space_upfiles/studio/studio3_2.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d">
                    <h3 class="title-d">
                      <a href="<%=contextPath%>/views/user/space/spaceDetailView.jsp" class="link-two">스튜디오3<br></a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <div class="info-agents color-a">
                    <p>
                      <strong>촬영에 적합한 스튜디오</strong> 
                    </p>
                    <p>
                      <strong> 최대 인원 : <span>n</span>명 </strong> 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<%=contextPath%>/resources/admin/space_upfiles/studio/studio2_2.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">스튜디오2<br></a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <div class="info-agents color-a">
                    <p>
                      <strong>패브릭한 느낌의 스튜디오</strong> 
                    </p>
                    <p>
                      <strong> 최대 인원 : <span>n</span>명 </strong> 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<%=contextPath%>/resources/admin/space_upfiles/practice/prac1_1.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">연습실1<br></a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <div class="info-agents color-a">
                    <p>
                      <strong>다양한 조명 색을 조절할 수 있는 연습실 </strong> 
                    </p>
                    <p>
                      <strong> 최대 인원 : <span>n</span>명 </strong> 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<%=contextPath%>/resources/admin/space_upfiles/practice/prac1_1.jpg" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover">
                <div class="card-header-d">
                  <div class="card-title-d align-self-center">
                    <h3 class="title-d">
                      <a href="agent-single.html" class="link-two">연습실1<br></a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d">
                  <div class="info-agents color-a">
                    <p>
                      <strong>다양한 조명 색을 조절할 수 있는 연습실 </strong> 
                    </p>
                    <p>
                      <strong> 최대 인원 : <span>n</span>명 </strong> 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
	</div>

</body>
</html>
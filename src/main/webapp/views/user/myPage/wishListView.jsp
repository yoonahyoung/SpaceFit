<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/space.css">
<style>

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
      <%for(int i=0;i<=list.size();i++){%>
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



        </div>
	</div>

</body>
</html>
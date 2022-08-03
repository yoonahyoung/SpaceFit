<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.mem.model.vo.Love"%>
<%
	ArrayList<Love> list = (ArrayList<Love>)request.getAttribute("loveList");
%>
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
      <%for(Love l : list){%>
          <div class="col-md-4" style="margin: 0 0 50px 0">
            <div class="card-box-d">
              <div class="card-img-d">
                <img src="<%=contextPath%>/<%= l.getSpacePic() %>" alt="" class="img-d img-fluid">
              </div>
              <div class="card-overlay card-overlay-hover" style="line-height:100px">
                <div class="card-header-d">
                  <div class="card-title-d" style="height:100px; margin-top:50px">
                    <h3 class="title-d">
                      <a href="<%=contextPath%>/list.sp?no=<%= l.getSpaceNo() %>" class="link-two"><%=l.getSpaceName() %><br></a>
                    </h3>
                  </div>
                </div>
                <div class="card-body-d" style="height:50px">
                  <div class="info-agents color-a">
                    <p>
                      <strong> 최대 인원 : <span><%=l.getSpaceLimit() %></span>명 </strong> 
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <%} %>


        </div>
	</div>

</body>
</html>
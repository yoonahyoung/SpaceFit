<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String msg = (String)session.getAttribute("alertMsg");
// 서비스 요청 전 menubar.jsp 로딩시 : null
// 서비스 성공 후 menubar.jsp 로딩시 : alert로 띄워줄 메세지 문구
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenubar</title> 
 
 <!-- 부트스트랩 4.6.1 / 4.6.2 -->
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
 
 <!-- Custom fonts for this template-->
 <link href="<%= contextPath %>/resources/admin/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link
     href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
     rel="stylesheet">
 <!-- Custom styles for this template-->
 <link href="<%= contextPath %>/resources/admin/templates/css/sb-admin-2.min.css" rel="stylesheet">

 <!-- 구글아이콘 -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 
 <!-- 구글폰트 -->
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Poppins:wght@300&display=swap" rel="stylesheet">
 
 <style>   
    body{
      font-family: 'Noto Sans KR', sans-serif;
      font-family: 'Poppins', sans-serif;
    }
    
    .btn-primary {
	  color: #fff;
	  background-color:#0D6EFD;
	  border-color: #0D6EFD;
	}
 </style>
</head>
<body id="page-top">

	<!-- alert 메세지 출력 -->
	<% if(msg != null) { %>
			<script>
				alert("<%= msg %>");
			</script>
			<% session.removeAttribute("alertMsg"); %>
		<% } %>
		
	 <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background:#0D6EFD;">

            <!--로고 클릭시 관리자메인페이지이동하게끔-->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/adminPage.ap">
                <div class="sidebar-brand-icon rotate-n-15"></div>
                <div class="sidebar-brand-text mx-3">SPACE FIT</div>
            </a>

            
            <hr class="sidebar-divider my-0">

           
            <!-- 공간관리 -->
            <li class="nav-item">
                <span class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>공간관리</span>
                </span>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                        
                        <a class="collapse-item" href="<%=contextPath%>/adList.sp">공간업데이트</a>                       
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider my-0">

            <!-- 예약관리 -->
            <li class="nav-item">
                <span class="nav-link collapsed"  data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-table"></i>                    
                    <span>예약관리</span>
                </span>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                       
                        <a class="collapse-item" href="<%=contextPath%>/views/admin/book/bookManageChart.jsp">예약통계</a>
                        <a class="collapse-item" href="">진행중인 예약리스트</a>
                        <a class="collapse-item" href="">이용완료예약리스트</a>  
                        <a class="collapse-item" href="">취소예약리스트</a>                      
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider my-0">
            
            <!-- 홈페이지관리 -->
            <li class="nav-item">
                <span class="nav-link collapsed" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">                    
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>홈페이지관리</span>
                </span>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                        
                        <a class="collapse-item" href="<%=contextPath%>/views/admin/homepage/bannerManage.jsp">배너관리</a>
                        <a class="collapse-item" href="<%=contextPath%>/views/admin/homepage/memberCharts.jsp">이용자 통계</a>
                        <a class="collapse-item" href="<%=contextPath%>/views/admin/homepage/termsManage.jsp">이용약관</a>               
                        <a class="collapse-item" href="<%=contextPath%>/adCouponList.me">쿠폰관리</a>
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider my-0">

            <!-- 고객센터관리 -->
            <li class="nav-item">
                <span class="nav-link" data-toggle="collapse" data-target="#collapsePages2"
                aria-expanded="true" aria-controls="collapsePages2">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>고객센터관리</span>
                </span>
                <div id="collapsePages2" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                        
                        <a class="collapse-item" href="<%=contextPath%>/adminList.no">공지사항</a>
                        <a class="collapse-item" href="">1:1 문의</a>                        
                    </div>
                </div>
               
            </li>

            <hr class="sidebar-divider my-0">

            <!-- 회원관리 -->
            <li class="nav-item">
                <span class="nav-link" data-toggle="collapse" data-target="#collapsePages3"
                aria-expanded="true" aria-controls="collapsePages3">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>회원관리</span>
                </span>
                <div id="collapsePages3" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">                        
                        <a class="collapse-item" href="<%=contextPath%>/memManage.me">회원정보조회</a>
                        <a class="collapse-item" href="<%=contextPath%>/memReport.me">신고</a>            
                        <a class="collapse-item" href="<%=contextPath%>/memReview.me">후기관리</a>                  
                    </div>
                </div>
            </li>

            
        </ul>
        <!-- End of Sidebar -->

        <!-- top -->
        <div id="content-wrapper" class="d-flex flex-column">
            
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="vertical-align: middle;">
                    <div style="width: 1650px" align="right">

                        <a href="<%=contextPath%>/logout.me">
                            <span class="material-symbols-outlined">
                                logout
                            </span>
                        </a>  
                        &nbsp;&nbsp;
                        <a href="<%= contextPath %>">
                            <span class="material-symbols-outlined" id="homeIcon">
                                home
                            </span>
                        </a>                                              
                    </div>                    
                </nav>

                <div id="content-area" align="center">

            <!-- Begin Page Content -->
            <!-- <div class="container-fluid"> -->
            

            <!-- Bootstrap core JavaScript--> 
            <script src="<%= contextPath %>/resources/admin/templates/vendor/jquery/jquery.min.js"></script> 
            <script src="<%= contextPath %>/resources/admin/templates/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript -->
            <script src="<%= contextPath %>/resources/admin/templates/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="<%= contextPath %>/resources/admin/templates/js/sb-admin-2.min.js"></script>
            
            <!-- 부트스트랩 -->
            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

            <!--제이쿼리-->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

                    


	
</body>
</html>
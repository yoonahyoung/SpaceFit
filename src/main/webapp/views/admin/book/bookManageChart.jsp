<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.reservation.model.vo.Book"%>
    
<%
	int thisMonth = (int)request.getAttribute("thisMonth");
	int todayCount = (int)request.getAttribute("todayCount");
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약통계</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/book.css">
<!-- chartjs -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.2/dist/chart.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="outerRvCh">
        <!-- Content Row -->
        <div class="row">

            <!-- 공간비우기용도 그리드 -->
            <div class="col-xl-2 col-md-6 mb-4"></div>

            <!-- Booking (Monthly) Card -->
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2"  align="start">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1 fontSizeBk">
                                    이번달 예약건수</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800 fontSizeBk2"><%= thisMonth %></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>      
          
            <!-- booking (today) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2" align="start">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1 fontSizeBk">
                                    오늘예약건수
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800 fontSizeBk2"><%= todayCount %></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
        <br><br>

        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">매월 예약건수</h6>
                    <div class="dropdown no-arrow">                       
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div style="width: 90%;">
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
        	const monthData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // 이렇게 미리 0으로 해놓으면 selet되지않은 월은 0으로
        </script>
        
        <% for(Book b : list){ %>                           <!-- 3월에는 2번인덱스, 7월은 6번인덱스 -->
        	<script>
        		monthData[<%=b.getBookDate().substring(0, b.getBookDate().lastIndexOf("월"))%>-1] = <%=b.getBookCount()%>;
        	</script>
        <% } %>
                              
        
        <script>
            
            const labels = [
	            'January',
	            'February',
	            'March',
	            'April',
	            'May',
	            'June',
	            'July',
	            'August',
	            'Setember',
	            'October',
	            'November',
	            'December'          
            ];       
            
        
            const data = {
                labels: labels,
                datasets: [{
	                label: '매월 예약건수',
	                backgroundColor: '#0D6EFD',
	                borderColor: '#0D6EFD',               
	               
	                data: monthData
	            }]
            };
        
            const config = {
	            type: 'line',
	            data: data,
	            options: {}
            };

            const myChart = new Chart(
	            document.getElementById('myChart'),
	            config
            );
            
        </script>
     
    </div>
    
      
</body>
</html>
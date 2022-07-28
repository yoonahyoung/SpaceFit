<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 통계</title>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-2 text-gray-800">이용자 통계</h1>
     <br><br>

     <!-- Content Row -->
     <div class="row">

         <div class="col-xl-8 col-lg-7">

             <!-- Bar Chart -->
             <div class="card shadow mb-4">
                 <div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">나이 통계</h6>
                 </div>
                 <div class="card-body">
                     <div class="chart-bar">
                         <canvas id="myBarChart"></canvas>
                     </div>
                     <hr>
                     Styling for the bar chart can be found in the
                     <code>/js/demo/chart-bar-demo.js</code> file.
                 </div>
             </div>
             
              <!-- Area Chart -->
             <div class="card shadow mb-4">
                 <div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">월별 통계</h6>
                 </div>
                 <div class="card-body">
                     <div class="chart-area">
                         <canvas id="myAreaChart"></canvas>
                     </div>
                     <hr>
                     Styling for the area chart can be found in the
                     <code>/js/demo/chart-area-demo.js</code> file.
                 </div>
             </div>

         </div>

         <!-- Donut Chart -->
         <div class="col-xl-4 col-lg-5">
             <div class="card shadow mb-4">
                 <!-- Card Header - Dropdown -->
                 <div class="card-header py-3">
                     <h6 class="m-0 font-weight-bold text-primary">성별 통계</h6>
                 </div>
                 <!-- Card Body -->
                 <div class="card-body">
                     <div class="chart-pie pt-4">
                         <canvas id="myPieChart"></canvas>
                     </div>
                     <hr>
                     Styling for the donut chart can be found in the
                     <code>/js/demo/chart-pie-demo.js</code> file.
                 </div>
             </div>
         </div>
     </div>

 	</div>
 
 	<canvas id="mem-age-chart"></canvas>
 	<script>
 	var ctx = document.getElementById("mem-age-chart");
 	var myBarChart = new Chart(ctx, {
 	  type: 'bar',
 	  data: {
 	    labels: ["January", "February", "March", "April", "May", "June"],
 	    datasets: [{
 	      label: "Revenue",
 	      backgroundColor: "#4e73df",
 	      hoverBackgroundColor: "#2e59d9",
 	      borderColor: "#4e73df",
 	      data: [4215, 5312, 6251, 7841, 9821, 14984],
 	    }],
 	  },
 	  options: {
 	    maintainAspectRatio: false,
 	    layout: {
 	      padding: {
 	        left: 10,
 	        right: 25,
 	        top: 25,
 	        bottom: 0
 	      }
 	    },
 	    scales: {
 	      xAxes: [{
 	        time: {
 	          unit: 'month'
 	        },
 	        gridLines: {
 	          display: false,
 	          drawBorder: false
 	        },
 	        ticks: {
 	          maxTicksLimit: 6
 	        },
 	        maxBarThickness: 25,
 	      }],
 	      yAxes: [{
 	        ticks: {
 	          min: 0,
 	          max: 15000,
 	          maxTicksLimit: 5,
 	          padding: 10,
 	          // Include a dollar sign in the ticks
 	          callback: function(value, index, values) {
 	            return '$' + number_format(value);
 	          }
 	        },
 	        gridLines: {
 	          color: "rgb(234, 236, 244)",
 	          zeroLineColor: "rgb(234, 236, 244)",
 	          drawBorder: false,
 	          borderDash: [2],
 	          zeroLineBorderDash: [2]
 	        }
 	      }],
 	    },
 	    legend: {
 	      display: false
 	    },
 	    tooltips: {
 	      titleMarginBottom: 10,
 	      titleFontColor: '#6e707e',
 	      titleFontSize: 14,
 	      backgroundColor: "rgb(255,255,255)",
 	      bodyFontColor: "#858796",
 	      borderColor: '#dddfeb',
 	      borderWidth: 1,
 	      xPadding: 15,
 	      yPadding: 15,
 	      displayColors: false,
 	      caretPadding: 10,
 	      callbacks: {
 	        label: function(tooltipItem, chart) {
 	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
 	          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
 	        }
 	      }
 	    },
 	  }
 	});
 	
 	</script>


</body>
</html>
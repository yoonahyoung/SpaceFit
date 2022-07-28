<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용자 통계</title>
<!-- chartjs -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.2/dist/chart.min.js"></script>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="container-fluid">

	 <br><br>
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
                 </div>
             </div>
         </div>
     </div>

 	</div>
 	
 	<br><br><br>
 
 	<script>
 	// 나이 통계 barChart
 	var ctx = document.getElementById("myBarChart");
 	var myBarChart = new Chart(ctx, {
 	  type: 'bar',
 	  data: {
 	    labels: ["10대", "20대", "30대", "40대", "50대", "60대 이상"],
 	    datasets: [{
 	      label: "예약건수",
 	      backgroundColor: "#0D6EFD",
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
 	
 	// 월별 통계 area chart
 	var ctx = document.getElementById("myAreaChart");
 	var myLineChart = new Chart(ctx, {
 	  type: 'line',
 	  data: {
 	    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
 	    datasets: [{
 	      label: "Earnings",
 	      lineTension: 0.3,
 	      backgroundColor: "rgba(78, 115, 223, 0.05)",
 	      borderColor: "#0D6EFD",
 	      pointRadius: 3,
 	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
 	      pointBorderColor: "rgba(78, 115, 223, 1)",
 	      pointHoverRadius: 3,
 	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
 	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
 	      pointHitRadius: 10,
 	      pointBorderWidth: 2,
 	      data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
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
 	          unit: 'date'
 	        },
 	        gridLines: {
 	          display: false,
 	          drawBorder: false
 	        },
 	        ticks: {
 	          maxTicksLimit: 7
 	        }
 	      }],
 	      yAxes: [{
 	        ticks: {
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
 	      backgroundColor: "rgb(255,255,255)",
 	      bodyFontColor: "#858796",
 	      titleMarginBottom: 10,
 	      titleFontColor: '#6e707e',
 	      titleFontSize: 14,
 	      borderColor: '#dddfeb',
 	      borderWidth: 1,
 	      xPadding: 15,
 	      yPadding: 15,
 	      displayColors: false,
 	      intersect: false,
 	      mode: 'index',
 	      caretPadding: 10,
 	      callbacks: {
 	        label: function(tooltipItem, chart) {
 	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
 	          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
 	        }
 	      }
 	    }
 	  }
 	});
 	
 	// 성별 통계 doughnut chart
 	var ctx = document.getElementById("myPieChart");
 	var myPieChart = new Chart(ctx, {
 	  type: 'doughnut',
 	  data: {
 	    labels: ["Direct", "Referral"],
 	    datasets: [{
 	      data: [55, 45],
 	      backgroundColor: ['#0D6EFD', 'gold'],
 	      hoverBackgroundColor: ['#2e59d9', '#17a673'],
 	      hoverBorderColor: "rgba(234, 236, 244, 1)",
 	    }],
 	  },
 	  options: {
 	    maintainAspectRatio: false,
 	    tooltips: {
 	      backgroundColor: "rgb(255,255,255)",
 	      bodyFontColor: "#858796",
 	      borderColor: '#dddfeb',
 	      borderWidth: 1,
 	      xPadding: 15,
 	      yPadding: 15,
 	      displayColors: false,
 	      caretPadding: 10,
 	    },
 	    legend: {
 	      display: false
 	    },
 	    cutoutPercentage: 80,
 	  },
 	});

 	
 	</script>


</body>
</html>
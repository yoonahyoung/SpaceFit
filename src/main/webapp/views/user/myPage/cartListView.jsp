<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shoping Cart</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

	#div-mem-cart button{
		border-radius: 20px;
		width:140px
		}

	#cart-radio1, #cart-radio2{
		margin-left:85px
	}

	#cart-div-span span{
		font-size:26px;
		font-weight: 600;
	}

</style>
</head>
<body class="animsition">

	<%@ include file="../common/userMenubar.jsp" %>
	
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%= contextPath %>/resources/user/templates/cozastore/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/user/templates/cozastore/css/main.css">
<!--===============================================================================================-->

	<h2 align="center">장바구니</h2>
		

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">space</th>
									<th class="column-2"></th>
									<th class="column-3" >Price</th>
									<th class="column-4" style="text-align:center;">Quantity</th>
									<th class="column-5">select</th>
								</tr>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">파티룸 C</td>
									<td class="column-3">86,000원</td>
									<td class="column-4" style="text-align:center;">1</td>
									<td class="column-5"><input type="radio" id="cart-radio1"></td>
								</tr>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="images/item-cart-05.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">연주실 A</td>
									<td class="column-3">78,000원</td>
									<td class="column-4" style="text-align:center;">1</td>
									<td class="column-5"><input type="radio" id="cart-radio2"></td>
								</tr>
							</table>
						</div>

						<div class="bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm" align="center" id="div-mem-cart">
							<br>
							<button type="button" class="btn btn-secondary"  id="mem-cart-btn1">전체삭제</button>&nbsp;&nbsp;
          					<button type="button" class="btn btn-primary">옵션/수량 변경</button>
							<br><br>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<!-- <br> -->
						<h4 class="mtext-109 cl2 p-b-30">
							space Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							
						</div>

						<br>
						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Options:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<div class="stext-111 cl6 p-t-2">
									<p><b>파티룸 C</b></p>
									<p>2022.07.07(일) 12시~16시</p>
									<p>이용인원 5명</p>
									<p>주차 이용</p>
									<p>앰프 1대 이용</p>
								
								</div>
								
								
							</div>
						</div>
						<br>
						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Options:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<div class="stext-111 cl6 p-t-2">
									<p><b>연습실 A</b></p>
									<p>2022.07.07(일) 12시~16시</p>
									<p>이용인원 5명</p>
									<p>주차 이용</p>
									<p>앰프 1대 이용</p>
								
								</div>
								
								
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									98,000원
								</span>
							</div>
						</div>

						<div align="center">
							<button class="btn btn-primary" style="border-radius:20px; width:130px">
								주문하기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
		
	<div id="cart-div-span">
		<div>
			<span style="margin-left:160px">회원님이</span>&nbsp;
			<span style="color:#0D6EFD;">최근 본 상품</span>
			<p align="center" style="margin-top:100px; margin-bottom:100px;">최근 본 상품이 없습니다.</p>
			
		</div>
		<br>
		<div>
			<span style="color:#0D6EFD; margin-left:160px;">파티룸</span>&nbsp;
			<span>관련된 다른 상품</span>
		</div>
	</div>
	
		




<!--===============================================================================================-->	
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/bootstrap/js/popper.js"></script>
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="<%= contextPath %>/resources/user/templates/cozastore/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="<%= contextPath %>/resources/user/templates/cozastore/js/main.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.mem.model.vo.Cart"%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<title>보관함</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/member.css">
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

	<%
		ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	%>

	<h2 align="center">보관함</h2>
		

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
								<% for(Cart c : list) { %>
									<tr class="table_row">
										<td class="column-1">
											<div class="how-itemcart1" align="center">
												<img src="<%=contextPath%>/resources/user/img/파티룸.jpeg" alt="IMG">
											</div>
										</td>
										<td class="column-2"><%= c.getSpaceName() %></td>
										<td class="column-3"><%= c.getCartPrice() %>원</td>
										<td class="column-4" style="text-align:center;">1</td>
										<td class="column-5"><input type="radio" name="cart-radio" id="cart-radio1"></td>
									</tr>
								<% } %>

							</table>
						</div>

						<div class="bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm" align="center" id="div-mem-cart">
							<br>
							<button type="button" class="btn btn-secondary"  id="mem-cart-btn1">전체삭제</button>&nbsp;&nbsp;
          					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cartModal">옵션/수량 변경</button>
							<br><br>
						</div>
						
						<!-- 옵션/수량 변경 Modal -->
						<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <p class="modal-title" id="cartModalLabel" style="margin-left:188px; font-weight:550; font-size:22px;">옵션 변경</p>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body" style="padding:40px; color:black;">
						        <div class="d-flex align-items-start align-items-sm-center gap-4">
			                        <img
			                          src="../../../resources/user/img/파티룸.jpeg"
			                          alt="user-avatar"
			                          class="d-block rounded"
			                          height="80"
			                          width="80"
			                          id="uploadedAvatar"
			                        />
			                        <div>
									  <p style="font-size:18px; color:black;">파티룸 C</p>
			                          <p style="font-size:18px; color:crimson;">98,000원</p>
			                        </div>
		                      	</div>
		                      		<br>
		                      	<p style="font-weight:550; font-size:16px; margin-bottom:13px;">* 대여 날짜</p>
		                      	<div style="width:300px;">
					       			<input type="text" class="form-control" value="2022.07.24(일) 15~19시" style="font-size:13px;" disabled>
					       		</div><br>
					       		<p style="font-weight:550; font-size:16px; margin-bottom:13px;">* 선택 가능 옵션</p>
					       		<div>
						          <select name="" id="" style="font-family:inherit; width:300px; height:35px;">
						            <option value="">주차 이용</option>
						            <option value="">반려동물 동반</option>
						            <option value="">보면대</option>
						            <option value="">미니의자</option>
						          </select>
						        </div>
					       		<br>
					       		<p style="font-weight:550; font-size:16px; margin-bottom:13px;">* 선택된 옵션</p>
					       			<div class="cartOptionDiv">
									  	<table class="cartOptionTable" style="width:415px; height:55px;">
										  		<tr class="table_row">
										  			<td><div style="width:10px;"></div></td>
										  			<td class="column-1" style="text-align:left; width:80px;">이용인원</td>
										  			<td class="column-2">
									  					<div>
									  						<div class="d-flex cartOptionCount">
										                        <div>-</div>
										                        <div>1</div>
										                        <div>+</div>
									                      	</div>
									  					</div>
										  			</td>
										  			<td class="column-3"></td>
										  			<td class="column-4"><button type="button"><img src="../../../resources/user/img/cartDelete.png" alt="" style="width:15px; margin-left:25px;"></button></td>
										  		</tr>
									  	 </table>
									  </div>
									  
									  <div class="cartOptionDiv">
									  
									  	<table class="" style="width:415px; height:55px;">
										  		<tr class="table_row">
										  			<td><div style="width:10px;"></div></td>
										  			<td class="column-2" style="text-align:left;">주차 이용</td>
										  			<td><div style="width:25px;"></div></td>
										  			<td class="column-4"><button type="button"><img src="../../../resources/user/img/cartDelete.png" alt="" style="width:15px; margin-left:25px;"></button></td>
										  		</tr>
									  	</table>
									  	</div>
									    <!--  <div class="col">이용인원</div> 
									    <div class="col cartOptionCount">
									    	<div class="container text-center">
															  <div class="row row-cols-3">
															    <div class="col">-</div>
															    <div class="col">1</div>
															    <div class="col">+</div>
															  </div>
															</div>
									    </div>
									    <div class="col"></div>
									    <div class="col"><button type="button"><img src="../../../resources/user/img/cartDelete.png" alt="" style="width:15px; margin-left:25px;"></button></div>-->
									
									 
				       			
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
						        <button type="button" class="btn btn-primary" style="margin-right:140px;">변경하기</button>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							space Totals
						</h4>
						<div class="flex-w flex-t bor12 p-b-13"></div>

						<% for(Cart c : list) { %>
						<br>
						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Options:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<div class="stext-111 cl6 p-t-2">
									<p><b><%= c.getSpaceName() %></b></p>
									<p><%= c.getCartDate() %> <%=c.getCartIn()%>~<%=c.getCartOut()%></p>
									<p>이용인원 <%=c.getCartLimit()%>명</p>
									
									<% if( !c.getCartParking().equals("N") ) { %>
										<p>주차 이용</p>
									<% }  %>
									
									<% if( !c.getCartAnimal().equals("N") ) { %>
										<p>반려동물 동반</p>
									<% }  %>
									
									<% if( !c.getCartStand().equals("N")) { %>
										<p>보면대 사용</p>
									<% }  %>
									
									<% if( !c.getCartChair().equals("N")) { %>
										<p>미니의자 사용</p>
									<% }  %>
								
								</div>
								
								
							</div>
						</div>
						<% } %>

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
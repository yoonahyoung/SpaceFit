<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.spacefit.mem.model.vo.Cart , com.spacefit.product.model.vo.Space , com.spacefit.mem.model.vo.Mcp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
	<%
	Cart c = (Cart)request.getAttribute("quickPay");
	Space s = (Space)request.getAttribute("s");
	ArrayList<Mcp> list = (ArrayList<Mcp>)request.getAttribute("list");
	%>
<%@ include file="../common/userMenubar.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/pay.css">
<form action="insert.book" method="post">
	<input type="hidden" id="spaceNo" name="spaceNo" value="<%=s.getSpaceNo()%>">
	<input type="hidden" id="cpNo" name="cpNo" value="">
	<input type="hidden" id="beforeDiscount" name="beforeDiscount" value="<%=c.getCartPrice()%>">
	<input type="hidden" id="date" name="date" value="<%=c.getCartDate()%>">
	<input type="hidden" id="limit" name="limit" value="<%=c.getCartLimit()%>">
	<input type="hidden" id="in" name="in" value="<%=c.getCartIn()%>">
	<input type="hidden" id="out" name="out" value="<%=c.getCartOut()%>">
	<input type="hidden" id="park" name="park" value="<%=c.getCartParking()%>">
	<input type="hidden" id="animal" name="animal" value="<%=c.getCartAnimal()%>">
	<input type="hidden" id="stand" name="stand" value="<%=c.getCartStand()%>">
	<input type="hidden" id="chair" name="chair" value="<%=c.getCartChair()%>">
<div class="rvlvd">

    <div class="rvlvd-header" align="center">
        <h3>결제하기</h3>
        <hr style="width: 230px">
        
    </div>
    <div class="rvlvd-side-a">
      
      <table class="table">
         <tr>
            <th width="200" colspan="4"><h5><b>예약공간</b></h5></th>
         </tr>
         <tr>
             <td colspan="2" rowspan="2" width="200" height="200" align="center">
                 <img src="<%=contextPath%>/<%= s.getSpacePic() %>" width= "200px" height="200px" >
             </td>
             <td width="500" height="44" id="roomName"> <b><%= s.getSpaceName() %></b></td>
         </tr>
         <tr>
             <td colspan="2" id="roomDis">
                     <%= s.getSpaceInfo() %>
             </td>
 
         </tr>
         <tr>
             <td width="70" height="41">공간유형</td>
             <td colspan="3" id="roomCate"><%= s.getSpaceCategory() %></td>
 
         </tr>
         <tr>
             <td width="70" height="41">최대수용인원</td>
             <td colspan="3" id="roomMax"><%= s.getSpaceLimit() +"명" %></td>
 
         </tr>
     </table>
      <br><br>

      <table class="table">
         <tr>
            <td colspan="3"><h5><b>예약정보</b></h5></td>
         </tr>
         <tr>
            <td>예약날짜</td>
            <td class="right" colspan="2" id="rsvTime"><%= c.getCartDate() + "   "+ c.getCartIn() +"시 ~ " + c.getCartOut() + "시" %></td>
         </tr>
         <tr>
            <td>예약인원</td>
            <td class="right" colspan="2" id="rsvPnum"><%= c.getCartLimit() + "명"%></td>
         </tr>
         <tr>
            <td width="390">옵션</td>
            <td>
            주차<br>
            반려동물동반<br>
            보면대<br>
            미니의자
            </td>
            <td class="right" width="150">
                  <input type="radio" name="optionCar" id="optionCarY" value="Y" disabled>요청 &emsp;
                  <input type="radio" name="optionCar" id="optionCarN" value="N" disabled>미요청 <br>
                  <input type="radio" name="optionAnimal" id="optionAnimalY" value="Y" disabled>요청 &emsp;
                  <input type="radio" name="optionAnimal" id="optionAnimalN" value="N" disabled>미요청 <br>
                  <input type="radio" name="optionStand" id="optionStandY" value="Y" disabled>요청 &emsp;
                  <input type="radio" name="optionStand" id="optionStandN" value="N" disabled>미요청 <br>
                  <input type="radio" name="optionChair" id="optionChairY" value="Y" disabled>요청 &emsp;
                  <input type="radio" name="optionChair" id="optionChairN" value="N" disabled>미요청 <br>
            </td>
        </tr>
      </table>

      <br><br>
        <br>
        <table class="table" id="book">
         <tr>
            <td colspan="2"><h5 style="display:inline"><b>예약자정보</b></h5><h6 style="display:inline"> * 예약자 정보로 이메일이 발송됩니다. 정확한 정보인지 확인해주세요</h6></td>
         </tr>
           <tr>
              <th>예약자 *</th>    
              <td><input type="text" size="68%" id="name" name="name" readonly value="<%=loginUser.getMemName() %>" style="background-color: #EEEEEE;"></td>                        
           </tr>
           <tr>
              <th>연락처 *</th>    
              <td><input type="text" size="68%" id="phone" name="phone" class="phone" maxlength="13" value="<%= loginUser.getMemPhone() %>" placeholder="숫자만 입력해주세요" required></td>                        
           </tr>
           <tr>
              <th>이메일 *</th>    
              <td><input type="text" size="68%" id="email" name="email" value="<%= loginUser.getMemMail() %>" required placeholder="예약자 정보로 이메일이 발송됩니다. 정확한 정보인지 확인해주세요"></td>                        
           </tr>
           <tr>
              <th>사용목적 *</th>    
              <td><input type="text" size="68%" id="purpose" name="purpose" placeholder="촬영, 파티, 모임, 수업 등 공간의 사용 목적을 입력해주세요" required></td>                        
           </tr>
           <tr>
              <th>요청사항</th>    
              <td><textarea name="bookContent" id="rsvMsg" rows="10" cols="71" style="resize:none; white-space:pre;" placeholder="남기고 싶은말을 적어주세요 (최대 500자)"></textarea></td>                        
              
           </tr>

        </table>
        <br><br>





    </div>


    <div class="rvlvd-side-b">
         <table class="table">
         <tr>
            <th colspan="2"><h5><b>쿠폰적용</b></h5></th>
         </tr>
         <tr>
            <td>보유쿠폰</td>
            <td>
               <select name="" style="width: 100%; padding: 0px;" id="couponeZone">
				  <option value="0" align="center" selected>사용안함</option>
					<% for(Mcp m : list) { %>
                  <option value="<%=m.getCpDiscount()%>,<%=m.getCpNo()%>" align="center"><%= m.getCpName() +" - "+ m.getCpDiscount() + "원" %></option>
               <% } %>
              </select>
            </td>
         </tr>
        </table>
        <br><br>

      <table class="table">
         <tr>
             <th colspan="3"><h5><b>결제예정금액</b></h5></th>
         </tr>
         <tr>
             <td class="right">결제예정금액</td>
             <td colspan="2" class="right"><%=c.getCartPrice()%>원</td>
         </tr>
         <tr>
             <td class="right" width="120">-쿠폰할인</td>
             <td  colspan="2" class="right"><span id="couponePrice">0</span>원</td>
         </tr>
         <tr>
             <th class="center">TOTAL</th>
             <td colspan="2" class="right"><span id="totalPrice" name="totalPrice"><%=c.getCartPrice()%></span>원</td>
         </tr>
     </table>

      <br><br>

      <div align="center">               
         <button type="submit" class="btn btn-sm btn-primary" onclick=" return checkRequired();">결제하기</button> &nbsp;
         <button type="button" onclick="history.back();" class="btn btn-sm btn-secondary">뒤로가기</button>
      </div>
      
  </div>

<script>

      function checkRequired(){
         if($("#phone").val() == '' || $("#email").val() == '' || $("#purpose").val() == ''){
   			   	alert("필수사항을 입력해주세요!");
                  return false;
   		   }else{
               alert("결제완료되었습니다! 예약내역리스트로 이동합니다.");
               return true;
            }
      }


		$(function(){
			<% if( c.getCartParking().equals("N") ) { %>
				$("#optionCarN").attr("checked", true);
			<% }else if(c.getCartParking().equals("Y")){  %>
				$("#optionCarY").attr("checked", true);
			<% }  %>
			
			<% if( c.getCartAnimal().equals("N") ) { %>
				$("#optionAnimalN").attr("checked", true);
			<% }else if(c.getCartAnimal().equals("Y")){  %>
				$("#optionAnimalY").attr("checked", true);
			<% }  %>
		
			<% if( c.getCartStand().equals("N") ) { %>
				$("#optionStandN").attr("checked", true);
			<% }else if(c.getCartStand().equals("Y")){  %>
				$("#optionStandY").attr("checked", true);
			<% }  %>
			
			<% if( c.getCartChair().equals("N") ) { %>
				$("#optionChairN").attr("checked", true);
			<% }else if(c.getCartChair().equals("Y")){  %>
				$("#optionChairY").attr("checked", true);
			<% }  %>
			
		});

        $("#couponeZone").change(function(){
        	var string = $("#couponeZone").val()
            var strArray = string.split(',');
        	const couponePrice = strArray[0];
        	const cpNo = strArray[1];
        	
            $("#couponePrice").text(couponePrice);
            $("#totalPrice").text(<%=c.getCartPrice()%> - couponePrice);
            $("#cpNo").val(cpNo);
       })
   

</script>
</form>


</body>
</html>
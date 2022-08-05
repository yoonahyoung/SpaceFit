<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.spacefit.mem.model.vo.Mcp, 
	java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/member.css">
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>
	
	<%
		String memName = loginUser.getMemName();
		String grName = (String)request.getAttribute("grName");
		
		ArrayList<Mcp> list = (ArrayList<Mcp>)request.getAttribute("list");
		ArrayList<Mcp> cpList = (ArrayList<Mcp>)request.getAttribute("cpList");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
	%>
  <br>

    <h2 align="center">내 쿠폰 관리</h2>

    <br><br>

      <div align="center">
        <div class="card" id="cp-div-card1" style="width:600px;">
            <div class="card-body">
            	<div style="padding:15px">
		            <span style="font-size:600;"><b><%= memName %></b></span>
		            <span>회원님의 등급은</span>
		            <span style="color:#0D6EFD; font-weight: 600;"><%= grName %></span>
		            <span>입니다</span>
		        </div>
            </div>
        </div>

        <br><br>
        <p style="font-size:20px; margin:15px;">SPACEFIT 쿠폰 등록</p>
        
		<form action="<%=contextPath %>/memCouponInsert.me" method="post">
	        <div class="row mb-3" id="cpCodeDiv">
	            <div class="col-sm-10">
	              <div class="input-group">
	                <input type="text" class="form-control" id="cp-input1" placeholder="쿠폰 코드를 입력해주세요" name="cpCode" style="border-radius: 5px;"/>
	                &nbsp;&nbsp;
	                <button type="submit" class="btn btn-primary" style="border-radius:5px;">등록</button>
	              </div>
	          </div>
	        </div>
        </form>
      </div>
       <br>

      <div align="center">
       <div class="col-lg-6">
                
           <table class="table" style="text-align:center;" id="cpTable">
               <thead class="table-light">
                   <tr>
                       <th>쿠폰명</th>
                       <th>할인금액</th>
                       <th>기간</th>
                       <th>사용여부</th>
                   </tr>
               </thead>
               <tbody style="border-top-color:lightgray; border-top-width:1px;">
               
               	<% if(list.isEmpty()){ %>
                         	
               		<tr>
       					<td colspan="4" align="center">사용 가능한 쿠폰이 없습니다.</td>
   					</tr>
             
              	<% }else {%>
               
                	<% for(Mcp m : list) { %>
                    <tr>
                        <td><%= m.getCpName() %></td>
                        <td><%= m.getCpDiscount() %>원</td>
                        <td><%= m.getMcpEndDate() %>까지</td>
                        <td style="color:#0D6EFD;">
                        	<%= ( m.getMcpUse().equals("N") ) ? "미사용" : "사용" %>
                        </td>
                    </tr>
                    <% } %>
                    
                  <% } %>
               </tbody>
            </table>
               
        </div>
       </div>
   
	<!-- 쿠폰존 == 다운가능한 쿠폰 -->
  	<div id="cpZone">
		<div style="margin-top:100px;">
			<span style="margin-left:500px;">COUPON</span>&nbsp;
			<span style="color:#0D6EFD;">ZONE</span>
		</div>
    </div>
    
    <br><br>
    <div  align="center">
     <div id="cpZoneDiv" style="width:950px">
     
      <div class="row mb-5">
      
      <% if(cpList.isEmpty()){ %>
                                  	
            <p align="center">다운 가능한 쿠폰이 없습니다.</p>
						                
 	  <% }else {%>
 	  
	      <% for(Mcp mc : cpList) { %>
	        <div class="col-md-6 col-lg-4 mb-3" id="cpZoneCard">
	          <div class="card h-100" style="box-shadow: 2px 2px 10px 0px #0D6EFD;">
	            <div class="card-body">
	              <input type="hidden" value="<%= mc.getCpNo()%>">
	              <br>
	              <h4 class="card-title"><%= mc.getCpName() %></h4>
	              <br>
	              <p class="card-text" style="font-size:26px; font-weight:600; color:#0D6EFD;"><%= mc.getCpDiscount() %>원</p>
	              <span><%= sysdate %>&nbsp;~</span>
	              <label><%= mc.getCpEnrollDate() %></label>
	              <br><br>
	              <button type="button" class="btn btn-outline-primary down-btn">쿠폰 다운 받기</button>
	            </div>
	          </div>
	        </div>
		   <% } %>
		   
		<% } %>
      </div>
     </div>
	</div>
	
	<script>
	
		$(function(){
			
			$('.down-btn').on('click', function(){
				location.href='<%=contextPath%>/downCouponInsert.me?cpName=' + $(this).parent().find('h4').text()
    			 + '&cpEndDate=' + $(this).parent().find('label').text();
			})
		})
		

			
		
	</script>
	
	
	
<br><br><br>


<%@ include file="../common/userFooter.jsp" %>
  
  
</body>
</html>
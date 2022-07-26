<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰 관리</title>
<link rel="stylesheet" href="../../../resources/user/css/member.css">
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>
	

  <br>

    <h2 align="center">내 쿠폰 관리</h2>

    <br><br>

    <div >
      <div align="center">
        <div class="card" id="cp-div-card1" style="width:600px;">
            <div class="card-body">
            	<div style="padding:15px">
		            <span style="font-size:600;"><b>홍길동</b></span>
		            <span>회원님의 등급은</span>
		            <span style="color:#0D6EFD; font-weight: 600;">SILVER</span>
		            <span>입니다</span>
		        </div>
            </div>
        </div>

        <br><br>
        <p style="font-size:20px; margin:15px;">SPACEFIT 쿠폰 등록</p>
        

        <div class="row mb-3" id="cpCodeDiv">
            <div class="col-sm-10">
              <div class="input-group">
                <input type="text" class="form-control" id="cp-input1" placeholder="쿠폰 코드를 입력해주세요" style="border-radius: 5px;"/>
                &nbsp;&nbsp;
                <button class="btn btn-primary" style="border-radius:5px;">등록</button>
              </div>
          </div>
        </div>
      </div>
        <br>

        <div style="margin-left:1355px; margin-bottom:7px">
          <select name="" id="">
            <option value="">미사용</option>
            <option value="">사용</option>
          </select>
        </div>

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
                            <tr>
                                <td>sliver 등급 혜택</td>
                                <td>10000원</td>
                                <td>22.09.26까지</td>
                                <td style="color:#0D6EFD;">미사용</td>
                            </tr>
                            <tr>
                              <td>sliver 등급 혜택</td>
                              <td>10000원</td>
                              <td>22.09.26까지</td>
                              <td style="color:#0D6EFD;">미사용</td>
                          </tr>
                          <tr>
                            <td>sliver 등급 혜택</td>
                            <td>10000원</td>
                            <td>22.09.26까지</td>
                            <td style="color:#0D6EFD;">미사용</td>
                        </tr>
                           
                        </tbody>
                    </table>
               
            </div>
        </div>
   
  

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
        <div class="col-md-6 col-lg-4 mb-3" id="cpZoneCard">
          <div class="card h-100" style="box-shadow: 2px 2px 10px 0px #0D6EFD;">
            
            <div class="card-body">
              <br>
              <h4 class="card-title" >등급 혜택 쿠폰</h4>
              <br>
              <p class="card-text" style="font-size:26px; font-weight:600; color:#0D6EFD;">10000원</p>
              <p>2022.07.07~2022.09.26</p>
              <br>
              <a href="javascript:void(0)" class="btn btn-outline-primary">쿠폰 다운 받기</a>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 mb-3" id="cpZoneCard">
          <div class="card h-100" style="box-shadow: 2px 2px 10px 0px #0D6EFD;">
            
            <div class="card-body">
              <br>
              <h4 class="card-title">등급 혜택 쿠폰</h4>
              <br>
              <p class="card-text" style="font-size:26px; font-weight:600; color:#0D6EFD;">10000원</p>
              <p>2022.07.07~2022.09.26</p>
              <br>
              <a href="javascript:void(0)" class="btn btn-outline-primary">쿠폰 다운 받기</a>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 mb-3" id="cpZoneCard">
          <div class="card h-100" style="box-shadow: 2px 2px 10px 0px #0D6EFD;">
            
            <div class="card-body">
              <br>
              <h4 class="card-title">등급 혜택 쿠폰</h4>
              <br>
              <p class="card-text" style="font-size:26px; font-weight:600; color:#0D6EFD;">10000원</p>
              <p>2022.07.07~2022.09.26</p>
              <br>
              <a href="javascript:void(0)" class="btn btn-outline-primary">쿠폰 다운 받기</a>
            </div>
          </div>
        </div>
        
      
      </div>
    </div>
</div>



<%@ include file="../common/userFooter.jsp" %>
  
  
</body>
</html>
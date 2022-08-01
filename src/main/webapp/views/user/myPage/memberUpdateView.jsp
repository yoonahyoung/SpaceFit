<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
.div-member-size{
  width:450px;
}

.memUpdateCard{
	box-shadow: 2px 2px 10px 0px #0D6EFD;
	width:700px; 
	height:800px;
}

.memUpdateCard input{
	border-color:lightgray;
	color:black;
	font-size:14px;
}

#div-memberModify label{
  font-weight: 650;
      
}

#mem-input-phone{
  width:300px;

}

#memProfileModal:hover{
	cursor:pointer;
}
</style>
</head>
<body>
    

 	<%@ include file="../common/userMenubar.jsp" %>
 
 	<%
 		String memId = loginUser.getMemId();
 		String memMail = (loginUser.getMemMail() == null) ? "" : loginUser.getMemMail(); // null 가능 
 		String memName = loginUser.getMemName();
 		String memPhone = loginUser.getMemPhone();
 		String memPwd = loginUser.getMemPwd();
 		
 		String grName = (String)request.getAttribute("grName");
 		
 	%>
  
    <h2 align="center">회원정보수정</h2>
    <br><br>
    <div align="center">
       <div class="card memUpdateCard">
         <div class="card-body">
           <form action="<%=contextPath %>/memUpdate.me" method="post" id="mem-update-form">
            <br>
            <div align="center">
              <br>
                <div>
                    <img src="<%=contextPath %>/resources/user/img/user.png" alt="" style="width:100px;">
                </div>
                <div>
                    <span style="font-size:24px; font-weight: 500;"><%= memId %></span><br>
                    <span style="font-size:18px; font-weight: 550; color:dimgray">등급 : </span> 
                    <span style="font-size:20px; font-weight:600; color:#0D6EFD">&nbsp;<%= grName %></span><br><br>
                    <span style="text-decoration: underline;" id="memProfileModal" data-bs-toggle="modal" data-bs-target="#profileModal">프로필사진변경</span><br><br><br>
                </div>
             </div>

          <div id="div-memberModify">
            
            <div class="div-member-size">
              <div class="row mb-3" >
                <label class="col-sm-2 col-form-label" for="basic-default-name">내 쿠폰</label>
                <div class="col-sm-10">
                  <div style="margin-top:6px">
                  <span style="color:#0D6EFD; font-weight:550;">1장</span>
                  <a href="<%=contextPath%>/myCouponList.me"><img src="<%=contextPath %>/resources/user/img/myCoupon.png" alt="" width="20px" 
                    style="margin-left:15px; margin-right:260px; margin-bottom:2px;"></a>
                  </div>
                </div>
              </div>
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label" for="basic-default-name">이름</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" name="memName" value="<%= memName %>" readonly/>
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label" for="basic-default-name">이메일</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="basic-default-name" name="memMail" value="<%= memMail %>"/>
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label" for="basic-default-name">아이디</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" name="memId" value="<%= memId %>" readonly/>
              </div>
            </div>
            
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label" for="basic-default-name">연락처</label>
              <div class="col-sm-10">
                <div class="input-group input-group-merge">
                  <input type="text" class="form-control" aria-describedby="basic-default-email2" name="memPhone" value="<%= memPhone %>"/>
                  <button type="button" class="btn btn-outline-primary" style="font-weight:560;">다른번호 인증</button>
                </div>
            </div>
          </div>
          </div>
      
          <div>
            <label class="col-sm-2 col-form-label" for="basic-default-name">비밀번호</label>
            <a href="<%= contextPath %>/updatePwdForm.me" style="text-decoration: underline; color: black; font-weight: 500; margin-right:340px;">변경하기</a>
          </div>
          <br><br><br>
                
          <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#memUpdateModal">탈퇴하기</button>
          <button type="submit" class="btn btn-primary">수정하기</button>
  
		        </form>
		      </div>
		    </div>
			</div>
			</div>
        </div>

		<!-- 프로필사진 변경 모달창 -->
		<div class="modal" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="profileModalLabel">프로필 사진 변경</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="input-group">
                       <input type="file" class="form-control" id="inputGroupFile02" style="color:black; border-color:lightgray;"/>
                     </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-danger">사진 삭제</button>
		        <button type="button" class="btn btn-primary">사진 등록</button>
		      </div>
		    </div>
		  </div>
		</div>
			
		<!-- 회원탈퇴 모달창 -->
		<div class="modal fade" id="memUpdateModal" tabindex="-1" aria-labelledby="memUpdateModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content" align="center">
		      <div class="modal-header">
		        <p class="modal-title" id="memUpdateModalLabel" style="margin-left:188px; font-weight:550; font-size:22px;">회원 탈퇴</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form action="<%=contextPath %>/memStatusUpdate.me" method="post">
		      	<input type="hidden" name="memId" value="<%=memId%>">
		      	<input type="hidden" name="memPwd" value="<%=memPwd%>">
			      <div class="modal-body" style="margin:10px;">
			       	<span style="font-size:15px;"> SPACEFIT 탈퇴시 내 프로필, 예약내역 등의 <br> 모든 정보가 삭제되며 이후 복구가 불가능합니다.
			       	</span><br>
			       		
			       	<input type="checkbox" id="update-checkbox">
			       	<span style="color:red; font-size:13px;">위의 내용을 숙지했으며 서비스 탈퇴에 동의합니다</span><br><br>
			       		
			       	<div style="width:300px;">
			       		<input type="password" class="form-control" placeholder="비밀번호 입력" name="inputPwd" style="font-size:13px; border-color:lightgray;">
			       	</div>
			      </div>
			      <div class="modal-footer" align="center">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
			        <button type="submit" class="btn btn-primary" onclick="return memUpdate();" style="margin-right:140px;">탈퇴하기</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div> 
		
		<script>
			function memUpdate(){
				
				if( $("#update-checkbox").is(":checked") == false ){
					alert("서비스 탈퇴 동의는 필수입니다.");
					
					return false;
					
				}else if( $("input[name=inputPwd]").val() != <%= memPwd %> ){
					alert("비밀번호가 일치하지 않습니다.");
					
					return false;
				}
			}
		</script>

        <div style="height : 200px"></div>
        
        <%@ include file="../common/userFooter.jsp" %>
      

</body>
</html>
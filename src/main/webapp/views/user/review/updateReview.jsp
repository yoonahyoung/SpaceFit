<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
	page import="com.spacefit.review.model.vo.Review, java.util.ArrayList, com.spacefit.attachment.model.vo.Attachment"
%>
<%
	Review rv = (Review)request.getAttribute("rv");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list"); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/review.css">
</head>
<body>
    <%@ include file="../common/userMenubar.jsp" %>
	 <div class="outer">
        <div class="blueShadow" align="center">
            <form action="<%= contextPath %>/rupdate.rv" name="reviewInsertForm" id="myRvform" method="post"  enctype="multipart/form-data">
               
               <input type="hidden" name="reviewNo" value="<%=rv.getReviewNo() %>">                       	
               
                <br><br>
                    <h3>후기수정</h3>
                <hr style="width: 50%; color:black">               
                <br>
                <p class="blueColor">
                이용해주셔서 감사합니다. <br>
                저희 공간은 어떠셨나요?
                </p>             
                
                <table>
                    <fieldset>                       
                        <input type="radio" name="star" value="5" id="rate1">
                        <label for="rate1">★</label>
        
                        <input type="radio" name="star" value="4" id="rate2"> <!--사용자가 입력한 num == value 이 $(this).attr("checked", true);} 되게 -->
                        <label for="rate2">★</label>
        
                        <input type="radio" name="star" value="3" id="rate3">
                        <label for="rate3">★</label>
        
                        <input type="radio" name="star" value="2" id="rate4"> 
                        <label for="rate4">★</label>
        
                        <input type="radio" name="star" value="1" id="rate5">
                        <label for="rate5">★</label>                        
                    </fieldset>
                    
                    
                    <br><br>
                    
                    <tr>                        
                        <td colspan="3" id="rvContentArea">
                            <textarea id="reviewContents" name="reviewContent" maxlength="500" placeholder="수강평을 남겨주세요!! :)" rows="8" style="width: 100%" required><%= rv.getReviewContent() %></textarea>   
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="end">
                            <span class="blueColor" id="rvContentcount">0</span>
                            <span class="blueColor">/500</span> 
                        </td>
                        <script>
                            $(function(){
                                $("#reviewContents").keyup(function(){
                                    $("#rvContentcount").text($(this).val().length); 
                                })
                                
                               $(":radio").each(function(){
		         					if(<%=rv.getReviewStar() %> == $(this).val()){
		         						$(this).attr("checked", true);
         					}
         				})
                            })
                        </script>
                    </tr>
                    <tr>
                        <th></th>
                    </tr>
                    <tr class="hoverRv">  
                    	<% int i = 1; %>                      
                        <% for(Attachment at : list) { %>                          		               	                        
                        	<td>                <!-- src 기존 저장된 이미지경로-->
                            	<img id="reviewImg<%= i %>" src="<%= contextPath  %>/<%= at.getFilePath() %><%= at.getFileChangeName() %>" width="100" height="80" onclick="chooseFile(<%= i++ %>);">
                            </td>
                        <%} %>
                        <% for( int j=i; j<=3; j++){ %>
                        	<td>
                            	<img id="reviewImg<%= j %>"  width="100" height="80" onclick="chooseFile(<%= j %>);">
                        	</td>
                          <%} %>                    
                    </tr>
                </table>

                <div id="file-area" style="display: none">   <!--this : 변화가 생긴 input요소-->
                    <input type="file" name="file1" onchange="loadImg(this, 1);"  required>
                    <input type="file" name="file2" onchange="loadImg(this, 2);" >
                    <input type="file" name="file3" onchange="loadImg(this, 3);" >                   
                </div>

         		<script>            			       			
         		
                    function chooseFile(num){
                        $("input[name=file" + num + "]").click(); // name속성이 file1/file2/..이 클릭되게끔
                    }
    
                    function loadImg(inputFile, num){
                           
                        if(inputFile.files.length == 1){ // 파일선택된경우 => 파일읽어들여서 미리보기
    
                            // 파일을 읽어들일 FileReader 객체 생성
                            const reader = new FileReader();
    
                            // 파일을 읽어들이는 메소드
                            // reader.readAsDataURL(읽어들이고자하는파일); <= 파일은 inputFile.files[0]에 담겨있음
                            reader.readAsDataURL(inputFile.files[0]);                        
    
                            // 파일 읽어들이기가 완료됐을때 실행할 함수를 정의
                            reader.onload = function(e){
                                // e.target.result => 읽어들인 파일의 고유한 url
                                //console.log(e.target.result); 파일의 고유한 url이 부여되어 보여졌음 
                                switch(num){
                                    case 1: $("#reviewImg1").attr("src", e.target.result); break;
                                    case 2: $("#reviewImg2").attr("src", e.target.result); break;
                                    case 3: $("#reviewImg3").attr("src", e.target.result); break;                                    
                                }
                            }
    
                        }else{ // 파일취소됐을 경우 => 미리보기된것도 사라지게
                            switch(num){
                                    case 1: $("#reviewImg1").attr("src", null); break;
                                    case 2: $("#reviewImg2").attr("src",null); break;
                                    case 3: $("#reviewImg3").attr("src", null); break;                                   
                                }
                        }
                    }
                </script> 
               
    
                <br>
    
                <div align="center">
                    <button type="submit" class="btn btn-sm btn-primary hoverRv">수정</button> &nbsp;
                    <button type="button" class="btn btn-sm btn-danger hoverRv" data-bs-toggle="modal" data-bs-target="#deleteReview">삭제</button> &nbsp;                    
                </div>

                <br>
            </form>
            
            <!-- 후기삭제 Modal -->
		    
		    <div class="modal fade" id="deleteReview" tabindex="-1" aria-labelledby="deleteBkModalLabel" aria-hidden="true">
		        <div class="modal-dialog">
		        <div class="modal-content">
		           <div class="modal-header">                            
		           </div>           
		           <div class="modal-body" align="center">
		           	  <form action="  " method=post>  
			              <h4>해당 후기를 삭제하시겠습니까?</h4>
			                 <br>
			                 <div>
			                    <button type="submit" class="btn btn-sm btn-primary" style="width: 60px;" onclick="location.href='<%=contextPath%>/rdelete.vo?no=<%=rv.getReviewNo() %>'">네</button>
			                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" style="width: 60px;">아니오</button>
			                 </div>                       
		              </form> 
		           </div>
		           <div class="modal-footer">
		           </div>
		        </div>
		        </div>
		       
        </div>    
    
    </div>
</body>
</html>
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
            <form action="" name="reviewInsertForm" id="myRvform" method="post"  enctype="multipart/form-data">
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
        
                        <input type="radio" name="star" value="4" id="rate2" checked> <!--사용자가 입력한 num == value 이 $(this).attr("checked", true);} 되게 -->
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
                            <textarea id="reviewContents" maxlength="500" placeholder="수강평을 남겨주세요!! :)" rows="8" style="width: 100%" required><%= rv.getReviewContent() %></textarea>   
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
                            })
                        </script>
                    </tr>
                    <tr>
                        <th></th>
                    </tr>
                    <tr class="hoverRv">                        
                        <td>                <!-- src 기존 저장된 이미지경로-->
                            <img id="titleImg" src="<%= list.get(0).get %>" width="100" height="80" onclick="chooseFile(1);">
                        </td>
                        <td>
                            <img id="contentImg1" src="" width="100" height="80" onclick="chooseFile(2);">
                        </td>
                        <td>
                            <img id="contentImg2" src="" width="100" height="80" onclick="chooseFile(3);">
                        </td>                       
                    </tr>
                </table>

                <div id="file-area" style="display: none">   <!--this : 변화가 생긴 input요소-->
                    <input type="file" name="file1" onchange="loadImg(this, 1);"  required>
                    <input type="file" name="file2" onchange="loadImg(this, 2);" >
                    <input type="file" name="file3" onchange="loadImg(this, 3);" >                   
                </div>

         
                </script> -->
    
                <br>
    
                <div align="center">
                    <button type="submit" class="btn btn-sm btn-primary hoverRv">수정</button> &nbsp;
                    <button type="button" class="btn btn-sm btn-danger hoverRv">삭제</button>
                </div>

                <br>
            </form>
        </div>    
    
    </div>
</body>
</html>
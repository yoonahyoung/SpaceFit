<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bookNo = (int)request.getAttribute("bookNo");
	int memNo = (int)request.getAttribute("memNo");
	int spaceNo = (int)request.getAttribute("spaceNo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기등록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/review.css">
<style>

</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp" %>
		
	 <div class="outer">
        <div class="blueShadow" align="center">
            <form action="<%= contextPath %>/rInsert.re" name="reviewInsertForm" id="myRvform" method="post" enctype="multipart/form-data">
            	            	
            	<input type="hidden" name="bookNo" value="<%=bookNo%>">
            	<input type="hidden" name="memNo" value="<%=memNo%>">
            	<input type="hidden" name="spaceNo" value="<%=spaceNo%>">
                <br><br>
                    <h3>후기등록</h3>
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
        
                        <input type="radio" name="star" value="4" id="rate2">
                        <label for="rate2">★</label>
        
                        <input type="radio" name="star" value="3" id="rate3"><label
                            for="rate3">★</label>
        
                        <input type="radio" name="star" value="2" id="rate4">
                        <label for="rate4">★</label>
        
                        <input type="radio" name="star" value="1" id="rate5">
                        <label for="rate5">★</label>
                        
                    </fieldset>
                    <br><br>
                    <tr>                        
                        <td colspan="3" id="rvContentArea">
                            <textarea name="reviewContent" id="reviewContents" maxlength="500" placeholder="수강평을 남겨주세요!! :)" rows="8" style="width: 100%"></textarea>   
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
                        <td><img id="titleImg" width="100" height="80" onclick="chooseFile(1);"></td>
                        <td><img id="contentImg1" width="100" height="80" onclick="chooseFile(2);"></td>
                        <td><img id="contentImg2" width="100" height="80" onclick="chooseFile(3);"></td>                       
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
                        // inputFile : 현재 변화가 생긴 input type="file" 요소객체 =>변수
                        // num : 몇번째 input요소인지 구분할 값 (각 영역을 찾아서 미리보기해야되서)
    
                        // 현재!파일이 선택됐다면
                        // => inputFile.files[0]에 선택된 파일정보 담겨있음 (자바스크립트제공)
                        // => inputFile.files.length 또한 1이 될꺼임
    
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
                                    case 1: $("#titleImg").attr("src", e.target.result); break;
                                    case 2: $("#contentImg1").attr("src", e.target.result); break;
                                    case 3: $("#contentImg2").attr("src", e.target.result); break;                                    
                                }
                            }
    
                        }else{ // 파일취소됐을 경우 => 미리보기된것도 사라지게
                            switch(num){
                                    case 1: $("#titleImg").attr("src", null); break;
                                    case 2: $("#contentImg1").attr("src",null); break;
                                    case 3: $("#contentImg2").attr("src", null); break;                                   
                                }
                        }
                    }
                </script> 
    
                <br>
    
                <div align="center">
                    <button type="submit" class="btn btn-sm btn-primary hoverRv">등록하기</button>
                </div>

                <br>
            </form>
        </div>    
    
    </div>
        
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소된 예약리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/book.css">
</head>
<body>
		
	<%@ include file="../common/adminMenubar.jsp" %>

    <div class="outerRv">
       
        <br>
        <h2 align="center">취소예약내역리스트</h2>
        <br>

        <!-- 필터링 -->
        <div align="right" width="">
            <select name="" id="">
                <option value="">대여날짜</option>
                <option value="">예약번호</option>                       
            </select>
        </div>
        
        <br>

        <table align="center" class="rv-list-area table-bordered">           
            
            <thead>
                <tr>
                    <th width="50">번호</th>
                    <th width="80">공간명</th>
                    <th width="70">대여날짜</th>
                    <th width="90">체크인시간</th>
                    <th width="110">체크아웃시간</th>
                    <th width="50">인원</th>    
                    <th width="80">가격</th>
                    <th width="100">회원아이디</th>
                    <th width="80">예약자명</th>
                    <th width="110">예약자이메일</th>
                    <th width="120">예약자연락처</th>                        
                </tr>
            </thead>
            
           <tbody>
                 <!-- 취소예약내역이 없을때 -->
                <!-- <tr>
                    <td colspan="11"> 취소예약내역이 없습니다. </td>
                </tr> -->

                <!-- 취소예약내역이 있을경우 -->
                <tr>
                    <td>01</td>
                    <td>파티룸A</td>
                    <td>2022.12.06</td>
                    <td>14시</td>
                    <td>16시</td>
                    <td>5명</td>
                    <td>56000원</td>
                    <td>user01</td>
                    <td>장지미</td>
                    <td>wwlaal00051@naver.com</td>
                    <td>010-xxxx-xxxx</td>
                </tr>
                <tr>
                    <td>02</td>
                    <td>연주실B</td>
                    <td>2022.09.06</td>
                    <td>14시</td>
                    <td>18시</td>
                    <td>6명</td>
                    <td>86000원</td>
                    <td>user03</td>
                    <td>김구디</td>
                    <td>wwlaal@naver.com</td>
                    <td>010-xxxx-xxxx</td>
                </tr>
           </tbody>
        </table>
        <br><br>
        
        <div class="paging-area" align="center">    
        
            <button class="btn btn-sm btn-outline-primary">&lt;</button>        
            <button disabled class="btn btn-sm btn-outline-primary">1</button>        
            <button class="btn btn-sm btn-outline-primary">2</button> 
            <button class="btn btn-sm btn-outline-primary">3</button>    
            <button class="btn btn-sm btn-outline-primary">4</button> 
            <button class="btn btn-sm btn-outline-primary">5</button>       
            <button class="btn btn-sm btn-outline-primary">&gt;</button>
            
        </div>


    </div>
	
</body>
</html>
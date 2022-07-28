<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용완료 예약리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/admin/css/member.css">
</head>
<body>

    <%@ include file="../common/adminMenubar.jsp" %>

    <div class="container-fluid">
        <br><br><br>
        <h1 class="h3 mb-2 text-gray-800" style="color: rgb(20, 18, 18)">이용완료예약내역리스트</h1>
           <br><br><br>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                  <div class="col-lg" align="left">
                      
                  </div>
                  <div class="col-lg" align="right">
                        <select name="" id="">
                            <option value="">대여날짜</option>
                            <option value="">예약번호</option>                       
                        </select>
                  </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>공간명</th>
                                    <th>대여날짜</th>
                                    <th>체크인시간</th>
                                    <th>체크아웃시간</th>
                                    <th>인원</th>    
                                    <th>가격</th>
                                    <th>회원아이디</th>
                                    <th>예약자명</th>
                                    <th>예약자이메일</th>
                                    <th>예약자연락처</th> 
                                    <th>주차</th>     
                                    <th>동물</th>
                                    <th>의자</th>
                                    <th>보면대</th>                  
                                </tr>
                            </thead>
                            
                           <tbody>
                                 <!-- 취소예약내역이 없을때 -->
                                <!-- <tr>
                                    <td colspan="11"> 이용예약내역이 없습니다. </td>
                                </tr> -->
                
                                <!-- 이용예약내역이 있을경우 -->
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
                                    <td>Y</td>
                                    <td>N</td>
                                    <td>N</td>
                                    <td>N</td>
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
                                    <td>Y</td>
                                    <td>N</td>
                                    <td>Y</td>
                                    <td>N</td>
                                </tr>
                           </tbody>
                        </table>
                    </div>
                </div>
                <div class="paging-area" align="center">    
		        
                    <button class="btn btn-sm btn-outline-primary">&lt;</button>        
                    <button disabled class="btn btn-sm btn-outline-primary">1</button>        
                    <button class="btn btn-sm btn-outline-primary">2</button> 
                    <button class="btn btn-sm btn-outline-primary">3</button>    
                    <button class="btn btn-sm btn-outline-primary">4</button> 
                    <button class="btn btn-sm btn-outline-primary">5</button>       
                    <button class="btn btn-sm btn-outline-primary">&gt;</button>
                    
                </div>
                <div style="height : 60px"></div>
            </div>
            
        </div>

    </div>  

        <!-- /.container-fluid -->
        <br><br>        		
    
    <div style="height : 100px"></div>

</body>
</html>
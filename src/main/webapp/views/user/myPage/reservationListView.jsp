<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역리스트</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/book.css">
<!-- 구글아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
    .end-center-rv1{         
    position:absolute; top:50%; transform:translateY(-50%) translateX(550%);          
}
</style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp" %>

    <div class="container rvlv1">

        <!-- 정렬 -->
        <div class="rvlv1-header" align="center"><h3>예약내역리스트</h3></div>
       
        <div class="rvlv1-menu">
            <select name="" id="">
                <option value="">대여날짜순</option>
                <option value="">예약번호순</option>
            </select>                    
            <select name="" id="">
                <option value="">전체</option>
                <option value="">예약확정</option>
                <option value="">이용완료</option>
                <option value="">취소환불</option>
            </select>
        </div>


        <div class="rvlv1-main" align="center">
            <!-- 예약현황없을때 -->
            <!-- <div align="center" style="margin-top: 200px"> 조회된결과가 없습니다.</div> -->
            
            <!-- 예약현황있을때 -->             
                
            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                        <img src="<%= request.getContextPath() %>/resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 260px; height:200px">
                    </div>
                    <div class="col-md-6">
                    <div class="card-body vertical-center-rv1">
                        <span id="rvlv1-status" class="rounded-pill" style="background:#f196e2"><small>예약확정</small></span>
                        <br><br>
                        <h5 class="card-title">파티룸A</h5>
                        <p class="card-text">2022.05.10 10:00~19:00</p>
                        <p class="card-text"><small class="text-muted">10000원</small></p>
                    </div>
                    </div>
                    <div class="col-md-2 end-center-rv1">
                        <a href="">
                            <span class="material-symbols-outlined text-primary">
                                arrow_forward_ios
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                        <img src="<%= request.getContextPath() %>/resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 260px; height:200px">
                    </div>
                    <div class="col-md-6">
                    <div class="card-body vertical-center-rv1">
                        <span id="rvlv1-status" class="rounded-pill" style="background: #E7F1FF"><small>예약취소</small></span>
                        <br><br>
                        <h5 class="card-title">녹음실A</h5>
                        <p class="card-text">2022.05.10 10:00~19:00</p>
                        <p class="card-text"><small class="text-muted">10000원</small></p>
                    </div>
                    </div>
                    <div class="col-md-2 end-center-rv1">
                        <a href="">
                            <span class="material-symbols-outlined text-primary">
                                arrow_forward_ios
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                        <!-- 나중에 src속성값으로 공간대표이미지로 대입할것 -->
                    <img src="<%= request.getContextPath() %>/resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 260px; height:200px">
                    </div>
                    <div class="col-md-6">
                    <div class="card-body vertical-center-rv1">
                        <span id="rvlv1-status" class="rounded-pill" style="background: #e1ee32"><small>이용완료</small></span>
                        <br><br>
                        <h5 class="card-title">파티룸B</h5>
                        <p class="card-text">2022.05.10 10:00~19:00</p>
                        <p class="card-text"><small class="text-muted">10000원</small></p>
                    </div>
                    </div>
                    <div class="col-md-2 end-center-rv1">
                    <a href="">
                        <span class="material-symbols-outlined text-primary">
                            arrow_forward_ios
                        </span>
                    </a>
                    </div>
                </div>
            </div>

            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                    <img src="<%= request.getContextPath() %>/resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 260px; height:200px"> <!--img-fluid 클래스주면 이미지사진 동적으로 변함-->
                    </div>
                    <div class="col-md-6">
                    <div class="card-body vertical-center-rv1">
                        <span id="rvlv1-status" class="rounded-pill" style="background: #e1ee32"><small>이용완료</small></span>
                        <br><br>
                        <h5 class="card-title">파티룸B</h5>
                        <p class="card-text">2022.05.10 10:00~19:00</p>
                        <p class="card-text"><small class="text-muted">10000원</small></p>
                    </div>
                    </div>
                    <div class="col-md-2 end-center-rv1">
                    <a href="">
                        <span class="material-symbols-outlined text-primary">
                            arrow_forward_ios
                        </span>
                    </a>
                    </div>
                </div>
            </div>


        

        </div>

               
        <div class="rvlv1-footer" align="center">  
                        
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
        
    </div>
</body>
</html>
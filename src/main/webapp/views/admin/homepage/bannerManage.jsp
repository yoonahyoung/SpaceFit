<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 관리</title>
<style>

	.wrapBannerManage{ 
		color:black;
		width:1500px;
	}
	.ban-card-title{
		font-weight:600;
	}
	
	.card-body>*{
		float:left;
	}
	
	.ban-card{
		width:350px;
		box-shadow: 2px 2px 20px 0px #E7F1FF;
	}
	
	.ban-card-margin{
		margin-bottom:30px;
	}
</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<br><br>
	<h2 align="center" style="color:black;">배너 관리</h2>
	<br><br><br><br>
	
	<div class="wrapBannerManage">
        <div class="row">
            <div class="col-md-6 col-lg-3 ban-card-margin">
                <div class="card ban-card">
                    <img class="img-fluid" src="../../../resources/admin/img/main1.jpeg" alt="">
                    <div class="card-body">
                        <h5 class="ban-card-title">배너명 A</h5><br><br>
                        <span class="card-text"><b>등록일 : </b></span>
                        <span>&nbsp;2022.07.07</span><br>
                        <span class="card-text"><b>수정일 : </b></span>
                        <span>&nbsp;2022.07.08</span><br>
                        <span class="card-text"><b>등록URL : </b></span>
                        <span>&nbsp;링크 가져오기</span>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;게시중</b></small></span>
                        <a href="#" class="card-link float-right text-muted"><small>해당 페이지로 이동</small></a>
                    </div>
                </div>
                <br>
                <input type="checkbox">
            </div>
            <!-- End Col -->
            <div class="col-md-6 col-lg-3 ban-card-margin">
                <div class="card ban-card">
                    <img class="img-fluid" src="../../../resources/admin/img/main2.jpeg" alt="">
                    <div class="card-body">
                        <h5 class="ban-card-title">배너명 A</h5><br><br>
                        <span class="card-text"><b>등록일 : </b></span>
                        <span>&nbsp;2022.07.07</span><br>
                        <span class="card-text"><b>수정일 : </b></span>
                        <span>&nbsp;2022.07.08</span><br>
                        <span class="card-text"><b>등록URL : </b></span>
                        <span>&nbsp;링크 가져오기</span>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;게시중</b></small></span>
                        <a href="#" class="card-link float-right text-muted"><small>해당 페이지로 이동</small></a>
                    </div>
                </div>
                <br>
                <input type="checkbox">
            </div>
            <!-- End Col -->
            <div class="col-md-6 col-lg-3 ban-card-margin">
                <div class="card ban-card">
                    <img class="img-fluid" src="../../../resources/admin/img/main3.jpg" alt="">
                    <div class="card-body">
                        <h5 class="ban-card-title">배너명 A</h5><br><br>
                        <span class="card-text"><b>등록일 : </b></span>
                        <span>&nbsp;2022.07.07</span><br>
                        <span class="card-text"><b>수정일 : </b></span>
                        <span>&nbsp;2022.07.08</span><br>
                        <span class="card-text"><b>등록URL : </b></span>
                        <span>&nbsp;링크 가져오기</span>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;게시중</b></small></span>
                        <a href="#" class="card-link float-right text-muted"><small>해당 페이지로 이동</small></a>
                    </div>
                </div>
                <br>
                <input type="checkbox">
            </div>
            <!-- End Col -->
            <div class="col-md-6 col-lg-3 ban-card-margin">
                <div class="card ban-card">
                    <img class="img-fluid" src="../../../resources/admin/img/main1.jpeg" alt="">
                    <div class="card-body">
                        <h5 class="ban-card-title">배너명 A</h5><br><br>
                        <span class="card-text"><b>등록일 : </b></span>
                        <span>&nbsp;2022.07.07</span><br>
                        <span class="card-text"><b>수정일 : </b></span>
                        <span>&nbsp;2022.07.08</span><br>
                        <span class="card-text"><b>등록URL : </b></span>
                        <span>&nbsp;링크 가져오기</span>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;보류</b></small></span>
                        <a href="#" class="card-link float-right text-muted"><small>해당 페이지로 이동</small></a>
                    </div>
                </div>
                <br>
                <input type="checkbox">
            </div>
            <!-- End Col -->
            <div class="col-md-6 col-lg-3 ban-card-margin">
                <div class="card ban-card">
                    <img class="img-fluid" src="../../../resources/admin/img/main1.jpeg" alt="">
                    <div class="card-body">
                        <h5 class="ban-card-title">배너명 A</h5><br><br>
                        <span class="card-text"><b>등록일 : </b></span>
                        <span>&nbsp;2022.07.07</span><br>
                        <span class="card-text"><b>수정일 : </b></span>
                        <span>&nbsp;2022.07.08</span><br>
                        <span class="card-text"><b>등록URL : </b></span>
                        <span>&nbsp;링크 가져오기</span>
                    </div>
                    <div class="card-footer" style="background:white;">
                        <span class="card-text d-inline float-left"><small>상태 : </small></span>
                        <span class="float-left" style="color:#0D6EFD;"><small><b>&nbsp;보류</b></small></span>
                        <a href="#" class="card-link float-right text-muted"><small>해당 페이지로 이동</small></a>
                    </div>
                 
                </div>
                <br>
           		<input type="checkbox">
            </div>
            <!-- End Col -->
        </div>
        
        <div class="btnWrap">
	        <button type="button" class="btn btn-secondary" style="width:120px;">삭제하기</button>
	        <button type="button" class="btn btn-primary" style="width:120px;">수정 및 등록</button>
	    </div>
    </div>
    
    <br><br><br><br><br><br>

</body>
</html>
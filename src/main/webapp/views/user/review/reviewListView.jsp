<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기관리내역</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha512-0S+nbAYis87iX26mmj/+fWt1MmaKCv80H+Mbo+Ne7ES4I6rxswpfnC6PxmLiw33Ywj2ghbtTw0FkLbMWqh4F7Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <!--제이쿼리-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .rvlv2{
        width: 100%;
        height: 100%;         
        display: grid;
        grid-gap:10px;
        grid-template-areas: 'header header header'
                             '  .     menu     .  '
                             '  .     main     .  '
                             'footer footer footer';
        grid-template-columns: 1fr 8fr 1fr;
        grid-template-rows: 50px 1fr 8fr 50px;  
        align-items: center;          
        justify-content: center;        
    }
       
    .rvlv2-header{
        grid-area: header;
    }
   
    .rvlv2-menu{
        grid-area: menu;
        text-align: end;
        /* vertical-align: middle; */
    }
   
    .rvlv2-main{
        grid-area: main;
    }
    
    .rvlv2-footer{
        grid-area: footer;   
        margin: auto;     
    }         

    .vertical-center-rv2 {
        position:absolute; top:50%; transform:translateY(-50%);          
    }

    /* 말줄임 */
    .ellipsisRv {
    width: 300px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; 
    }

    .end-center-rv2{         
        position:absolute; top:50%; transform:translateY(-50%) translateX(500%);                           
      
    }

    .star-area-vw{
        display: inline-block;
        direction: rtl;
        border:0;
    }
    .star-area-vw input[type=radio]{
        display: none;
    }

    .star-area-vw label{
        font-size: 2em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }

    .star-area-vw label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    .star-area-vw label:hover ~label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    .star-area-vw input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }   
</style>  
</head>
<body>
    <%@ include file="../common/userMenubar.jsp"%>
      
    <div class="container rvlv2">

        <!-- 정렬 -->
        <div class="rvlv2-header" align="center"><h3>후기관리</h3></div>
                
        <div class="rvlv2-menu">            
        </div>


        <div class="rvlv2-main" align="center">
            <!-- 후기내역없을때 -->
            <!-- <div align="center" style="margin-top: 200px"> 조회된결과가 없습니다.</div> -->
            
            <!-- 후기내역있을때 -->         
                
            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                         <!-- 나중에 src속성값으로 후기대표이미지로 대입할것 -->
                        <img src="../../../resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 250px; height:200px">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body vertical-center-rv2">
                            <span id="rvlv2-status"><b>파티룸A</b></span> &nbsp;&nbsp;&nbsp;&nbsp;
                            <span><small>2022.07.22</small></span>
                            <br>                            
                            <div class="card-title star-area-vw">
                                <input type="radio" name="star" value="5" id="rate1" checked>
                                <label for="rate1">★</label>
                
                                <input type="radio" name="star" value="4" id="rate2">
                                <label for="rate2">★</label>
                
                                <input type="radio" name="star" value="3" id="rate3">
                                <label for="rate3">★</label>
                
                                <input type="radio" name="star" value="2" id="rate4">
                                <label for="rate4">★</label>
                
                                <input type="radio" name="star" value="1" id="rate5">
                                <label for="rate5">★</label>
                            </div>
                            <div class="card-text ellipsisRv"><small>사진에서 보던 이미지와 똑같아요!! 자연광도 좋고 소품이 많아서 활용하기 좋았어요</small></div>                            
                        </div>
                    </div>
                    <div class="col-md-2 end-center-rv2">
                        <a href="" class="btn btn-sm btn-primary">
                            수정
                        </a>
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteBook">삭제</button>
                    </div>
                </div>
            </div>


            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0" align="start">
                    <div class="col-md-4">
                         <!-- 나중에 src속성값으로 후기대표이미지로 대입할것 -->
                        <img src="../../../resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 250px; height:200px">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body vertical-center-rv2">
                            <span id="rvlv2-status"><b>파티룸A</b></span> &nbsp;&nbsp;&nbsp;&nbsp;
                            <span><small>2022.07.22</small></span>
                            <br>                            
                            <div class="card-title star-area-vw">
                                <input type="radio" name="star" value="5" id="rate1">
                                <label for="rate1">★</label>
                
                                <input type="radio" name="star" value="4" id="rate2" checked>
                                <label for="rate2">★</label>
                
                                <input type="radio" name="star" value="3" id="rate3">
                                <label for="rate3">★</label>
                
                                <input type="radio" name="star" value="2" id="rate4">
                                <label for="rate4">★</label>
                
                                <input type="radio" name="star" value="1" id="rate5">
                                <label for="rate5">★</label>
                            </div>
                            <div class="card-text ellipsisRv"><small>넓고 쾌적해서 친구들하고 놀기 편했어요.
                                여러 곳들을 다녀봤지만 여기가 가장 청결하네요
                                추천!! </small></div>                            
                        </div>
                    </div>
                    <div class="col-md-2 end-center-rv2">
                        <a href="" class="btn btn-sm btn-primary">
                            수정
                        </a>
                        <button type="button" class="btn btn-sm btn-secondary" data-bs-toggle="modal" data-bs-target="#deleteBook">삭제</button>
                    </div>
                </div>
            </div>
           

               
        <div class="rvlv2-footer" align="center">  
                        
            <div class="paging-area" align="center">    
        
                <button class="btn btn-sm btn-outline-primary">&lt;</button>        
                <button disabled class="btn btn-sm btn-outline-primary">1</button>        
                <button class="btn btn-sm btn-outline-primary">2</button> 
                <button class="btn btn-sm btn-outline-primary">3</button>          
                <button class="btn btn-sm btn-outline-primary">&gt;</button>
                
            </div>
        </div>
        
    </div>

    <!-- 후기삭제 Modal -->
    <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="deleteBkModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">                            
           </div>
           <div class="modal-body" align="center">
              <h4>해당 후기를 삭제하시겠습니까?</h4>
                 <br>
                 <div>
                    <button type="submit" class="btn btn-sm btn-primary" style="width: 60px;">네</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" style="width: 60px;">아니오</button>
                 </div>                       
              </form> 
           </div>
           <div class="modal-footer">
           </div>
        </div>
        </div>
     </div>
</body>
</html>
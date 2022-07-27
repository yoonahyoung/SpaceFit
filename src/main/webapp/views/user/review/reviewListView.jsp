<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기관리내역</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/user/css/review.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha512-0S+nbAYis87iX26mmj/+fWt1MmaKCv80H+Mbo+Ne7ES4I6rxswpfnC6PxmLiw33Ywj2ghbtTw0FkLbMWqh4F7Q==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
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
                        <img src="<%=contextPath%>/resources/admin/img/스튜디오/스튜디오1/studio1_1.jpeg" class="rounded-start" style="width: 250px; height:200px">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body vertical-center-rv2">
                            <span id="rvlv2-status"><b>파티룸A</b></span> &nbsp;&nbsp;&nbsp;&nbsp;
                            <span><small>2022.07.22</small></span>
                            <br>                            
                            <div class="card-title"><!--별점이 올 자리--></div>
                            
                            <div class="card-text ellipsisRv"><small>넓고 쾌적해서 친구들하고 놀기 편했어요. 여러 곳들을 다녀봤지만 여기가 가장 청결하네요 추천!! </small></div>                            
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
                        <img src="<%=contextPath%>/resources/user/img/파티룸.jpeg" class="rounded-start" style="width: 250px; height:200px">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body vertical-center-rv2">
                            <span id="rvlv2-status"><b>파티룸A</b></span> &nbsp;&nbsp;&nbsp;&nbsp;
                            <span><small>2022.07.22</small></span>
                            <br>                            
                            <div class="card-title"></div>                           
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
           
           <script>
                $(function(){                    
                    // arrayList로 갖고온다면 향상된 for문 으로 for(review r : list) 으로 해서 하나씩 접근  obj.star => r.getStar()으로 해서
                    // 아마 다르게 해야할거임 
                    const reviews = [{memNo:"1", star:5},
                                      {memNo:"2", star:3}];

                    $.each(reviews, function(index,obj){
                        var innerHtml = "";
                      
                                for(var i =0 ; i < 5; i ++) {  

                                    if( i < obj.star) { // 사용자가 입력한 별점number => star속성명 확인
                                        innerHtml  += "<span id='starYellow'>★</span>";
                                    }else{
                                        innerHtml  += "<span id='starWhite'>★</span>" ;
                                    }
                                }        
                                $(".card-title").eq(index).addClass("mydivStar"+index);
                                $(".mydivStar" + index).html(innerHtml);
                                
                    })
                  
                })
           </script>
           

               
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
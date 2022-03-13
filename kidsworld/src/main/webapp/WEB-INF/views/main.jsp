<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>키즈월드</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

.section_text{
    position: absolute;
    width: 1440px;
    height: 200px;
    bottom: 800px;
    text-align: center;
}
.section_text2{
    bottom: 750px;
}
.section_text3{
    bottom: 330px;
}
.section_text_big{
    font-size: 50px;
}
.section_text_small{
    font-size: 30px;
}


.place_text_big{
    font-size: 40px;
}
.place_text_middle{
    font-size: 27px;
    margin-top: -10px;
    padding-bottom: 25px;
}
.place_text_small{
    font-size: 20px;
}
.placeBtn{
    width: 200px;
    height: 50px;
    margin-top: 120px;
    margin-left: 140px;
    font-size: 20px;
    text-align: center;
    line-height: 40px;
    cursor: pointer;
    transition: 0.5s;
    border: 4px solid #a9a7a7;
    border-radius: 30px;
}

/*.db a:hover{*/
/*    color: #fe5c24;*/
/*    transition: 0.4s;*/
/*}*/

#left_db{
    margin-left: 100px;
    width: 550px;
    height: 300px;
}

#right_db{
    margin-right: 100px;
    width: 550px;
    height: 300px;
}


.notice_qna{
    border: 3px solid #9d9d9d;
    background-color: white;
    padding: 10px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
}
.noticeqna_wrap {
    border-collapse: collapse;
    width: 550px;
    height: 300px;
}

.noticeqnaBtn{
    background-color: #fe5c24;
    color: white;
    cursor: pointer;
    transition: 0.5s;
    padding: 5px 6px;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}
.noticeqnaBtn:hover{
    background-color: #2493e0;
}
.information_title{
    font-size: 23px;
    height: 40px;
    border: none;
}
.information_text{
    border: 2px solid #fe5c24;
    height: 45px;
    text-align: center;
}
.information_subtext{
    border: 1px solid black;
    font-size: 15px;
    height: 30px;
    text-overflow: ellipsis;
    overflow: hidden;
}
.text1{
    width: 80px;
    height: 30px;
    text-align: center;
    border-left: none;
}
.text2{
    width: 287px;
    height: 30px;
    padding-left: 10px;
}
.text3{
    width: 80px;
    height: 30px;
    text-align: center;
}
.text4{
    width: 100px;
    height: 30px;
    text-align: center;
    border-right: none;
}
.noticeqnaLink{
    color: black;
    cursor: pointer;
    transition: 0.3s;
}
.noticeqnaLink:hover{
    color: #fe5c24;
}





.eventtext1{
    font-size: 30px;
    color: #2493e0;
}
.eventtext2{
    font-size: 27px;
    color: #fe5c24;
}
.eventtext3{
    font-size: 19px;
    color: black;
}
.eventtext4{
    margin-bottom: 50px;
}
.event_btn{
    background-color: #fe5c24;
    color: white;
    font-size: 22px;
    padding: 5px 10px;
    cursor: pointer;
    transition: 0.5s;
    border: none;
    border-radius: 20px;
    margin-left: 135px;
}
.event_btn:hover{
    background-color: #2493e0;
}





#review_titletext{
    color: white;
    top: 90px;
}

#review_section{
    background-color: #0c3e72;
    height: 800px;
    bottom: 350px;
}

*{margin:0;padding:0;}
ul,li{list-style:none;}
.slide{height:300px;overflow:hidden;}
.slide ul{height:calc(100% * 3);animation:slide 12s infinite;}
.slide li{height:calc(100% / 3);}
/*.slide li:nth-child(1){background:#ffa;}*/
/*.slide li:nth-child(2){background:#faa;}*/
/*.slide li:nth-child(3){background:#afa;}*/
@keyframes slide {
    0% {margin-top:0;}
    10% {margin-top:0;}
    25% {margin-top:-300px;}
    35% {margin-top:-300px;}
    50% {margin-top:-600px;}
    60% {margin-top:-600px;}
    100% {margin-top:0;}
}

#review_wrapwrap{
    position: relative;
    width: 1000px;
    height: 300px;
    /*border: 1px solid red;*/
    border-top: 6px solid #ffffff;
    border-bottom: 6px solid #ffffff;
    border-top-style: dashed;
    border-bottom-style: dashed;
    left: 215px;
    top: 340px;
}
.review_wrap{
    position: relative;
    border-collapse: collapse;
    border: 3px solid #ff9a7b;
    width: 445px;
    height: 260px;
    float: left;
    margin: 20px 20px 20px 30px;
    background-color: white;
}

.reviewText{
    /*border: 1px solid red;*/
    margin-left: 15px;
    margin-top: 15px;
}
.review1{
    position: absolute;
    font-size: 17px;
    width: 100px;
    height: 25px;
}
.review2{
    position: absolute;
    margin-left: 320px;
    margin-top: -40px;
    font-size: 18px;
    color: #fe5c24;
    height: 25px;
}
.review3{
    position: absolute;
    margin-top: -55px;
    font-size: 20px;
    width: 300px;
    height: 25px;
    color: #626262;
}
.review4{
    position: absolute;
    width: 398px;
    height: 110px;
    font-size: 17px;
    border-radius: 10px;
    margin-top: -60px;
    border: 1px solid #2493e0;

}

#reviewBtn{
    position: absolute;
    left: 178px;
    bottom: 10px;
    padding: 3px 8px;
    background-color: #fe5c24;
    color: white;
    cursor: pointer;
    transition: 0.5s;
    border: none;
    border-radius: 10px;
}
#reviewBtn:hover{
    background-color: #2493e0;
}

#reviewBtn2{
    position: relative;
    background-color: #fe5c24;
    color: white;
    width: 200px;
    height: 40px;
    font-size: 25px;
    padding: 2px 15px;
    top: 710px;
    right: 625px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: 0.5s;
}
#reviewBtn2:hover{
    background-color: #2493e0;
}




#section_reverse{
    margin-bottom: -700px;
}
/*                      footer                  */
footer{
    top: 100px;
}


    </style>
</head>
<body>

<%----------------------------------------------------------%>
<%----------------------------헤더----------------------------%>
<%----------------------------------------------------------%>
<jsp:include page="commons/header.jsp"/>


<%----------------------------------------------------------%>
<%--------------------------메인 배너--------------------------%>
<%----------------------------------------------------------%>
<div class="wrap">
    <section class="section">
        <img src="${path}/resources/img/banner_img/banner_img1.png" class="banner_img">
        <div class="banner_plan">
            <form action="${path}/ticket/info" method="get" class="banner_box">
                <table>
                    <tr>
                        <td>
                            <div class="banner_plan_select">
                                <select class="banner_plan_selecter" name="tArea">
                                    <option value="0" selected>예약장소  ✈︎</option>
                                    <option value="벡스코">벡스코</option>
                                    <option value="킨텍스">킨덱스</option>
                                    <option value="엑스코">엑스코</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="banner_plan_select">
                                <select class="banner_plan_selecter" name="forWhen">
                                    <option value="0" selected>종류  ✈︎</option>
                                    <option value="종일권">종일권</option>
                                    <option value="오후권">오후권</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="banner_plan_select">
                                <select class="banner_plan_selecter" name="adult">
                                    <option value="0" selected>성인  ✓</option>
                                    <option value="1">1인</option>
                                    <option value="2">2인</option>
                                    <option value="3">3인</option>
                                    <option value="4">4인</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="banner_plan_select">
                                <select class="banner_plan_selecter" name="kid">
                                    <option value="0" selected>아동  ✓</option>
                                    <option value="1">1인</option>
                                    <option value="2">2인</option>
                                    <option value="3">3인</option>
                                    <option value="4">4인</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <sec:authorize access="isAuthenticated()">
                                <input type="submit" value="예매하기" class="btn_1 banner_plan_button" />
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                                <div class="banner_plan_button">
                                    <a href="${path}/user/login" class="btn_1">예매하기</a>
                                </div>
                            </sec:authorize>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
</div>




<%----------------------------------------------------------%>
<%--------------------------지점 소개--------------------------%>
<%----------------------------------------------------------%>
<section class="section">
    <div class="section_text">
        <div class="section_text_big">키즈월드 이곳저곳</div>
        <br>
        <div class="section_text_small">근처의 키즈월드를 찾아보세요!</div>
    </div>

    <div class="place_part">
        <figure class="place_img">
            <img src="${path}/resources/img/place_img/place_img1.png" id="bexco"/>
            <figcaption>
                <h3 class="place_text_big">부산 벡스코</h3>
                <h4 class="place_text_middle">Busan Bexco</h4>
                <span class="place_text_small">부산 해운대구 APEC로 30</span>
                <div class="placeBtn">상 세 보 기</div>
            </figcaption>
            <a href="${path}/bexco"></a>
        </figure>
        <figure class="place_img">
            <img src="${path}/resources/img/place_img/place_img2.png" id="kintex"/>
            <figcaption>
                <h3 class="place_text_big">경기 킨텍스</h3>
                <h4 class="place_text_middle">Gyeonggi-do Kintex</h4>
                <span class="place_text_small">경기 고양시 일산서구 킨텍로 217-60</span>
                <div class="placeBtn">상 세 보 기</div>
            </figcaption>
            <a href="${path}/kintex"></a>
        </figure>
        <figure class="place_img">
            <img src="${path}/resources/img/place_img/place_img3.png" id="exco"/>
            <figcaption>
                <h3 class="place_text_big">대구 엑스코</h3>
                <h4 class="place_text_middle">Daegu Exco</h4>
                <span class="place_text_small">대구 북구 엑스코로 10</span>
                <div class="placeBtn">상 세 보 기</div>
            </figcaption>
            <a href="${path}/exco"></a>
        </figure>
        <figure class="place_img">
            <img src="${path}/resources/img/place_img/place_img4.png" id="kdj"/>
            <figcaption>
                <h3 class="place_text_big">광주 김대중컨벤션센터</h3>
                <h4 class="place_text_middle">Gwanju KDJcenter</h4>
                <span class="place_text_small">광주 서구 상무누리로 30 김대중컨벤션센터</span>
                <div class="placeBtn">준비중입니다</div>
            </figcaption>
            <a href="#"></a>
        </figure>
    </div>
</section>



<%----------------------------------------------------------%>
<%---------------------------이벤트---------------------------%>
<%----------------------------------------------------------%>
<section class="section">
    <div class="section_text section_text2">
        <div class="section_text_big">이 벤 트</div>
        <br>
        <div class="section_text_small">다양한 이벤트 소식을 놓치지 마세요!</div>
    </div>

    <div id="wrapper">
        <div id="slider-wrap">
            <ul id="slider">
                <li>
                    <div class="event_content_wrap_ver1">
                        <div class="event_slider_content">
                            <h5 class="event_doing eventtext1">진행중인 이벤트</h5>
                            <h2 class="event_title eventtext2">인기 캐릭터 콜라보레이션-1!</h2>
                            <p class="event_text eventtext3">최고 인기 캐릭터들로 뭉쳤다! 다양한 캐릭터 상품부터 신나는 놀거리가 가득한 세계를 알아보고, 주말을 맞아 아이들에게 잊지 못할 추억을 선물하세요!</p>
                            <p class="event_imformation">행사기간: <span>2022.02.01 부터 2022.03.01 까지</span> </p>
                            <p class="event_imformation">행사장소: <span>대구 엑스코점</span> </p>
                            <p class="event_imformation eventtext4">주최사: <span> Ssangsang Company</span> </p>
                            <a class="btn_1 event_btn" href="${path}/event">자세히 보기</a>
                        </div>
                    </div>
                    <img src="${path}/resources/img/event_img/eventbg_1.png" alt=""/>
                </li>

                <li>
                    <div class="event_content_wrap_ver2">
                        <div class="event_slider_content">
                            <h5 class="event_doing eventtext1">진행중인 이벤트</h5>
                            <h2 class="event_title eventtext2">인기 캐릭터 콜라보레이션-2!</h2>
                            <p class="event_text eventtext3">최고 인기 캐릭터들로 뭉쳤다! 다양한 캐릭터 상품부터 신나는 놀거리가 가득한 세계를 알아보고, 주말을 맞아 아이들에게 잊지 못할 추억을 선물하세요!</p>
                            <p class="event_imformation">행사기간: <span>12 Aug 2019</span> </p>
                            <p class="event_imformation">행사장소: <span>부산 벡스코점</span> </p>
                            <p class="event_imformation eventtext4">주최사: <span> Animation Agency</span> </p>
                            <a class="btn_1 event_btn" href="${path}/event">자세히 보기</a>
                        </div>
                    </div>
                    <img src="${path}/resources/img/event_img/eventbg_2.png" alt=""/>
                </li>

                <li>
                    <div class="event_content_wrap_ver1">
                        <div class="event_slider_content">
                            <h5 class="event_doing eventtext1">진행중인 이벤트</h5>
                            <h2 class="event_title eventtext2">인기 캐릭터 콜라보레이션-3!</h2>
                            <p class="event_text eventtext3">최고 인기 캐릭터들로 뭉쳤다! 다양한 캐릭터 상품부터 신나는 놀거리가 가득한 세계를 알아보고, 주말을 맞아 아이들에게 잊지 못할 추억을 선물하세요!</p>
                            <p class="event_imformation">행사일자: <span>2022.03.01 부터 2022.03.15 까지</span> </p>
                            <p class="event_imformation">행사장소: <span>경기 킨텐스점</span> </p>
                            <p class="event_imformation eventtext4">주최사: <span> Pinkpong Company</span> </p>
                            <a class="btn_1 event_btn" href="${path}/event">자세히 보기</a>
                        </div>
                    </div>
                    <img src="${path}/resources/img/event_img/eventbg_3.png" alt=""/>
                </li>
            </ul>

            <!--controls-->
            <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
            <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
            <div id="counter"></div>

            <div id="pagination-wrap">
                <ul>
                </ul>
            </div>
            <!--controls-->
        </div>
    </div>
</section>



<%----------------------------------------------------------%>
<%--------------------------DB 연동--------------------------%>
<%----------------------------------------------------------%>
<section class="section">
    <div class="section_text section_text3">
        <div class="section_text_big">공지사항 & QnA</div>
        <br>
        <div class="section_text_small">다양한 소식을 알아보고 궁금증을 해결하세요!</div>
    </div>


    <div class="db notice_qna" id="left_db">
        <table class="noticeqna_wrap" style="table-layout: fixed;">
            <tr>
                <td class="information_title" colspan="4"><a class="noticeqnaBtn" href="${path}/community/notice">공 지 사 항 +</a></td>
            </tr>
            <tr>
                <td class="information_text">카 테 고 리</td>
                <td class="information_text" colspan="3">제 목</td>
                <td class="information_text">작 성 자</td>
                <td class="information_text">작 성 날 짜</td>
            </tr>
            <c:choose>
                <c:when test="${!empty notice}">
                    <c:forEach var="notices" items="${notice}">
                        <c:choose>
                            <c:when test="${notices.nDelete eq 'N'}">
                                <tr>
                                    <td class="information_subtext text1">${notices.nCategory}</td>
                                    <td class="information_subtext text2" colspan="3" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
                                        <a class="noticeqnaLink" href="${path}/community/noticeRead?nNum=${notices.nNum}">${notices.nTitle}</a>
                                    </td>
                                    <td class="information_subtext text3">${notices.nWriter}</td>
                                    <td class="information_subtext text4" style="font-size: 12px"><f:formatDate value="${notices.nDate}" pattern="yyyy-MM-dd" /></td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">공지사항이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>

    <div class="db notice_qna" id="right_db">
        <table class="noticeqna_wrap" style="table-layout: fixed;">
            <tr>
                <td class="information_title" colspan="4"><a class="noticeqnaBtn" href="${path}/community/qna">질 의 응 답 +</a></td>
            </tr>
            <tr>
                <td class="information_text">번 호</td>
                <td class="information_text" colspan="3">제 목</td>
                <td class="information_text">작 성 자</td>
                <td class="information_text">작 성 날 짜</td>
            </tr>
            <c:choose>
                <c:when test="${!empty qna}">
                    <c:forEach var="qnas" items="${qna}">
                        <c:choose>
                            <c:when test="${qnas.qDelete eq 'N'}">
                                <tr>
                                    <td class="information_subtext text1">
                                        <c:choose>
                                            <c:when test="${qnas.depth == 0}">
                                                ${qnas.origin}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="information_subtext text2" colspan="3" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        <c:forEach var="i" begin="1" end="${qnas.depth}">
                                            &nbsp;&nbsp;&nbsp;
                                        </c:forEach>
                                        <c:if test="${qnas.depth != 0}">
                                            ㄴ
                                        </c:if>
                                        <sec:authorize access="isAuthenticated()">
                                            <sec:authentication var="loginMember" property="principal.member"/>
                                            <a class="noticeqnaLink" href="${path}/community/qnaRead?qNum=${qnas.qNum}&uNum=${loginMember.uNum}">${qnas.qTitle}</a>
                                        </sec:authorize>
                                        <sec:authorize access="isAnonymous()">
                                            <a class="noticeqnaLink" href="${path}/community/qnaRead?qNum=${qnas.qNum}&uNum=${0}">${qnas.qTitle}</a>
                                        </sec:authorize>
                                    </td>
                                    <td class="information_subtext text3">${qnas.qWriter}</td>
                                    <td class="information_subtext text4" style="font-size: 12px"><f:formatDate value="${qnas.qDate}" pattern="yyyy-MM-dd" /></td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:when>
            </c:choose>
        </table>
    </div>
</section>


<%----------------------------------------------------------%>
<%--------------------------리뷰섹션--------------------------%>
<%----------------------------------------------------------%>


<section class="section" id="review_section">
    <div class="section_text section_text3" id="review_titletext">
        <div class="section_text_big">고 객 리 뷰</div>
        <br>
        <div class="section_text_small">많은 분들이 남겨주신 소중한 경험을 공유합니다!</div>
    </div>

    <div class="slide" id="review_wrapwrap">
        <ul>
            <li>
                <c:forEach var="reviews" items="${review}">
                    <table class="review_wrap" style="table-layout: fixed;">
                        <tr>
                            <td style="padding-left: 10px" class="reviewText review1">${reviews.rWriter} 님</td>
                        </tr>
                        <tr>
                            <td class="reviewText review2" style="padding-left: 10px">
                                <c:forEach var="i" begin="1" end="${reviews.rPoint}">
                                    ⭐
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td class="reviewText review3" style="padding-left: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${reviews.rTitle}</td>
                        </tr>
                        <tr>
                            <td class="reviewText review4" style="padding-left: 10px; padding-bottom: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${reviews.rContent}</td>
                        </tr>
                        <tr>
                            <td>
                                <a id="reviewBtn" class="noticeqnaLink" href="${path}/community/reviewRead?rNum=${reviews.rNum}">자세히 보기</a>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </li>
        </ul>
    </div>
    <div>
        <a id="reviewBtn2" href="${path}/community/review">더 많은 리뷰보기</a>
    </div>
</section>

<section class="section" id="section_reverse"></section>




<jsp:include page="commons/footer.jsp"/>





<%----------------------------------------------------------%>
<%--------------------------스크립트--------------------------%>
<%----------------------------------------------------------%>
<script>
    /* Demo purposes only */
    $(".hover").mouseleave(
        function () {
            $(this).removeClass("hover");
        }
    );
</script>

<script>
    //current position
    var pos = 0;
    //number of slides
    var totalSlides = $('#slider-wrap ul li').length;
    //get the slide width
    var sliderWidth = $('#slider-wrap').width();


    $(document).ready(function(){

        //set width to be 'x' times the number of slides
        $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);

        //next slide
        $('#next').click(function(){
            slideRight();
        });

        //previous slide
        $('#previous').click(function(){
            slideLeft();
        });

        //automatic slider
        var autoSlider = setInterval(slideRight, 3000);

        //for each slide
        $.each($('#slider-wrap ul li'), function() {

            //create a pagination
            var li = document.createElement('li');
            $('#pagination-wrap ul').append(li);
        });

        //counter
        countSlides();

        //pagination
        pagination();

        //hide/show controls/btns when hover
        //pause automatic slide when hover
        $('#slider-wrap').hover(
            function(){ $(this).addClass('active'); clearInterval(autoSlider); },
            function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
        );

    });//DOCUMENT READY

    function slideLeft(){
        pos--;
        if(pos==-1){ pos = totalSlides-1; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));

        //*> optional
        countSlides();
        pagination();
    }

    function slideRight(){
        pos++;
        if(pos==totalSlides){ pos = 0; }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));

        //*> optional
        countSlides();
        pagination();
    }

    function countSlides(){
        $('#counter').html(pos+1 + ' / ' + totalSlides);
    }

    function pagination(){
        $('#pagination-wrap ul li').removeClass('active');
        $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
    }


    $(window).scroll(function () {
        var height = $(document).scrollTop();
        if (height > 0) {
            // $(".header_wrap").css('position', 'fixed');
            $(".nav_down").css('position', 'absolute');
        } else if (height === 0){
            $(".nav_down").css('position', 'relative');
        }
    });
</script>



</body>
</html>
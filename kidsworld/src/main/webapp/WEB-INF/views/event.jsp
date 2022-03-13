<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/01
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>
        .banner_section{
            position: relative;
            max-width: 1440px;
        }
        .subbanner_img{
            position: absolute;
            width: 1439px;
        }
        .subbanner_title_text{
            position: absolute;
            width: 1439px;
            font-size: 70px;
            color: white;
            text-align: center;
            line-height: 630px;
            font-weight: bold;
        }
        .subbanner_title_text2{
            position: absolute;
            width: 1439px;
            font-size: 40px;
            color: white;
            text-align: center;
            line-height: 780px;
        }


        .event_section{
            position: relative;
            /*border-top: 5px dashed #2493e0;*/
            /*border-left: 5px dashed #2493e0;*/
            /*border-right: 5px dashed #2493e0;*/
            border-bottom: 5px dashed #2493e0;
            width: 1440px;
            height: 800px;
            top: 700px;
            margin-bottom: 150px;
        }
        .eventImg{
            width: 1239px;
            height: 600px;
            border: 1px solid #ff8d67;
            border-top-right-radius: 50px;
            border-bottom-left-radius: 50px;
            margin-top: 10px;
            margin-left: 100px;
        }


        .eventText_wrap{
            margin-top: 20px;
            text-align: center;
        }
        .eventText{
            margin-bottom: 10px;
        }
        .textstyle1{
            color: #808080;
        }
        .textstyle2{
            color: #ef5f2e;
        }
        .endevent{
            text-decoration: line-through;
            text-decoration-thickness: 3px;
            text-decoration-color: black;
        }
        #endevent_title{
            position: absolute;
            font-size: 65px;
            width: 1239px;
            height: 600px;
            border-top-right-radius: 50px;
            border-bottom-left-radius: 50px;
            margin-top: 10px;
            margin-left: 100px;
            top: 0;
            bottom: 50%;
            background-color: rgba( 4, 4, 4, 0.7 );
            color: white;
            z-index: 9;
            text-align: center;
            line-height: 620px;
        }



        /*                      footer                  */
        footer{
            top: 750px;
        }
    </style>
</head>
<body>
<%------------------------------------------------------%>
<%-----------------------헤더 css------------------------%>
<%------------------------------------------------------%>

<jsp:include page="commons/header.jsp"/>

<%------------------------------------------------------%>
<%------------------------------------------------------%>
<%------------------------------------------------------%>

<section class="banner_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">이 벤 트</span>
        <span class="subbanner_title_text2">.event</span>
    </div>
</section>



<section class="event_section">
    <div>
        <img class="eventImg" src="${path}/resources/img/event_img/eventbg_1.png"/>
    </div>
    <div class="eventText_wrap">
        <h2 class="eventText textstyle1">진행중인 이벤트</h2>
        <h3 class="eventText textstyle2">♛ 콜라보 이벤트! ♛</h3>
        <p class="eventText">동심을 사로잡는 수많은 캐릭터들을 만나보세요. 다양한 캐릭터상품부터 놀거리 먹거리가 잔뜩! 아이들에게 소중한 추억을 만들어주세요</p>
        <h4 class="eventText">이벤트 기간 : 2022/03/01 ~ 2022/03/31</h4>
    </div>
</section>

<section class="event_section">
    <div>
        <img class="eventImg" src="${path}/resources/img/event_img/eventbg_2.png"/>
    </div>
    <div class="eventText_wrap">
        <h2 class="eventText textstyle1">진행중인 이벤트</h2>
        <h3 class="eventText textstyle2">♛ 콜라보 이벤트! ♛</h3>
        <p class="eventText">동심을 사로잡는 수많은 캐릭터들을 만나보세요. 다양한 캐릭터상품부터 놀거리 먹거리가 잔뜩! 아이들에게 소중한 추억을 만들어주세요</p>
        <h4 class="eventText">이벤트 기간 : 2022/03/01 ~ 2022/03/31</h4>
    </div>
</section>

<section class="event_section">
    <div>
        <img class="eventImg" src="${path}/resources/img/event_img/eventbg_3.png">
    </div>
    <div class="eventText_wrap">
        <h2 class="eventText textstyle1">진행중인 이벤트</h2>
        <h3 class="eventText textstyle2">♛ 콜라보 이벤트! ♛</h3>
        <p class="eventText">동심을 사로잡는 수많은 캐릭터들을 만나보세요. 다양한 캐릭터상품부터 놀거리 먹거리가 잔뜩! 아이들에게 소중한 추억을 만들어주세요</p>
        <h4 class="eventText">이벤트 기간 : 2022/03/01 ~ 2022/03/31</h4>
    </div>
</section>

<section class="event_section">
    <div>
        <img class="eventImg" src="${path}/resources/img/event_img/eventbg_4.png">
        <div id="endevent_title">종료되었습니다</div>
    </div>
    <div class="eventText_wrap">
        <h2 class="eventText textstyle1 endevent">종료된 이벤트</h2>
        <h3 class="eventText textstyle2 endevent">♛ 새해맞이 이벤트! ♛</h3>
        <p class="eventText endevent">새해부터 신나게! 작년까지 부지런하게 일했던 당신과 열심히 공부한 아이들. 와서 마음껏 즐겨라!</p>
        <h4 class="eventText endevent">이벤트 기간 : 2022/01/01 ~ 2022/01/31</h4>
    </div>
</section>







<jsp:include page="commons/footer.jsp"/>




<script>

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

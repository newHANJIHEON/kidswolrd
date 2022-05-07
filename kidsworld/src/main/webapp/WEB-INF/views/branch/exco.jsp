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
    <title>키즈월드 벡스코</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        .banner_section{
            position: relative;
            max-width: 1440px;
        }
        .subbanner_img{
            position: absolute;
            width: 1440px;
        }
        .subbanner_title_text{
            position: absolute;
            width: 1440px;
            font-size: 70px;
            color: white;
            text-align: center;
            line-height: 630px;
            font-weight: bold;
        }
        .subbanner_title_text2{
            position: absolute;
            width: 1440px;
            font-size: 40px;
            color: white;
            text-align: center;
            line-height: 780px;
        }


        #bexcosection_wrap{
            position: absolute;
            top: 600px;
            width: 1440px;
            height: 5000px;
        }

        #bexcotitle{
            position: relative;
            width: 500px;
            height: 60px;
            font-size: 40px;
            margin-top: 150px;
            margin-left: 200px;
            border-left: 3px solid #fe5c24;
            padding-left: 20px;
            margin-bottom: 60px;
        }
        #bexcotitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, #ffe359 0%, #fff2ac 100%);
        }
        #bexcotitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, rgb(255, 193, 159) 0%, rgb(250, 250, 246) 100%);
        }


        .bexcoImg_wrap2{
            position: relative;
        }
        .bexcoImg_box{
            position: relative;
            display: inline-block;
            margin-right: 40px;
            margin-bottom: 70px;
            border: none;
        }
        .bexcoImg{
            position: relative;
            width: 400px;
            height: 400px;
            border: 1px solid black;
            border-radius: 20px;
            left: 70px;
            background-color: white;
        }


        .bexcoImg_wrap1{
            position: relative;
            height: 1100px;
            margin-bottom: 150px;
            padding-left: 250px;
        }
        .bexcotitleImg{
            position: relative;
            display: inline-block;
            left: 100px;
        }
        #bexco_titleImg1{
            position: relative;
            height: 1100px;
            width: 700px;
            border-radius: 30px;
        }
        .bexco_titleImg2{
            position: relative;
            width: 540px;
            height: 540px;
            float: left;
        }
        #titleimg1{
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }
        #titleimg2{
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }
        #bexcobottomImg{
            position: relative;
            margin-left: 175px;
        }



        /*--------------------------    백그라운드 이미지    -----------------------------------*/
        #backgroundImg{
            position: absolute;
            width: 1440px;
            height: 1150px;
            top: 850px;
            background-image: url("${path}/resources/img/background_img/background1.jpg");
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: 1440px;
        }



        /*                      footer                  */
        footer{
            top: 6100px;
        }

    </style>
</head>
<body>
<%------------------------------------------------------%>
<%-----------------------헤더 css------------------------%>
<%------------------------------------------------------%>

<jsp:include page="../commons/header.jsp"/>

<%------------------------------------------------------%>
<%------------------------------------------------------%>
<%------------------------------------------------------%>

<section class="banner_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">대구 엑스코</span>
        <span class="subbanner_title_text2">.Daegu exco</span>
    </div>
</section>


<div id="backgroundImg"></div>


<div id="bexcosection_wrap">
    <h1 id="bexcotitle">엑스코</h1>

    <div class="bexcoImg_wrap1">
        <div class="bexcotitleImg">
            <img id="bexco_titleImg1" src="${path}/resources/img/bexco_img/bexcotitle_img1.jpeg"/>
        </div>
    </div>

    <div class="bexcoImg_wrap2">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img1.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img2.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img3.png"/>
        </div>
    </div>
    <div class="bexcoImg_box">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img4.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img5.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img6.png"/>
        </div>
    </div>
    <div class="bexcoImg_box">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img7.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img8.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img9.png"/>
        </div>
    </div>
    <div class="bexcoImg_box">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img10.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img11.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img12.png"/>
        </div>
    </div>
    <div class="bexcoImg_box">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img13.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img14.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img15.png"/>
        </div>
    </div>
    <div class="bexcoImg_box">
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img16.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img17.png"/>
        </div>
        <div class="bexcoImg_box">
            <img class="bexcoImg" src="${path}/resources/img/bexco_img/bexco_img18.png"/>
        </div>
    </div>
    <div id="bexcobottomImg">
        <div>
            <img class="bexco_titleImg2" id="titleimg1" src="${path}/resources/img/bexco_img/bexcotitle_img2.jpeg"/>
        </div>
        <div>
            <img class="bexco_titleImg2" id="titleimg2" src="${path}/resources/img/bexco_img/bexcotitle_img3.jpeg"/>
        </div>
    </div>

</div>






<jsp:include page="../commons/footer.jsp"/>



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
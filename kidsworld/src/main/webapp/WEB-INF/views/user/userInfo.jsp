<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/02
  Time: 5:20 PM
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
    <title>내 정보 보기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">


    <style>

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

        /**/
        /**/
        /**/

        .userinfo_wrap{
            position: absolute;
            top: 700px;
            left: 490px;
            border: 2px solid #fe5c24;
            border-right: none;
            border-left: none;
            background-color: white;
        }

        .userinfo_box{
            border-collapse: collapse;
        }

        .info_title{
            border: 1px solid black;
            width: 100px;
            font-size: 22px;
            text-align: center;
            padding: 20px;
            border-left: none;
            border-collapse: collapse;
        }

        .info_text{
            border: 1px solid black;
            width: 300px;
            padding-left: 20px;
            border-right: none;
            border-collapse: collapse;
        }

        .infoBtn{
            position: absolute;
            background-color: #fe5c24;
            font-size: 20px;
            top: 540px;
            left: 145px;
            border-radius: 20px;
            color: white;
            cursor: pointer;
            transition: 0.5s;
            padding-left: 30px;
            padding-right: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .infoBtn:hover{
            background-color: #2493e0;
        }



        /*                          footer                          */
        footer{
            position: absolute;
            margin-bottom: -750px;
            bottom: 0;
        }
    </style>



</head>
<body>

<jsp:include page="../commons/header.jsp" />

<section class="info_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">회 원 정 보</span>
        <span class="subbanner_title_text2">.user information</span>
    </div>
</section>


<div class="userinfo_wrap">
    <sec:authorize access="isAuthenticated()">
        <sec:authentication var="loginMember" property="principal.member"/>
        <table class="userinfo_box">
            <tr class="infoform">
                <td class="info_title">이름</td>
                <td class="info_text">${loginMember.uName}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">아이디</td>
                <td class="info_text">${loginMember.uId}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">전화번호</td>
                <td class="info_text">${loginMember.uPhoneNum}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">생년월일</td>
                <td class="info_text">${loginMember.uBirth}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">우편번호</td>
                <td class="info_text">${loginMember.uPostCode}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">주소</td>
                <td class="info_text">${loginMember.uAddr}</td>
            </tr>
            <tr class="infoform">
                <td class="info_title">상세주소</td>
                <td class="info_text">${loginMember.uDetailAddr}</td>
            </tr>
            <tr class="infoBtn">
                <td colspan="2" style="float: right">
                    <a href="${path}/user/userUpdate">회원정보 변경</a>
                </td>
            </tr>
        </table>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        <h1>로그인 정보가 없습니다.</h1>
        <h3>로그인 후 이용해주시기 바랍니다.</h3>
    </sec:authorize>
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

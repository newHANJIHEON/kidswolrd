<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/05
  Time: 2:12 AM
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
    <title>아이디찾기</title>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>

        .findform_wrap{
            position: absolute;
            top: 300px;
            left: 530px;
        }

        .findid_wrap{
            border: none;
            width: 360px;
            height: 150px;
        }

        #findid_maintext{
            text-align: center;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .findicon_wrap{
            border: 1px solid #fe5c24;
            border-right: none;
            height: 60px;
            margin-right: -5px;
            border-top-left-radius: 10px;
            background-color: white;
        }

        .findicon{
            opacity: 0.3;
            margin-right: 5px;
            background-color: white;
            margin-top: 18px;
            margin-left: 10px;
            padding-right: 10px;
        }

        .findinput_wrap{
            position: relative;
        }

        #uName, #uPhoneNum{
            border: 1px solid #fe5c24;
            border-left: none;
            width: 320px;
            height: 60px;
            border-bottom-right-radius: 10px;
            font-size: 15px;
        }

        .phtxt_name, .phtxt_phone{
            position: absolute;
            top: 28px; left: 10px;
            transform: translate(0, -50%);
            font-size: 17px;
            color: #9E9E9E;
            transition: 0.35s ease;
            vertical-align: top;
            user-select: none;
            z-index: 10;
            cursor: text;
        }

        .div_line{
            border-bottom: 4px solid #b7b6b6;
        }


        .findidBtn{
            width: 370px;
            height: 50px;
            background-color: #2493e0;
            cursor: pointer;
            transition: 0.5s;
            border: none;
            border-radius: 20px;
            font-size: 25px;
            color: white;
            margin-top: 20px;
        }
        .findidBtn:hover{
            background-color: #fe5c24;
        }

        .findpw_link_wrap{
         margin-top: 20px;
        }
        .findpw_link{
            margin-left: 280px;
            font-size: 15px;
            color: #fe5c24;
            cursor: pointer;
            transition: 0.5s;
        }
        .findpw_link:hover{
            color: #2493e0;
        }


        /*                          footer                          */
        footer{
            position: absolute;
            margin-bottom: -150px;
            bottom: 0;
        }

    </style>
</head>
<body>

<jsp:include page="../commons/header.jsp" />


<div class="findform_wrap">
    <div id="findid_maintext">아이디 찾기</div>
    <table class="findid_wrap">
        <tr>
            <td>
                <div class="findicon_wrap">
                    <img src="${path}/resources/img/icon_img/message-2-fill.png" class="findicon">
                </div>
            </td>
            <td>
                <div class="findinput_wrap">
                    <input type="text" id="uName" />
                    <span class="phtxt_name">이름</span>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div class="findicon_wrap">
                    <img src="${path}/resources/img/icon_img/phone-fill.png" class="findicon">
                </div>
            </td>

            <td>
                <div class="findinput_wrap">
                    <input type="text" id="uPhoneNum" />
                    <span class="phtxt_phone">전화번호</span>
                </div>
            </td>
        </tr>
    </table>

    <div class="div_line"></div>

    <div>
        <button class="findidBtn" onclick="findId()">찾기</button>
    </div>

    <div class="findpw_link_wrap">
        <a class="findpw_link" href="${path}/user/findPass">비밀번호 변경</a>
    </div>
</div>



<jsp:include page="../commons/footer.jsp"/>



<script>
    function findId() {
        var uId = "";
        var uName = $("#uName").val();
        var uPhoneNum = $("#uPhoneNum").val();

        $.ajax({
            type : "POST",
            async : false,
            headers : {
                "Content-Type" : "application/json",
                "${_csrf.headerName}" : "${_csrf.token}"
            },
            dataType : "text",
            url : "${path}/user/findId",
            data : JSON.stringify({
                uName : uName,
                uPhoneNum : uPhoneNum
            }),
            success : function (receiveId) {
                uId = receiveId;
            }
        });

        if (uId !== "") {
            alert("아이디는 '" + uId + "' 입니다.");
        } else {
            alert("아이디를 찾을 수 없습니다.");
        }

    }
</script>


<script>
    const nameInput = document.querySelector("#uName");
    const phoneInput = document.querySelector("#uPhoneNum");

    const ph_name = document.querySelector(".phTxt_name");
    const ph_phone = document.querySelector(".phtxt_phone");


    nameInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    nameInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    phoneInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    nameInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    phoneInput.addEventListener('blur', (e)=>{
        if(pwInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    ph_name.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_phone.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
</script>


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

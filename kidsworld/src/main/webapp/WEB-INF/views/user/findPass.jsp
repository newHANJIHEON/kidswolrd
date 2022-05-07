<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/05
  Time: 2:13 AM
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
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>

        .findform_wrap2{
            position: absolute;
            top: 260px;
            left: 530px;
            padding-bottom: 200px;
        }

        .findpw_wrap{
            border: none;
            width: 360px;
            height: 150px;
        }

        #findid_maintext2{
            text-align: center;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .findicon_wrap2{
            border: 1px solid #fe5c24;
            border-right: none;
            height: 60px;
            margin-right: -5px;
            border-top-left-radius: 10px;
            background-color: white;
        }

        .findicon2{
            opacity: 0.3;
            margin-right: 5px;
            background-color: white;
            margin-top: 18px;
            margin-left: 10px;
            padding-right: 10px;
        }

        .findinput_wrap2{
            position: relative;
        }

        #uName, #uPhoneNum, #uId, #uIdCheck{
            border: 1px solid #fe5c24;
            border-left: none;
            width: 320px;
            height: 60px;
            border-bottom-right-radius: 10px;
            font-size: 15px;
        }

        .phtxt_name, .phtxt_phone, .phtxt_id, .phtxt_idcode{
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
        
        #findidBtn, #findidcodeBtn{
            position: absolute;
            width: 70px;
            height: 35px;
            font-size: 13px;
            top: 9px;
            right: 12px;
            border: none;
            border-radius: 10px;
            background-color: #fe5c24;
            cursor: pointer;
            transition: 0.5s;
            color: white;
            margin-top: 5px;
        }

        #findidBtn:hover, #findidcodeBtn:hover{
            background-color: #2493e0;
        }

        .div_line2{
            border-bottom: 4px solid #b7b6b6;
            margin-top: 22px;
        }

        .findpwBtn{
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
        .findpwBtn:hover{
            background-color: #fe5c24;
        }

        .login_link_wrap{
            margin-top: 10px;
            margin-left: 320px;
        }

        .login_link{
            color: #fe5c24;
            cursor: pointer;
            transition: 0.5s;
        }
        .login_link:hover{
            color: #2493e0;
        }


        /*                          footer                          */
        footer{
            position: absolute;
            margin-bottom: -250px;
            bottom: 0;
        }

    </style>
</head>
<body>


<jsp:include page="../commons/header.jsp" />


<div class="findform_wrap2">
    <div id="findid_maintext2">비밀번호 변경</div>
    <form action="${path}/user/ChangePass" method="post" id="ChangePass" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <table class="findpw_wrap">
            <tr>
                <td>
                    <div class="findicon_wrap2">
                        <img src="${path}/resources/img/icon_img/message-2-fill.png" class="findicon2">
                    </div>
                </td>
                <td>
                    <div class="findinput_wrap2">
                        <input type="text" id="uName" name="uName" />
                        <span class="phtxt_name">이름</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="findicon_wrap2">
                        <img src="${path}/resources/img/icon_img/phone-fill.png" class="findicon2">
                    </div>
                </td>
                <td>
                    <div class="findinput_wrap2">
                        <input type="text" id="uPhoneNum" name="uPhoneNum" />
                        <span class="phtxt_phone">전화번호</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="findicon_wrap2">
                        <img src="${path}/resources/img/icon_img/mail-fill.png" class="findicon2">
                    </div>
                </td>
                <td>
                    <div class="findinput_wrap2">
                        <input type="text" id="uId" name="uId" />
                        <span class="phtxt_id">아이디</span>
                        <button id="findidBtn" type="button" onclick="sendEmail()">인증하기</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="findicon_wrap2">
                        <img src="${path}/resources/img/icon_img/mail-lock-fill.png" class="findicon2"/>
                    </div>
                </td>
                <td>
                    <div class="findinput_wrap2">
                        <input type="text" id="uIdCheck" />
                        <span class="phtxt_idcode">인증코드</span>
                        <button id="findidcodeBtn" type="button" onclick="checkEmail()">인증완료</button>
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <div class="div_line2"></div>

    <div>
        <button class="findpwBtn" onclick="findPass()">변경</button>
    </div>

    <div class="login_link_wrap">
        <a class="login_link" href="${path}/user/login">로그인</a>
    </div>
</div>



<jsp:include page="../commons/footer.jsp"/>



<script>

    if ("${message}" !== "") {
        alert("${message}");
    }

    //이메일 인증코드 담을 곳
    var emailCode = "";

    //인증코드 확인여부를 검사할 boolean
    var emailCheck = false;

    function sendEmail() {
        //이메일 인증코드 발송
        var uId = $("#uId").val();
        if (!uId || uId === "") {
            alert("아이디를 입력해주세요.");
            return;
        }
        $.ajax({
            type : "get",
            dataType : "text",
            url : "${path}/user/emailSend",
            data : {
                uId : uId
            },
            success : function (code) {
                if (code) {
                    emailCode = code;
                    $("#uId").attr('readonly', true);
                    alert("메일 발송 완료!\n메일을 확인해주세요.");
                } else {
                    alert("메일 전송 실패.\n관리자에게 문의해주세요.");
                }
            }
        });
    }

    function checkEmail() {
        //인증코드 검사
        var userCode = $("#uIdCheck").val();
        if (emailCode !== "" && emailCode === userCode) {
            emailCheck = true;
            alert("이메일 인증이 완료되었습니다.");
            $("#uIdCheck").attr('readonly', true);
        } else {
            emailCheck = false;
            alert("이메일 인증코드를 다시 확인해주세요.")
        }
    }

    function findPass() {
        if (emailCheck === false || $("#uId").val() === "" || $("#uPhoneNum").val() === "" || $("#uName").val() === "") {
            alert("인증절차를 완료해주세요");
        } else {
            $("#ChangePass").submit();
        }
    }
</script>

<script>
    const nameInput = document.querySelector("#uName");
    const phoneInput = document.querySelector("#uPhoneNum");
    const idInput = document.querySelector("#uId");
    const idcodeInput = document.querySelector("#uIdCheck");

    const ph_name = document.querySelector(".phTxt_name");
    const ph_phone = document.querySelector(".phtxt_phone");
    const ph_id = document.querySelector(".phtxt_id");
    const ph_idcode = document.querySelector(".phtxt_idcode");


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

    idInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    idInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    idInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    idcodeInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    idcodeInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    idcodeInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });



    ph_name.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_phone.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_id.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_idcode.addEventListener('click', (e)=>{
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

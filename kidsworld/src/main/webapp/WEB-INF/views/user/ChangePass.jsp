<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/05
  Time: 4:54 PM
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        .text_danger{
            display: block;
            color: red;
            font-size: 10px;
            padding: 5px;
        }

    /*-------------------------------------------css----------------------------------------*/

        .changeform_wrap{
            position: absolute;
            top: 300px;
            left: 530px;
        }

        .changepw_wrap{
            border: none;
            width: 360px;
            height: 150px;
        }

        #changepw_maintext{
            text-align: center;
            font-size: 35px;
            margin-bottom: 20px;
        }

        .changeicon_wrap{
            border: 1px solid #fe5c24;
            width: 360px;
            height: 60px;
            margin-right: -5px;
            border-top-left-radius: 10px;
            border-bottom-right-radius: 10px;
            background-color: white;
        }

        .changeicon{
            opacity: 0.3;
            margin-right: 5px;
            background-color: white;
            margin-top: 19px;
            margin-left: 10px;
            padding-right: 10px;
        }

        .changeinput_wrap{
            position: absolute;
            margin-left: -308px;
            margin-top: -26px;
        }

        #uPassword, #uPasswordCheck{
            position: relative;
            border: none;
            top: 16px;
            background-color: rgba(255,255,255,0.3);
            width: 300px;
            height: 30px;
            border-bottom-right-radius: 10px;
            font-size: 15px;
            margin-top: -10px;
        }

        .phtxt_pw, .phtxt_pwcheck{
            position: absolute;
            width: 100px;
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

        .div_line3{
            border-bottom: 4px solid #b7b6b6;
            margin-top: 10px;
        }

        .changeBtn{
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
        .changeBtn:hover{
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
            margin-bottom: -150px;
            bottom: 0;
        }

    </style>
</head>
<body>

<jsp:include page="../commons/header.jsp" />


<div class="changeform_wrap">
    <div id="changepw_maintext">비밀번호 변경</div>
    <form action="${path}/user/ChangePassSubmit" method="post" id="changePassForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" value="${user.uNum}" name="uNum"/>
        <table class="changepw_wrap">
            <tr>
                <td>
                    <div class="changeicon_wrap">
                        <img src="${path}/resources/img/icon_img/git-repository-private-line.png" class="changeicon">
                    </div>
                <td>
                    <div class="changeinput_wrap">
                        <input type="text" id="uPassword" name="uPassword" />
                        <span class="phtxt_pw">비밀번호</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="changeicon_wrap">
                        <img src="${path}/resources/img/icon_img/git-repository-private-fill.png" class="changeicon">
                    </div>
                </td>
                <td>
                    <div class="changeinput_wrap">
                        <input type="text" id="uPasswordCheck" name="uPasswordCheck" />
                        <span class="phtxt_pwcheck">비밀번호 확인</span>
                    </div>
                </td>
            </tr>
        </table>

        <div class="div_line3"></div>

        <div>
            <input class="changeBtn" type="submit" value="변경하기" />
        </div>

        <div class="login_link_wrap">
            <a class="login_link" href="${path}/user/login">로그인</a>
        </div>
    </form>
</div>



<jsp:include page="../commons/footer.jsp"/>



<script>

    /////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////유효성 검사 스크립트///////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    //규칙 유형비교 메소드
    $.validator.addMethod("regex" ,function(value,element,regexpr){
        // element : 검증 대상 요소
        // value : 검증 대상 요소가 가진 value 값
        // regexpr : 검증에 필요한 값 - 정규표현식
        return regexpr.test(value);
    });

    //규칙 유형지정
    var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

    $("#changePassForm").validate({
        rules : {
            uPassword: {
                required: true,
                minlength: 8,
                maxlength: 16,
                regex: regexPass
            },
            uPasswordCheck: {
                required: true,
                equalTo: "#uPassword"
            }
        },
        messages : {
            uPassword: {
                required: "비밀번호를 작성해주세요.",
                minlength: "최소 8글자 이상으로 입력해주세요.",
                maxlength: "최대 16글자 이하로 입력해주세요.",
                regex: "특수문자, 영문, 숫자를 포함해야합니다."
            },
            uPasswordCheck: {
                required: "비밀번호확인을 입력해주세요.",
                equalTo: "비밀번호가 일치하지 않습니다."
            }
        },
        debug : false,
        errorElement : "span",
        errorClass : "text_danger",
        submitHandler : function (form) {
            alert("비밀번호가 변경되었습니다.");
            form.submit();
        }
    });

</script>


<script>
    const pwInput = document.querySelector("#uPassword");
    const pwcheckInput = document.querySelector("#uPasswordCheck");

    const ph_pw = document.querySelector(".phTxt_pw");
    const ph_pwcheck = document.querySelector(".phtxt_pwcheck");


    pwInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '8px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    pwInput.addEventListener('blur', (e)=>{
        if(pwInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwcheckInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '8px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    pwInput.addEventListener('blur', (e)=>{
        if(pwInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwcheckInput.addEventListener('blur', (e)=>{
        if(pwcheckInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    ph_pw.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_pwcheck.addEventListener('click', (e)=>{
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

<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/01
  Time: 3:53 PM
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
    <title>로그인</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />


    <style>
        .formwrap{
            position: absolute;
            top: 300px;
            left: 530px;
        }

        .loginform_wrap{
            border: none;
            width: 360px;
            height: 150px;
        }

        .loginicon{
            opacity: 0.3;
            margin-right: 5px;
            background-color: white;
            margin-top: 17px;
            margin-left: 10px;
            padding-right: 10px;
        }

        .loginicon_form{
            border: 1px solid #fe5c24;
            border-right: none;
            height: 60px;
            margin-right: -5px;
            border-top-left-radius: 10px;
            background-color: white;
        }

        #login_idtext, #login_pwtext{
            border: 1px solid #fe5c24;
            border-left: none;
            width: 320px;
            height: 60px;
            border-bottom-right-radius: 10px;
            font-size: 15px;
        }

        .phTxt_email{
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
        .phTxt_pw{
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

        .checkbox{
            font-size: 13px;
            margin-bottom: 10px;
        }

        #loginBtn{
            border: none;
            border-radius: 10px;
            width: 368px;
            height: 50px;
            background-color: #fe5c24;
            font-size: 20px;
            color: white;
        }

        #loginBtn:hover{
            background-color: #2493e0;
            cursor: pointer;
            transition: 0.5s;
        }

        .liner{
            margin-top: 15px;
            margin-bottom: 15px;
            border: 1px solid #929292;
        }

        .newmember{
            float: right;
        }

        #newmemberBtn{
            font-size: 15px;
            background-color: #fe5c24;
            border: none;
            border-radius: 10px;
            color: white;
            padding: 5px;
        }

        #newmemberBtn:hover{
            background-color: #2493e0;
            cursor: pointer;
            transition: 0.5s;
        }

        .findwrap{
            padding-top: 6px;
            font-size: 13px;
        }

        .inputwrap{
            position: relative;
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

<div class="formwrap">
    <form action="${path}/user/login" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <table class="loginform_wrap">
            <tr>
                <td>
                    <div class="loginicon_form">
                        <img src="${path}/resources/img/icon_img/mail-line.png" class="loginicon"/>
                    </div>
                </td>
                <td>
                    <div class="inputwrap">
                        <input type="text" name="uId" id="login_idtext"/>
                        <span class="phTxt_email">이메일(e-mail)</span>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="loginicon_form">
                        <img src="${path}/resources/img/icon_img/git-repository-private-line.png" class="loginicon"/>
                    </div>
                </td>
                <td>
                    <div class="inputwrap">
                        <input type="text" name="uPassword" id="login_pwtext"/>
                        <span class="phTxt_pw">비밀번호(password)</span>
                    </div>
                </td>
            </tr>
        </table>

        <div class="checkbox">
            <label class="login_checkbox_text">
                <input type="checkbox" id="rememberme" name="rememberme" />
                자동로그인
            </label>
        </div>

        <div>
            <input type="submit" id="loginBtn" value="로그인"/>
        </div>
    </form>

    <div class="liner"></div>

    <div class="newmember">
        <a href="${path}/user/join"><input type="button" value="회원가입" id="newmemberBtn"></a>
    </div>

    <div class="findwrap">
        <a href="${path}/user/findId">아이디 찾기</a> / <a href="${path}/user/findPass">비밀번호 찾기</a>
    </div>
</div>

<jsp:include page="../commons/footer.jsp"/>

<script>

    if ("${message}" !== "") {
        alert("${message}");
    }

    const emInput = document.querySelector("#login_idtext");
    const pwInput = document.querySelector("#login_pwtext");

    const ph_email = document.querySelector(".phTxt_email");
    const ph_pw = document.querySelector(".phTxt_pw");
    const ph_style_set = ph_email.style;



    emInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    emInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    emInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwInput.addEventListener('blur', (e)=>{
        if(pwInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    ph_email.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_pw.addEventListener('click', (e)=>{
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

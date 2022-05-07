<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/01
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>회원가입</title>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>

        .text_danger{
            display: block;
            color: red;
            font-size: 10px;
            padding: 5px;
        }

        .all{
            position: relative;
            background-color: #fafafa;
            padding-bottom: 500px;
        }

        .newmember_form_wrap{
            position: relative;
            width: 100%;
            height: 100vh;
        }

        #joinForm{
            position: absolute;
            top: 49%; left: 50%;
            height: 300px;
            transform: translate(-50%, -50%);
        }

        .newmember_form{
            padding: 20px;
            background-color: white;
            border: 2px solid #fe5c24;
            border-radius: 5px;
        }

        .icon_img_wrap{
            border: none;
        }

        .icon_img{
            opacity: 0.3;
            margin-left: 10px;
            margin-right: 5px;
            background-color: white;
        }

        .text_form_wrap{
            border: none;
        }

        .newmember_text_form{
            position: relative;
            width: 380px;
            height: 60px;
            margin-bottom: -1px;
        }

        .text_box{
            display: inline;
            font-size: 15px;
            width: 360px;
            height: 25px;
            padding: 15px 5px 0px 8px;
            margin-bottom: -1px;
            color: #444444;
            border-bottom: 2px solid #c8cbcf;
            border-radius: 0px;
            outline: 0;

            border-left: none;
            border-top: none;
            border-right: none;
        }

        .newmember_text{
            position: absolute;
            top: 50%; left: 10px;
            transform: translate(0, -50%);
            font-size: 16px;
            color: #9E9E9E;
            transition: 0.35s ease;
            vertical-align: top;
            user-select: none;
            z-index: 10;
            cursor: text;
        }

        #emailSend, #emailSendCheck, #postcodeBtn {
            position: absolute;
            width: 80px;
            height: 30px;
            font-size: 15px;
            margin-top: 10px;
            margin-left: -80px;
            background-color: #fe5c24;
            color: white;
            border: none;
            border-radius: 10px;
        }

        .emailsend_wrap{
            position: absolute;
            bottom: 60px;
            left: 373px;
        }

        #emailSend:hover, #emailSendCheck:hover, #postcodeBtn:hover{
            background-color: #2493e0;
            cursor: pointer;
            transition: 0.5s;
        }

        #newmemberBtn{
            width: 370px;
            height: 40px;
            font-size: 25px;
            background-color: #fe5c24;
            border: none;
            border-radius: 10px;
            color: white;
            margin-left: 26px;
        }

        #newmemberBtn:hover{
            background-color: #2493e0;
            cursor: pointer;
            transition: 0.5s;
        }

        /*                          footer                          */
        footer{
            position: absolute;
            bottom: 0;
            margin-bottom: -600px;
        }

    </style>
</head>
<body>

<jsp:include page="../commons/header.jsp" />

<div class="all">
    <div class="newmember_form_wrap">
        <form action="${path}/user/join" method="post" id="joinForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <table border="1" class="newmember_form">
                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/mail-line.png" alt="" />
                    </td>
                    <td class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform">
                                <input type="text" id="uId" name="uId" class="text_box"/>
                                <span class="newmember_text" id="phtxt_email">이메일</span>
                                <div class="emailsend_wrap">
                                    <input type="button" value="인증하기" id="emailSend"/>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/mail-open-line.png" alt="" />
                    </td>
                    <td class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform">
                                <input type="text" id="uIdCheck" name="uIdCheck" class="text_box"/>
                                <span class="newmember_text" id="phtxt_emailcode">이메일 인증코드</span>

                                <input type="button" value="인증완료" id="emailSendCheck"/>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/git-repository-private-line.png" alt="" />
                    </td>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="password" id="uPassword" name="uPassword" class="text_box"/>
                                <span class="newmember_text" id="phtxt_pw">비밀번호</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/lock-unlock-line.png" alt="" />
                    </td>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="password" id="uPasswordCheck" name="uPasswordCheck" class="text_box"/>
                                <span class="newmember_text" id="phtxt_pwcheck">비밀번호 재입력</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/message-2-line.png" alt="" />
                    </td>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" id="uName" name="uName" class="text_box"/>
                                <span class="newmember_text" id="phtxt_name">이름</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/phone-line.png" alt="" />
                    </td>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" id="uPhoneNum" name="uPhoneNum" class="text_box"/>
                                <span class="newmember_text" id="phtxt_phone">전화번호</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/calendar-check-line.png" alt="" />
                    </td>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" id="uBirth" name="uBirth" class="text_box"/>
                                <span class="newmember_text" id="phtxt_birth">생년월일</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td rowspan="4" class="icon_img_wrap">
                        <img class="icon_img" src="${path}/resources/img/icon_img/home-8-line.png" alt="" />
                    </td>
                    <td class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform">
                                <input type="text" class="phTxt_postcode text_box" id="sample6_postcode" name="uPostCode" />
                                <span class="newmember_text" id="phtxt_address1">우편번호</span>

                                <input type="button" id="postcodeBtn" onclick="sample6_execDaumPostcode()" value="주소찾기"/>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" class="phTxt_address text_box" id="sample6_address" name="uAddr" />
                                <span class="newmember_text" id="phtxt_address2">주소</span>
                            </div>
                        </div>

                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" class="phTxt_extraAddress text_box" id="sample6_extraAddress" />
                                <span class="newmember_text" id="phtxt_address3">참고사항</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="text_form_wrap">
                        <div class="newmember_text_form">
                            <div class="newmember_text_formform_2">
                                <input type="text" class="phTxt_detailAddress text_box" id="sample6_detailAddress" name="uDetailAddr" />
                                <span class="newmember_text" id="phtxt_address4">상세주소</span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" class="text_form_wrap">
                        <input type="submit" value="회원가입" id="newmemberBtn"/>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>





<jsp:include page="../commons/footer.jsp"/>




<script>
    /////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////주소받기 스크립트////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    /////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////이메일 검증 스크립트///////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    //이메일 인증코드 담을 곳
    var emailCode = "";

    //이메일 인증코드 발송
    $("#emailSend").click(function () {
        $.ajax({
            type : "get",
            dataType : "text",
            url : "${path}/user/emailSend",
            data : {
                uId : $("#uId").val()
            },
            success : function (code) {
                if (code) {
                    emailCode = code;
                    $("#uId").attr('readonly', true);
                    alert("메일 발송 완료!\n메일을 확인해주세요.");
                } else {
                    alert("메일 전송 실패.\n관리자에게 문의해주세요.")
                }
            }
        });
    });

    //인증코드 확인여부를 검사할 boolean
    var emailCheck = false;
    //validator로 확인하기 힘들어서 다른 방식 사용

    //인증코드 검사
    $("#emailSendCheck").click(function () {
        var userCode = $("#uIdCheck").val();
        if (emailCode !== "" && emailCode === userCode) {
            emailCheck = true;
            alert("이메일 인증이 완료되었습니다.");
            $("#uIdCheck").attr('readonly', true);
        } else {
            emailCheck = false;
            alert("이메일 인증코드를 다시 확인해주세요.")
        }
    });

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
    var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;

    //유효성 검사
    $("#joinForm").validate({
        rules : {
            uId : {
                required : true,
                email : true,
                remote : {
                    type : "POST",
                    url : "${path}/user/uIdCheck"
                }
            },
            uIdCheck : {
                required : true
            },
            uPassword : {
                required : true,
                minlength : 8,
                maxlength : 16,
                regex : regexPass
            },
            uPasswordCheck : {
                required : true,
                equalTo : "#uPassword"
            },
            uName : {
                required : true,
                rangelength : [2, 6]
            },
            uPhoneNum : {
                required : true,
                regex : regexMobile,
                remote : {
                    type : "POST",
                    url : "${path}/user/uPhoneNumCheck"
                }
            },
            uBirth : {
                rangelength : [8, 8],
                required : true
            },
            uPostCode : {
                required : true
            },
            uAddr : {
                required : true
            },
            uDetailAddr : {
                required : true
            }
        },
        messages : {
            uId : {
                required : "이메일을 입력해주세요.",
                email : "올바른 이메일 형식이 아닙니다.",
                remote : "이미 등록된 이메일입니다."
            },
            uIdCheck : {
                required : "이메일 인증을 완료해주세요."
            },
            uPassword : {
                required : "비밀번호를 작성해주세요.",
                minlength : "최소 8글자 이상으로 입력해주세요.",
                maxlength : "최대 16글자 이하로 입력해주세요.",
                regex : "특수문자, 영문, 숫자를 포함해야합니다."
            },
            uPasswordCheck : {
                required : "비밀번호확인을 입력해주세요.",
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            uName : {
                required : "이름을 작성해주세요.",
                rangelength : $.validator.format("문자 길이가 {0}에서 {1} 사이의 값을 입력해주세요.")
            },
            uPhoneNum : {
                required : "전화번호를 입력해주세요.",
                regex : "올바른 전화번호 형식이 아닙니다.",
                remote : "이미 등록된 전화번호입니다."
            },
            uBirth : {
                rangelength : "생년월일은 8자리로 작성해주세요.",
                required : "생년월일을 입력해주세요.",
            },
            uPostCode : {
                required : "우편번호를 입력해주세요."
            },
            uAddr : {
                required : "주소를 입력해주세요."
            },
            uDetailAddr : {
                required : "상세주소를 입력해주세요."
            }
        },
        debug : false,
        errorElement : "span",
        errorClass : "text_danger",
        submitHandler : function (form) {
            if (emailCheck) {
                alert("회원가입이 완료되었습니다.");
                form.submit();
            } else {
                alert("이메일 인증을 완료해주세요.");
            }
        }
    });

    ///////////////////////////////////////////////////////////////////////////
    ///////////////////ajax헤더에 _csrf토큰 인증 넣어주는 스크립트/////////////////////
    ///////////////////////////////////////////////////////////////////////////
    //security를 사용하고 있기 때문에,
    //ajax 통신에 암호화 토큰을 넣어주기 위한 수식 - 값마다 따로 data에 토큰을 넣어주면 귀찮으니 통신마다 일어나도록 일괄처리하였다.
    //form태그 post 수신은 해당 태그 안에 따로 넣어주어야 한다(request이지 ajax통신이 아니니까).
    $(document).ajaxSend(function(e, xhr, options){
        xhr.setRequestHeader(
            "${_csrf.headerName}",
            "${_csrf.token}");
    });

</script>

<%--글자 이동 스크립트--%>
<script>

    const emInput = document.querySelector("#uId");
    const emcodeInput = document.querySelector("#uIdCheck");
    const pwInput = document.querySelector("#uPassword");
    const pwcheckInput = document.querySelector("#uPasswordCheck");
    const nameInput = document.querySelector("#uName");
    const phoneInput = document.querySelector("#uPhoneNum");
    const birthInput = document.querySelector("#uBirth");
    const address1Input = document.querySelector("#sample6_postcode");
    const address2Input = document.querySelector("#sample6_address");
    const address3Input = document.querySelector("#sample6_extraAddress");
    const address4Input = document.querySelector("#sample6_detailAddress");

    const ph_email = document.querySelector("#phtxt_email");
    const ph_email2 = document.querySelector("#phtxt_emailcode")
    const ph_pw = document.querySelector("#phtxt_pw");
    const ph_pw2 = document.querySelector("#phtxt_pwcheck");
    const ph_name = document.querySelector("#phtxt_name");
    const ph_phone = document.querySelector("#phtxt_phone");
    const ph_birth = document.querySelector("#phtxt_birth");
    const ph_address1 = document.querySelector("#phtxt_address1");
    const ph_address2 = document.querySelector("#phtxt_address2");
    const ph_address3 = document.querySelector("#phtxt_address3");
    const ph_address4 = document.querySelector("#phtxt_address4");

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

    pwInput.addEventListener('blur', (e)=>{
        if(pwInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    emcodeInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    emcodeInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    emcodeInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwcheckInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    pwcheckInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    pwcheckInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

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

    phoneInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    phoneInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    birthInput.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    birthInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    birthInput.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address1Input.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    address1Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address1Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address2Input.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    address2Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address2Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address3Input.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    address3Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address3Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address4Input.addEventListener('focus', (e)=>{
        e.target.parentElement.children[1].style.fontSize = '12px';
        e.target.parentElement.children[1].style.top = '12px';
        e.target.parentElement.children[1].style.right = '3px';
    });

    address4Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });

    address4Input.addEventListener('blur', (e)=>{
        if(emInput.value === ''){
            e.target.parentElement.children[1].style = ph_style_set;
        }
    });


    ph_email.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_email2.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_pw.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_pw2.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_name.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_phone.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_birth.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_address1.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_address2.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_address3.addEventListener('click', (e)=>{
        e.target.parentElement.children[0].focus();
    });
    ph_address4.addEventListener('click', (e)=>{
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
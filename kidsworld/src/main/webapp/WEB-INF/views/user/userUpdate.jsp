<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/02
  Time: 6:24 PM
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
    <meta charset="UTF-8"/>
    <title>내 정보 변경</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />

    <style>

        .text_danger{
            display: block;
            color: red;
            font-size: 10px;
            padding: 5px;
        }
        /**/
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
    /*    */
    /*    */
    /*    */
        #userupdate_wrap{
            position: absolute;
            top: 700px;
            left: 430px;
            border: 2px solid #fe5c24;
            border-right: none;
            border-left: none;
            background-color: white;
        }

        .userupdate_box{
            border-collapse: collapse;
            border-left: none;
            border-right: none;
        }

        .userupdate_title{
            border: 1px solid black;
            width: 100px;
            font-size: 22px;
            text-align: center;
            padding: 20px;
            border-left: none;
            border-collapse: collapse;
        }
        .userupdate_text{
            border: 1px solid black;
            width: 400px;
            padding-left: 20px;
            border-right: none;
            border-collapse: collapse;
        }

        .userinput_text{
            width: 400px;
            height: 66px;
            margin-left: -20px;
            padding-left: 20px;
            font-size: 17px;
        }

        .findadress_wrap{
            position: absolute;
            border: none;
            right: 20px;
            top: 304px;
            border-collapse: collapse;
            background-color: #fe5c24;
            font-size: 15px;
            color: white;
            border-radius: 10px;
            padding: 5px 20px;
            cursor: pointer;
            transition: 0.5s;
        }
        .findadress_wrap:hover{
            background-color: #2493e0;
        }
        .userpost{
            border: none;
        }

        .submit_wrap{
            border: none;
            padding-top: 10px;
            padding-bottom: 10px;
            text-align: center;
        }
        .submitBtn{
            background-color: #fe5c24;
            font-size: 20px;
            border: none;
            padding: 8px 70px;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.5s;
        }
        .submitBtn:hover{
            background-color: #2493e0;
        }





        #userupdate_wrap2{
            position: absolute;
            top: 1450px;
            left: 430px;
            border: 2px solid #fe5c24;
            border-right: none;
            border-left: none;
            background-color: white;
        }
        #userupdate_pw{
            width: 170px;
            height: 66px;
            font-size: 17px;
            border-bottom: 1px solid black;
            text-align: center;
        }
        #userupdate_pwtext{
            width: 392px;
            height: 64px;
            border: none;
        }
        #userpw_box{
            height: 66px;
            border: 1px none black;
            border-left-style: solid;
        }
        #pwBtn_box{
            text-align: center;
        }
        #userupdate_pwBtn{
            width: 185px;
            height: 40px;
            font-size: 15px;
            border: none;
            border-radius: 20px;
            background-color: #fe5c24;
            color: white;
            cursor: pointer;
            transition: 0.5s;
            margin-top: 10px;
            margin-bottom: 10px;
            /*margin-left: 180px;*/
        }
        #userupdate_pwBtn:hover{
            background-color: #2493e0;
        }



        /*                          footer                          */
        footer{
            position: absolute;
            margin-bottom: -900px;
            top: 1800px;
            bottom: 0;
        }

    </style>
</head>
<body>

<jsp:include page="../commons/header.jsp" />

<section class="info_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">회 원 정 보 변 경</span>
        <span class="subbanner_title_text2">.change user information</span>
    </div>
</section>


<div id="userupdate_wrap">
    <sec:authorize access="isAuthenticated()">
        <sec:authentication var="loginMember" property="principal.member"/>
        <form action="${path}/user/userUpdate" method="post" id="joinForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="uNum" value="${loginMember.uNum}" />
            <table class="userupdate_box" border="1">
                <tr>
                    <td class="userupdate_title">아이디(X)</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" name="uId" value="${loginMember.uId}" readonly/>
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">이름</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" id="uName" name="uName" value="${loginMember.uName}" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">전화번호</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" id="uPhoneNum" name="uPhoneNum" value="${loginMember.uPhoneNum}" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">생년월일</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" id="uBirth" name="uBirth" value="${loginMember.uBirth}" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">우편번호</td>
                    <td class="userupdate_text">
                        <input class="userinput_text" type="text" class="phTxt_postcode" id="sample6_postcode" name="uPostCode" value="${loginMember.uPostCode}" />
                    </td>
                    <td class="userpost">
                        <input class="findadress_wrap" type="button" id="postcodeBtn" onclick="sample6_execDaumPostcode()" value="주소찾기" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">주소</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" class="phTxt_address" id="sample6_address" name="uAddr" value="${loginMember.uAddr}" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">참고사항</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" class="phTxt_extraAddress" id="sample6_extraAddress" />
                    </td>
                </tr>

                <tr>
                    <td class="userupdate_title">상세주소</td>
                    <td class="userupdate_text" colspan="2">
                        <input class="userinput_text" type="text" class="phTxt_detailAddress" id="sample6_detailAddress" name="uDetailAddr" value="${loginMember.uDetailAddr}" />
                    </td>
                </tr>

                <tr>
                    <td class="submit_wrap" colspan="4">
                        <input class="submitBtn" type="submit" value="제출" />
                    </td>
                </tr>
            </table>
        </form>
</div>

<div id="userupdate_wrap2">
    <form action="${path}/user/ChangePassFromUpdate" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="uNum" value="${loginMember.uNum}" />
        <input type="hidden" name="uId" value="${loginMember.uId}" />
        <input type="hidden" name="uName" value="${loginMember.uName}" />
        <input type="hidden" name="uPhoneNum" value="${loginMember.uPhoneNum}" />
        <table class="userupdate_box">
            <tr>
                <td id="userupdate_pw">기존 비밀번호 입력</td>
                <td>
                    <div id="userpw_box">
                    <input id="userupdate_pwtext" type="password" name="uPassword" />
                    </div>
                </td>
            </tr>

            <tr>
                <td id="pwBtn_box" colspan="2">
                    <input id="userupdate_pwBtn" type="submit" value="비밀번호 변경하기" />
                </td>
            </tr>
        </table>
    </form>
</div>

</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1>로그인 정보가 없습니다.</h1>
    <h3>로그인 후 이용해주시기 바랍니다.</h3>
</sec:authorize>

<!------------------------------->
<!------------footer------------>
<!------------------------------->
<jsp:include page="../commons/footer.jsp"/>




<script>

    if ("${message}" !== "") {
        alert("${message}");
    }

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
            uName : {
                required : true,
                rangelength : [2, 6]
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
            uName : {
                required : "이름을 작성해주세요.",
                rangelength : $.validator.format("문자 길이가 {0}에서 {1} 사이의 값을 입력해주세요.")
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
            form.submit();
        }
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
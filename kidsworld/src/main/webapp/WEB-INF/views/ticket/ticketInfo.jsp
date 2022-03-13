<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/02
  Time: 2:34 PM
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
    <title>예매하기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <!--google font-->
    <style>

        .info_section{
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


        #ticket_wrap{
            position: relative;
            top: 800px;
        }

        .ticket_box{
            position: relative;
            display: inline-block;
            border: 1px solid black;
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            width: 450px;
            height: 500px;
            padding: 10px;
            background-color: white;
            margin-right: 100px;
            left: 185px;
        }


        .title_ticket{
            text-align: center;
            border: none;
            border-radius: 10px;
            background-color: #ffe359;
            color: black;
            padding: 5px 0px;
        }
        .people_ticket{
            width: 150px;
            margin-top: 20px;
            margin-bottom: 15px;
            text-align: center;
            border-bottom: 2px solid lightpink;
            border-bottom-style: wave;
        }
        .lableBox{
            border: none;
            background-color: #8dc7fa;
            border-radius: 10px;
            padding: 10px;
            border-collapse: collapse;
        }
        .text_ticket{
            padding: 10px;
        }
        select{
            font-size: 20px;
            width: 140px;
            padding: 10px;
        }
        .line{
            position: relative;
            margin-top: 40px;
            border-top-style: none;
            border-right-style: none;
            border-bottom: 3px solid #838383;
            border-bottom-style: dashed;
            border-left-style: none;
        }

        .caution_text{
            position: relative;
            margin-top: 40px;
            font-size: 13px;
            color: #595959;
        }

        .ticketBtn{
            background-color: #fe5c24;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            padding: 5px 15px;
            cursor: pointer;
            transition: 0.5s;
            margin-top: 20px;
            margin-left: 170px;
        }
        .ticketBtn:hover{
            background-color: #2493e0;
        }


        /*-----------------------   티켓가격    ------------------------*/
        .infowrap {
            position: relative;
            margin-bottom: 350px;
        }

        #infowrapwrap{
            position: relative;
            top: 1000px;
            margin-left: 170px;
        }
        footer{
            top: 800px;
        }

        #titleH1{
            position: relative;
            left: 180px;
        }
        .h1{
            position: relative;
            width: 500px;
            height: 60px;
            font-size: 40px;
            border-left: 4px solid #fe5c24;
            margin-bottom: 40px;
            /*padding-left: 30px;*/
            /*padding-right: 200px;*/
            /*margin-bottom: 50px;*/
        }
        .h1{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, #ffe359 0%, #fff2ac 100%);
        }
        .h1{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, rgb(255, 193, 159) 0%, rgb(250, 250, 246) 100%);
        }

        /*                           티켓 테이블                         */

        td{
            border: 1px solid black;
        }

        table{
            border: 1px solid black;
            border-collapse: collapse;
            border-left: none;
            border-right: none;
        }
        .none{
            border-left: none;
        }
        .none2{
            border-right: none;
        }

        #ticket_table{
            position: relative;
            background-color: white;
        }
        /*텍스트*/
        .table_bigtext{
            font-size: 28px;
            text-align: center;
            color: black;
            padding: 15px 50px;
            background-color: #ffbca6;
        }
        .table_semebigtext{
            font-size: 22px;
            text-align: center;
            border-left: none;
        }
        .table_middletext{
            font-size: 20px;
            text-align: center;
        }
        .table_smalltext{
            padding: 11px 30px;
        }
        .table_elsetext{
            padding-right: 30px;
            padding-left: 30px;
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

<section class="info_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">티 켓 예 몌</span>
        <span class="subbanner_title_text2">.ticket</span>
    </div>
</section>




<sec:authorize access="isAuthenticated()">
    <sec:authentication var="loginMember" property="principal.member"/>
<section id="ticket_wrap">

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" id="uName" value="${loginMember.uName}" />
    <input type="hidden" id="uPhoneNum" value="${loginMember.uPhoneNum}" />
    <input type="hidden" id="uId" value="${loginMember.uId}" />

    <h1 class="h1" id="titleH1">티켓 예매</h1>
        <div class="ticket_box">
            <h1 class="title_ticket">종 일 권</h1>

            <h3 class="people_ticket">(성인 - 종일권)</h3>
                <label class="lableBox">
                    <span class="text_ticket">사용처</span>
                    <select id="adult_allDay_tArea">
                        <c:choose>
                            <c:when test="${!empty AllDayTArea}">
                                <option value="${AllDayTArea}"><c:out value="${AllDayTArea}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">선택</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="킨텍스">킨텍스</option>
                        <option value="벡스코">벡스코</option>
                        <option value="엑스코">엑스코</option>
                    </select>
                </label>

                <label class="lableBox">
                    <span class="text_ticket">매수</span>
                    <select id="adult_allDay_count">
                        <c:choose>
                            <c:when test="${!empty AllDayAdult}">
                                <option selected value="${AllDayAdult}"><c:out value="${AllDayAdult}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option selected value="0">0</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                </label>

            <div class="line"></div>

            <h3 class="people_ticket">(아동 - 종일권)</h3>
                <label class="lableBox">
                    <span class="text_ticket">사용처</span>
                    <select id="kid_allDay_tArea">
                        <c:choose>
                            <c:when test="${!empty AllDayTArea}">
                                <option value="${AllDayTArea}"><c:out value="${AllDayTArea}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">선택</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="킨텍스">킨텍스</option>
                        <option value="벡스코">벡스코</option>
                        <option value="엑스코">엑스코</option>
                    </select>
                </label>

                <label class="lableBox">
                    <span class="text_ticket">매수</span>
                    <select id="kid_allDay_count">
                        <c:choose>
                            <c:when test="${!empty AllDayKid}">
                                <option selected value="${AllDayKid}"><c:out value="${AllDayKid}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option selected value="0">0</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                </label>
            <div>
                <p class="caution_text">
                    주의사항 : 예매취소 안내
                    <br/>
                    온라인 예매 시 선택한 날짜에만 방문 및 이용이 가능하며, 미사용시에 해당날짜가 지나면 자동 취소 됩니다.
                    (사용 후에는 취소가 불가능합니다.)
                    본인+동반인 티켓 구매 후 동반인 티켓만 사용 시 본인 티켓 취소는 불가합니다.
                    본인+동반인 티켓 구매 후 취소하실 경우 동반인 티켓을 먼저 취소하셔야합니다.
                    시스템 자동 취소가 될 경우 제휴카드 실적은 은행영업일 기준 2~3일 후에 복구됩니다.
                    별도의 취소 수수료는 없으나 구매 후 환불요청 시 각 카드사에 따라 수수료를 차감합니다.
                    예매취소를 원하시는 경우 [마이페이지 - 결제내역]에서 취소하실 수 있습니다.
                    예매 후에는 반드시 마이티켓을 통하여 예매내역을 확인해 주시기 바랍니다.
                </p>
            </div>
            <div>
                <button class="ticketBtn" id="buy_allDay" onclick="buyAllDayTicket()">예매하기</button>
            </div>
        </div>

        <div class="ticket_box">
            <h1 class="title_ticket">오 후 권</h1>

            <h3 class="people_ticket">(성인 - 오후권)</h3>
                <label class="lableBox">
                    <span class="text_ticket">사용처</span>
                    <select id="adult_halfDay_tArea">
                        <c:choose>
                            <c:when test="${!empty HalfDayTArea}">
                                <option value="${HalfDayTArea}"><c:out value="${HalfDayTArea}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">선택</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="킨텍스">킨텍스</option>
                        <option value="벡스코">벡스코</option>
                        <option value="엑스코">엑스코</option>
                    </select>
                </label>

                <label class="lableBox">
                    <span class="text_ticket">매수</span>
                    <select id="adult_halfDay_count">
                        <c:choose>
                            <c:when test="${!empty HalfDayAdult}">
                                <option selected value="${HalfDayAdult}"><c:out value="${HalfDayAdult}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option selected value="0">0</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                </label>

            <div class="line"></div>

            <h3 class="people_ticket">(아동 - 오후권)</h3>
                <label class="lableBox">
                    <span class="text_ticket">사용처</span>
                    <select id="kid_halfDay_tArea">
                        <c:choose>
                            <c:when test="${!empty HalfDayTArea}">
                                <option value="${HalfDayTArea}"><c:out value="${HalfDayTArea}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">선택</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="킨텍스">킨텍스</option>
                        <option value="벡스코">벡스코</option>
                        <option value="엑스코">엑스코</option>
                    </select>
                </label>

                <label class="lableBox">
                    <span class="text_ticket">매수</span>
                    <select id="kid_halfDay_count">
                        <c:choose>
                            <c:when test="${!empty HalfDayKid}">
                                <option selected value="${HalfDayKid}"><c:out value="${HalfDayKid}"/></option>
                            </c:when>
                            <c:otherwise>
                                <option selected value="0">0</option>
                            </c:otherwise>
                        </c:choose>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                    </select>
                </label>
            <div>
                <p class="caution_text">
                    주의사항 : 예매취소 안내
                    <br/>
                    온라인 예매 시 선택한 날짜에만 방문 및 이용이 가능하며, 미사용시에 해당날짜가 지나면 자동 취소 됩니다.
                    (사용 후에는 취소가 불가능합니다.)
                    본인+동반인 티켓 구매 후 동반인 티켓만 사용 시 본인 티켓 취소는 불가합니다.
                    본인+동반인 티켓 구매 후 취소하실 경우 동반인 티켓을 먼저 취소하셔야합니다.
                    시스템 자동 취소가 될 경우 제휴카드 실적은 은행영업일 기준 2~3일 후에 복구됩니다.
                    별도의 취소 수수료는 없으나 구매 후 환불요청 시 각 카드사에 따라 수수료를 차감합니다.
                    예매취소를 원하시는 경우 [마이페이지 - 결제내역]에서 취소하실 수 있습니다.
                    예매 후에는 반드시 마이티켓을 통하여 예매내역을 확인해 주시기 바랍니다.
                </p>
            </div>
            <div>
                <button class="ticketBtn" id="buy_halfDay" onclick="buyHalfDayTicket()">예매하기</button>
            </div>
        </div>
</section>
</sec:authorize>


<div id="infowrapwrap">
    <section class="info_section">
        <div class="infowrap">
            <div class="h1">티켓가격</div>
            <table align="center" id="ticket_table">
                <tr>
                    <td class="table_bigtext none" id="kang">구분</td>
                    <td class="table_bigtext">종류</td>
                    <td class="table_bigtext">대상</td>
                    <td class="table_bigtext">가격</td>
                    <td class="table_bigtext none2">비고</td>
                </tr>
                <tr>
                    <td class="table_semebigtext none" rowspan="2">종일권</td>
                    <td class="table_middletext">아동권</td>
                    <td class="table_smalltext">유아, 초등학생 대상</td>
                    <td class="table_middletext">20,000원</td>
                    <td class="table_elsetext none2" rowspan="4">온라인 예매 가능</td>
                </tr>
                <tr>
                    <td class="table_middletext">일반권</td>
                    <td class="table_smalltext">중학생 이상</td>
                    <td class="table_middletext">18,000원</td>
                </tr>
                <tr>
                    <td class="table_semebigtext none" rowspan="2">오후권</td>
                    <td class="table_middletext">아동권</td>
                    <td class="table_smalltext">유아, 초등학생 대상(오후 2시 이후 입장시)</td>
                    <td class="table_middletext">15,000원</td>
                </tr>
                <tr>
                    <td class="table_middletext">일반권</td>
                    <td class="table_smalltext">중학생 이상(오후 2시 이후 입장시)</td>
                    <td class="table_middletext">13,000원</td>
                </tr>
                <tr>
                    <td class="table_semebigtext none">단체</td>
                    <td class="table_middletext">단체할인권</td>
                    <td class="table_smalltext">20인 이상의 단체</td>
                    <td class="table_middletext">/</td>
                    <td class="table_elsetext none2">별도 문의</td>
                </tr>
                <tr>
                    <td class="table_semebigtext none">특별할인</td>
                    <td class="table_middletext">할인권</td>
                    <td class="table_smalltext">
                        <p>임산부(본인에 한해 할인)</p>
                        <p>장애인(복지카드 지참 시 동반 1인까지 할인)</p>
                        <p>65세 이상 경로우대(본인에 한해 할인)</p>
                        <p>국가유공자 및 교원증을 소지한 교사(본인에 한해 할인)</p>
                    </td>
                    <td class="table_middletext">9,000원</td>
                    <td class="table_elsetext none2">
                        <p>증빙서류 및 신분증 지참 후</p>
                        <p>현장할인</p>
                    </td>
                </tr>
                <tr>
                    <td class="table_semebigtext none" colspan="2" rowspan="2">기타</td>
                    <td class="table_smalltext">24개월 미만의 영유아</td>
                    <td class="table_middletext">무료</td>
                    <td class="table_elsetext none2"></td>
                </tr>
                <tr>
                    <td class="table_smalltext">기타 이벤트 할인권 및 초대권</td>
                    <td class="table_middletext">안내에 따라 적용</td>
                    <td class="table_elsetext none2"></td>
                </tr>
            </table>
        </div>
    </section>
</div>




<jsp:include page="../commons/footer.jsp"/>




<script>

    function buyAllDayTicket() {
        //티켓에 구매의 성공여부를 저장할 곳
        var adultSuccess = false;
        var kidSuccess = false;

        //티켓값을 구하는 식
        var all_adult = $("#adult_allDay_count").val();
        var all_kid = $("#kid_allDay_count").val();
        var price_adult = all_adult * 18000;
        var price_kid = all_kid * 20000;

        if (all_adult === "0" && all_kid === "0") {
            alert("0개는 구매하실 수 없습니다.");
            return;
        }

        if ($("#adult_allDay_tArea").val() === "0") {
            alert("지점을 지정해주셔야 합니다.");
            return;
        }

        if (confirm((price_adult + price_kid).toLocaleString('ko-KR') + "원을 결제하시겠습니까?")) {
            $.ajax({
                type : 'POST',
                async : false,
                url : '${path}/ticket/buyTicket',
                headers : {
                    "Content-Type" : "application/json",
                    "${_csrf.headerName}" : "${_csrf.token}"
                },
                dataType : "text",
                data : JSON.stringify({
                    forWho : "성인",
                    forWhen : "종일권",
                    uName : "${loginMember.uName}",
                    uPhoneNum : "${loginMember.uPhoneNum}",
                    uId : "${loginMember.uId}",
                    market : "홈페이지",
                    tArea : $("#adult_allDay_tArea").val(),
                    count : all_adult
                })
            }).done(function (data) {
                if (data) {
                    adultSuccess = true;
                }
            });

            $.ajax({
                type : 'POST',
                async : false,
                url : '${path}/ticket/buyTicket',
                headers : {
                    "Content-Type" : "application/json",
                    "${_csrf.headerName}" : "${_csrf.token}"
                },
                dataType : "text",
                data : JSON.stringify({
                    forWho : "아동",
                    forWhen : "종일권",
                    uName : "${loginMember.uName}",
                    uPhoneNum : "${loginMember.uPhoneNum}",
                    uId : "${loginMember.uId}",
                    market : "홈페이지",
                    tArea : $("#kid_allDay_tArea").val(),
                    count : all_kid
                })
            }).done(function (data) {
                if (data) {
                    kidSuccess = true;
                }
            });

        } else {
            alert("결제가 취소되었습니다.");

        }

        if (adultSuccess === true || kidSuccess === true) {
            alert("구매에 성공하였습니다.");
        } else {
            alert("구매에 실패하였습니다.");
        }

    }

    function buyHalfDayTicket() {
        //티켓에 구매의 성공여부를 저장할 곳
        var adultSuccess = false;
        var kidSuccess = false;

        //티켓값을 구하는 식
        var half_adult = $("#adult_halfDay_count").val();
        var half_kid = $("#kid_halfDay_count").val();
        var price_adult = half_adult * 18000;
        var price_kid = half_kid * 20000;

        if (half_adult === "0" && half_kid === "0") {
            alert("0개는 구매하실 수 없습니다.");
            return;
        }

        if ($("#adult_halfDay_tArea").val() === "0") {
            alert("지점을 지정해주셔야 합니다.");
            return;
        }

        if (confirm((price_adult + price_kid).toLocaleString('ko-KR') + "원을 결제하시겠습니까?")) {
            $.ajax({
                type : 'POST',
                async : false,
                url : '${path}/ticket/buyTicket',
                headers : {
                    "Content-Type" : "application/json",
                    "${_csrf.headerName}" : "${_csrf.token}"
                },
                dataType : "text",
                data : JSON.stringify({
                    forWho : "성인",
                    forWhen : "종일권",
                    uName : "${loginMember.uName}",
                    uPhoneNum : "${loginMember.uPhoneNum}",
                    uId : "${loginMember.uId}",
                    market : "홈페이지",
                    tArea : $("#adult_halfDay_tArea").val(),
                    count : half_adult
                })
            }).done(function (data) {
                if (data) {
                    adultSuccess = true;
                }
            });

            $.ajax({
                type : 'POST',
                async : false,
                url : '${path}/ticket/buyTicket',
                headers : {
                    "Content-Type" : "application/json",
                    "${_csrf.headerName}" : "${_csrf.token}"
                },
                dataType : "text",
                data : JSON.stringify({
                    forWho : "아동",
                    forWhen : "종일권",
                    uName : "${loginMember.uName}",
                    uPhoneNum : "${loginMember.uPhoneNum}",
                    uId : "${loginMember.uId}",
                    market : "홈페이지",
                    tArea : $("#kid_halfDay_tArea").val(),
                    count : half_kid
                })
            }).done(function (data) {
                if (data) {
                    kidSuccess = true;
                }
            });

        } else {
            alert("결제가 취소되었습니다.");

        }

        if (adultSuccess === true || kidSuccess === true) {
            alert("구매에 성공하였습니다.");
        } else {
            alert("구매에 실패하였습니다.");
        }

    }

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

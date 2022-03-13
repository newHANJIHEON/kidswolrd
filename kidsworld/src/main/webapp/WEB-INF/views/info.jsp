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
    <title>이용안내</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />


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

        .infowrap {
            position: relative;
            margin-bottom: 350px;
        }

        #infowrapwrap{
            position: relative;
            top: 800px;
            margin-left: 170px;
        }
        footer{
            top: 800px;
        }

        .h1{
            position: relative;
            width: 500px;
            height: 60px;
            font-size: 40px;
            border-left: 4px solid #fe5c24;
            padding-left: 30px;
            padding-right: 200px;
            margin-bottom: 50px;
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

        /*                   자주하는 질문                      */

        .question_text_box{
            background-color: white;
            border-radius: 10px;
            padding: 10px;
            width: 1083px;
        }

        h3{
            font-size: 25px;
            padding: 10px;
        }

        .question_text{
            font-size: 16px;
            padding-bottom: 20px;
        }

        /*                   유의사항                      */


        .caution_text_box{
            background-color: white;
            margin-left: 10px;
            border: none;
            border-radius: 10px;
        }

        .caution_text_line{
            border: none;
        }
        .caution_text_line2{
            padding-bottom: 60px;
        }

        .caution_text{
            font-size: 20px;
            padding: 15px 30px;
        }
        .caution_text2{
            font-size: 20px;
            padding: 15px 30px;
        }


        /*--------------------------    백그라운드 이미지    -----------------------------------*/
        #backgroundImg{
            position: absolute;
            width: 1440px;
            height: 1550px;
            top: 1650px;
            background-image: url("${path}/resources/img/background_img/background5.jpg");
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: 1440px;
            opacity: 0.5;
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

<section class="info_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">이 용 안 내</span>
        <span class="subbanner_title_text2">.information</span>
    </div>
</section>



<div id="backgroundImg"></div>



<div id="infowrapwrap">
<section class="info_section">
    <div class="infowrap">
        <div class="h1" id="ticketPrice">티켓가격</div>
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


<section class="info_section">
    <div class="infowrap">
        <div class="h1" id="FAQ">자주 하는 질문</div>
        <div class="question_text_box">
            <div>
                <h3>Q) 기구는 유료로 이용할 수 있는 건가요?</h3>
                <p class="question_text">키즈월드의 기본 기구는 무료로 이용하실 수 있습니다.<br>
                    다만 입점업체의 뽑기, 오락기 등등의 기구는 이용요금이 발생하오니 참고하시어 이용해주시기 바랍니다.</p>
            </div>
            <div>
                <h3>Q) 내부 음식물 반입이 가능한가요?</h3>
                <p class="question_text">키즈월드 내부로 음식물(분유, 이유식, 특수식 제외) 반입 및 배달음식 이용은 불가능합니다.<br>
                    음료, 식사 등은 내부 매점을 이용해주시기 바랍니다.</p>
            </div>
            <div>
                <h3>Q) 외출이 가능한가요?</h3>
                <p class="question_text">일행의 경우 성인 1인만 외출이 가능하며, 출입증 도장을 찍어드립니다.<br>
                    출입증 도장의 모양이 다르거나 지워질 경우 재입장이 불가능하오니 참고하시어 이용해주시기 바랍니다.</p>
            </div>
            <div>
                <h3>Q) 내부에 화장실이 있나요?</h3>
                <p class="question_text">매장 내 화장실은 하나 이상 구비되어 있사오니 참고하시어 이용해주시기 바랍니다.</p>
            </div>
            <div>
                <h3>Q) 기구는 안전한가요?</h3>
                <p class="question_text">매장 내 기구들은 설치 시 관할지역의 안전검사에 통과된 기구만 배치하고 있습니다.<br>
                    또한 주변 지역의 상급 병원과 연계하여 소통하고 있사오니 안심하시고 이용해주시기 바랍니다.</p>
            </div>
        </div>
    </div>
</section>

<section class="info_section">
    <div class="infowrap">
        <div class="h1" id="notice">이용시 유의사항</div>
        <table class="caution_text_box">
            <tr>
                <td class="caution_text_line">
                    <ul>
                        <li class="caution_text">매장 내부에서 뛰어다니면 위험합니다.</li>
                        <li class="caution_text">에어바운스 탑승시 <strong>양말</strong>을 꼭 착용해야 합니다.</li>
                        <li class="caution_text">애완동물의 출입은 불가능합니다.</li>
                        <li class="caution_text">보호자는 피보호자 주변에서 다치지 않도록 지도해주셔야 합니다.</li>
                    </ul>
                </td>
                <td class="caution_text_line caution_text_line2">
                    <ul>
                        <li class="caution_text2">슬리퍼 등의 활동하기 불편한 복장은 위험합니다.</li>
                        <li class="caution_text2">귀중품은 보관함을 이용하시거나 맡겨주시기 바랍니다.</li>
                        <li class="caution_text2">안전요원의 지시에 따라주시기 바랍니다.</li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</section>
</div>


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

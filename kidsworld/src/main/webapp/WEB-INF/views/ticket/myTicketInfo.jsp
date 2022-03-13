<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/08
  Time: 8:54 PM
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
    <title>예매현황</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        #selectedPage {
            color: #fe5c24;
        }


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



        #ticketlook_wrapwrap{
            position: relative;
            top: 800px;
            width: 1440px;
            height: 800px;
            /*margin-left: 170px;*/
        }
        #ticketlook_wrap{
            position: relative;
            border-collapse: collapse;
            /*margin-left: 200px;*/
        }
        #ticketnext_wrapwrap{
            position: relative;
            width: 1440px;
            text-align: center;
            margin-top: 20px;
        }





        .ticket_wrap{
            position: relative;
            width: 1440px;
            height: 152px;
            text-align: center;
            margin-bottom: 25px;
            /*border: 1px solid black;*/
        }
        .ticket_img{
            border: 1px solid black;
            border-radius: 25px;
            background-color: white;
            position: relative;
            width: 600px;
            height: 150px;
            right: 250px;
        }
        .ticket_text{
            position: relative;
            bottom: 120px;
        }

        /*--------------------------------  티켓 폼 ----------------------------------*/
        .textbox{
            position: relative;
            border: 1px solid black;
            width: 150px;
            height: 30px;
        }
        .ticketNum_text{
            left: 178px;
            bottom: 28px;
            width: 60px;
            height: 15px;
            font-size: 10px;
            border: none;
            color: #656565;
        }
        .ticketNum{
            left: 250px;
            bottom: 45px;
            width: 150px;
            height: 15px;
            border: 1px solid #a1a1a1;
            border-radius: 30px;
            font-size: 10px;
            color: #676767;
            /*line-height: 27px;*/
        }


        .ticketWho{
            left: 641px;
            bottom: 35px;
            border: none;
            width: 100px;
            height: 43px;
            font-size: 25px;
        }
        .ticketWhen{
            left: 641px;
            bottom: 30px;
            border: none;
            width: 100px;
            height: 45px;
            font-size: 25px;
            color: #ff4d0d;
        }


        .ticketName_text{
            left: 182px;
            bottom: 120px;
            width: 60px;
            height: 17px;
            font-size: 12px;
            border: none;
        }
        .ticketName{
            left: 250px;
            bottom: 139px;
            width: 80px;
            height: 20px;
            border: none;
            font-size: 13px;
            border-radius: 5px;
        }
        .ticketPhone{
            left: 350px;
            bottom: 159px;
            width: 130px;
            height: 20px;
            border: none;
            font-size: 13px;
            border-radius: 5px;
        }


        .ticketMarket_text{
            left: 182px;
            bottom: 155px;
            width: 60px;
            height: 17px;
            font-size: 12px;
            border: none;
        }
        .ticketMarket{
            left: 261px;
            bottom: 175px;
            font-size: 13px;
            width: 70px;
            height: 20px;
            border: none;
        }


        .ticketArea_text{
            left: 182px;
            bottom: 172px;
            width: 60px;
            height: 17px;
            font-size: 12px;
            border: none;
        }
        .ticketArea{
            left: 255px;
            bottom: 191px;
            font-size: 13px;
            width: 70px;
            height: 20px;
            border: none;
        }


        .ticketDate_text{
            left: 182px;
            bottom: 188px;
            width: 60px;
            height: 17px;
            font-size: 12px;
            border: none;
        }
        .ticketDate{
            left: 263px;
            bottom: 206px;
            font-size: 13px;
            width: 100px;
            height: 20px;
            border: none;
        }


        .ticketline{
            left: 195px;
            bottom: 200px;
            width: 400px;
            height: 1px;
            border: none;
            border-bottom: 3px solid #a2a2a2;
            border-bottom-style: dashed;
        }


        .ticketCopyright{
            left: 235px;
            bottom: 195px;
            font-size: 9px;
            width: 300px;
            height: 13px;
            border: none;
            color: #969696;
        }


        .ticketBtn{
            left: 780px;
            bottom: 282px;
            width: 80px;
            line-height: 30px;
            border: none;
            border-radius: 10px;
            background-color: #2493e0;
            color: white;
            cursor: pointer;
            transition: 0.5s;
        }
        .ticketBtn:hover{
            background-color: #fe5c24;
        }


        /*----------------------------------------------------*/
        #backgroundImg{
            position: absolute;
            width: 1440px;
            height: 1800px;
            top: 770px;
            <%--background-image: url("${path}/resources/img/background_img/background1.jpg");--%>
            background-attachment: fixed;
            background-repeat: no-repeat;
            background-size: 1440px;
        }


        /*--------------------------------------------------------*/
        footer{
            top: 1900px;
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
        <span class="subbanner_title_text">티켓예몌 목록</span>
        <span class="subbanner_title_text2">.ticket view</span>
    </div>
</section>


<div id="backgroundImg"></div>


<sec:authorize access="isAuthenticated()">
    <div id="ticketlook_wrapwrap">
    <table id="ticketlook_wrap">
        <c:choose>
            <c:when test="${!empty list}">
                <c:forEach var="ticket" items="${list}">
                    <tr>
                        <td class="ticket_wrapwrap">
                            <div class="ticket_wrap">
                                <img class="ticket_img" src="${path}/resources/img/ticket_img/ticket_img.png" />
                                <div class="ticket_text">
                                    <div class="textbox ticketNum_text">일련번호 :</div>
                                    <div class="textbox ticketNum">${ticket.tNum}</div>
                                    <div class="textbox ticketWho">${ticket.forWho}</div>
                                    <div class="textbox ticketWhen">${ticket.forWhen}</div>
                                    <div class="textbox ticketName_text">예약자명 : </div>
                                    <div class="textbox ticketName">${ticket.uName}</div>
                                    <div class="textbox ticketPhone">${ticket.uPhoneNum}</div>
                                    <div class="textbox ticketMarket_text">예 매 처 :</div>
                                    <div class="textbox ticketMarket">${ticket.market}</div>
                                    <div class="textbox ticketArea_text">사용장소 :</div>
                                    <div class="textbox ticketArea">${ticket.tArea}</div>
                                    <div class="textbox ticketDate_text">구매날짜 :</div>
                                    <div class="textbox ticketDate"><f:formatDate value="${ticket.sellDate}" pattern="yyyy-MM-dd"/></div>
                                    <div class="textbox ticketline"></div>
                                    <div class="textbox ticketCopyright">@copyright KidsWorld company</div>
                                    <div class="textbox ticketBtn">
                                        <a href="${path}/ticket/refundTicket?tNum=${ticket.tNum}&uPhoneNum=${ticket.uPhoneNum}" onclick='return confirm("구매를 취소하시겠습니까?");'>
                                            구매취소
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="8">예매하신 행사가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>

    <table id="ticketnext_wrapwrap">
        <c:if test="${!empty pm}">
            <tr>
                <td class="nextwrap" colspan="8">
                    <c:if test="${pm.prev}">
                        <a href="${path}/ticket/myTicketInfo${pm.search(pm.startPage - 1)}">[이전]</a>
                    </c:if>
                    <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
                        <c:choose>
                            <c:when test="${i eq pm.cri.page}">
                                <span id="selectedPage">[${i}]</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${path}/ticket/myTicketInfo${pm.search(i)}">[${i}]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pm.next}">
                        <a href="${path}/ticket/myTicketInfo${pm.search(pm.endPage + 1)}">[다음]</a>
                    </c:if>
                </td>
            </tr>
        </c:if>
    </table>
    </div>
</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1>로그인 후 이용할 수 있는 페이지입니다.</h1>
    <h3>로그인 후 이용해주세요.</h3>
</sec:authorize>



<!------------------------------------------------>
<!----------------------푸터----------------------->
<!------------------------------------------------>
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

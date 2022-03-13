<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/10
  Time: 11:50 AM
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
    <title>관리자페이지</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        #selectedPage {
            color: #fe5c24;
        }

        .head_text{
            float: left;
            margin-top: 5px;
            padding: 2px;
            border-radius: 5px;
            margin-right: 20px;
        }

        .head_text1{
            margin-left: 1180px;
        }

        #manager_wrapwrap{
            position: relative;
            top: 200px;
            width: 1440px;
            height: 800px;
            /*margin-left: 170px;*/
        }
        #manager_headtitle{
            position: relative;
            width: 500px;
            height: 60px;
            font-size: 40px;
            margin-left: 200px;
            border-left: 3px solid #fe5c24;
            padding-left: 20px;
            margin-bottom: 60px;
        }
        #manager_headtitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, #ffe359 0%, #fff2ac 100%);
        }
        #manager_headtitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, rgb(201, 201, 201) 0%, rgb(250, 250, 246) 100%);
        }

        #manager_wrapwrap{
            position: relative;
        }
        .total_wrapwrap{
            position: relative;
            border: 1px solid black;
            border-collapse: collapse;
            float: left;
            text-align: center;
            margin-right: 160px;
            left: 200px;
        }




        .search_box1{
            position: relative;
            height: 40px;
            width: 300px;
            text-align: center;
            border: 1px solid black;
            background-color: #e3e3e3;
            font-size: 13px;
        }
        .search_box2{
            position: relative;
            height: 40px;
            width: 410px;
            text-align: center;
            border: 1px solid black;
            background-color: #e3e3e3;
            font-size: 15px;
        }
        #searchboxStyle1{
            position: relative;
            width: 100px;
            height: 40px;
            border-right: none;
        }
        #searchboxStyle2{
            position: relative;
            border-left: none;
            width: 310px;
            height: 40px;
        }
        .select_box{
            height: 25px;
            border: 1px solid black;
            margin-right: 5px;
            background-color: white;
        }
        #search_submitBtn{
            width: 70px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.5s;
        }
        #search_submitBtn:hover{
            background-color: #e3e3e3;
        }


        .text_box{
            border: 1px solid black;
            height: 40px;
        }

        .box1{
            width: 100px;
        }
        .box2{
            width: 70px;
        }
        .box3{

        }
        .box4{
            font-size: 18px;
        }
        .box5{
            font-size: 18px;
        }



        /*                      footer                  */
        footer{
            /*top: 20px;*/
        }

    </style>
</head>
<body>
<!------------------------------------------------------->
<!--------------------------헤더-------------------------->
<!------------------------------------------------------->
<jsp:include page="../commons/masterHeader.jsp"/>
<%------------------------------------------------------%>
<%------------------------------------------------------%>
<%------------------------------------------------------%>



<!------------------------------------------------------->
<!--------------------------본문-------------------------->
<!------------------------------------------------------->
<div id="manager_wrapwrap">
    <h1 id="manager_headtitle">매출현황</h1>
    <sec:authorize access="hasRole('ROLE_MASTER')">

        <!------------------------------------------------------->
        <!--------------------테이블 좌우로 배치--------------------->
        <!------------------------------------------------------->
        <table class="total_wrapwrap">
            <tr>
                <td class="search_box1" id="searchboxStyle1">날짜검색(자리)</td>
                <td class="search_box1" id="searchboxStyle2" colspan="2">
                    <form action="${path}/master/total" method="get" id="searchForm">
                        <input class="select_box" type="text" name="date" id="date" />
                        <input class="select_box" id="search_submitBtn" type="submit" value="검색" />
                    </form>
                </td>
            </tr>
            <tr>
                <td class="text_box box1">성인권 종일</td>
                <td class="text_box box2">${selectAllDayAdult} 장</td>
                <td class="text_box box3"><f:formatNumber value="${selectAllDayAdult * 18000}" pattern="#,###"/> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">아동권 종일</td>
                <td class="text_box box2">${selectAllDayKid} 장</td>
                <td class="text_box box3"><f:formatNumber value="${selectAllDayKid * 20000}" pattern="#,###"/> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">성인권 오후</td>
                <td class="text_box box2">${selectHalfDayAdult} 장</td>
                <td class="text_box box3"><f:formatNumber value="${selectHalfDayAdult * 15000}" pattern="#,###"/> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">아동권 오후</td>
                <td class="text_box box2">${selectHalfDayKid} 장</td>
                <td class="text_box box3"><f:formatNumber value="${selectHalfDayKid * 13000}" pattern="#,###"/> 원</td>
            </tr>
            <tr>
                <td class="text_box box4">총액</td>
                <td class="text_box box5" colspan="2">
                    <f:formatNumber value="${(selectAllDayAdult * 18000)
                     + (selectAllDayKid * 20000)
                      + (selectHalfDayAdult * 15000)
                       + (selectHalfDayKid * 13000)}" pattern="#,###" /> 원
                </td>
            </tr>
        </table>

        <table class="total_wrapwrap">
            <tr>
                <td class="search_box2" colspan="3">종 합 매 출</td>
            </tr>
            <tr>
                <td class="text_box box1">성인권 종일</td>
                <td class="text_box box2">${totalAllDayAdult} 장</td>
                <td class="text_box box3"><f:formatNumber value="${totalAllDayAdult * 18000}" pattern="#,###" /> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">아동권 종일</td>
                <td class="text_box box2">${totalAllDayKid} 장</td>
                <td class="text_box box3"><f:formatNumber value="${totalAllDayKid * 18000}" pattern="#,###" /> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">성인권 오후</td>
                <td class="text_box box2">${totalHalfDayAdult} 장</td>
                <td class="text_box box3"><f:formatNumber value="${totalHalfDayAdult * 18000}" pattern="#,###" /> 원</td>
            </tr>
            <tr>
                <td class="text_box box1">아동권 오후</td>
                <td class="text_box box2">${totalHalfDayKid} 장</td>
                <td class="text_box box3"><f:formatNumber value="${totalHalfDayKid * 18000}" pattern="#,###" /> 원</td>
            </tr>
            <tr>
                <td class="text_box box4">총액</td>
                <td class="text_box box5" colspan="2">
                    <f:formatNumber value="${(totalAllDayAdult * 18000)
                     + (totalAllDayKid * 20000)
                      + (totalHalfDayAdult * 15000)
                       + (totalHalfDayKid * 13000)}" pattern="#,###" /> 원
                </td>
            </tr>
        </table>

    </sec:authorize>
</div>




<jsp:include page="../commons/footer.jsp"/>




<script>

    $("#date").datepicker({
        changeMonth : true,
        changeYear : true,
        dateFormat : "yy-mm-dd",
        dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
        dayNamesMin : ['월','화','수','목','금','토','일'],
        monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });

    // $("#searchForm").validate({
    //     rules : {
    //         date : {
    //             rangelength : [8, 8]
    //         }
    //     },
    //     messages : {
    //         date : {
    //             rangelength : "8자리를 입력하셔야합니다."
    //         }
    //     }
    // });
    //
    // $.validator.setDefaults({
    //     onkeyup:false,
    //     onclick:false,
    //     onfocusout:false,
    //     showErrors:function(errorMap, errorList) {
    //         if(this.numberOfInvalids()) {
    //             alert(errorList[0].message);
    //             $(errorList[0].element).focus();
    //         }
    //     }
    // });

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

    $("#re").click(function (){
        location.reload();
    });

</script>
</body>
</html>
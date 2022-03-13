<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/09
  Time: 5:49 PM
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
            top: 130px;
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


        .search_box{
            position: relative;
            height: 50px;
            width: 750px;
            text-align: center;
            border: 1px solid black;
            background-color: #e3e3e3;
            left: 350px;
            bottom: 10px;
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


        #manager_wrap{
            position: relative;
            border-collapse: collapse;
            margin-left: 155px;
            background-color: white;
        }

        .box1{
            border: 1px solid black;
            border-left: none;
            width: 80px;
            text-align: center;
        }
        .box2{
            border: 1px solid black;
            width: 90px;
        }
        .box3{
            border: 1px solid black;
            width: 110px;
            text-align: center;
        }
        .box4{
            border: 1px solid black;
            width: 110px;
            text-align: center;
        }
        .box5{
            border: 1px solid black;
            width: 200px;
        }
        .box6{
            border: 1px solid black;
            width: 110px;
        }
        .box7{
            border: 1px solid black;
            width: 110px;
        }
        .box8{
            border: 1px solid black;
            width: 150px;
        }
        .box9{
            border: 1px solid black;
            width: 150px;
            border-right: none;
        }

        .nextbox{
            text-align: center;
            border: none;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        .title_box{
            background-color: #c7c7c7;
            text-align: center;
            height: 40px;
            font-size: 15px;
        }
        .textstyle{
            font-size: 14px;
            text-align: center;
            height: 35px;
        }




        /*                      footer                  */
        footer{
            top: 150px;
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




<div id="manager_wrapwrap">
    <h1 id="manager_headtitle">반품목록</h1>
    <sec:authorize access="hasRole('ROLE_MASTER')">
        <form action="${path}/master/refundTicketInfo" method="get">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <table>
                <tr>
                    <td class="search_box">
                        <select class="select_box" name="searchType">
                            <option value="none" selected>검색유형</option>
                            <option value="p">휴대폰 번호로 검색</option>
                            <option value="n">이름으로 검색</option>
                            <option value="pn">휴대폰과 이름으로 검색</option>
                        </select>
                        <input class="select_box" type="text" name="uPhoneNum" placeholder="휴대폰"/>
                        <input class="select_box" type="text" name="uName" placeholder="이름"/>
                        <input class="select_box" id="search_submitBtn" type="submit" value="검색하기" />
                    </td>
                </tr>
            </table>
        </form>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <table id="manager_wrap">
            <tr>
                <td class="box1 title_box">티켓번호</td>
                <td class="box2 title_box">대상</td>
                <td class="box3 title_box">분류</td>
                <td class="box4 title_box">구매자</td>
                <td class="box5 title_box">구매자번호(확인용)</td>
                <td class="box6 title_box">구매처</td>
                <td class="box7 title_box">사용가능처</td>
                <td class="box8 title_box">구매일</td>
                <td class="box9 title_box">반품일</td>
            </tr>
            <c:choose>
                <c:when test="${!empty list}">
                    <c:forEach var="ticket" items="${list}">
                        <tr>
                            <td class="box1 textstyle">${ticket.tNum}</td>
                            <td class="box2 textstyle">${ticket.forWho}</td>
                            <td class="box3 textstyle">${ticket.forWhen}</td>
                            <td class="box4 textstyle">${ticket.uName}</td>
                            <td class="box5 textstyle">${ticket.uPhoneNum}</td>
                            <td class="box6 textstyle">${ticket.market}</td>
                            <td class="box7 textstyle">${ticket.tArea}</td>
                            <td class="box8 textstyle"><f:formatDate value="${ticket.sellDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="box9 textstyle"><f:formatDate value="${ticket.useDate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${!empty pm}">
                        <tr>
                            <td class="nextbox" colspan="9">
                                <c:if test="${pm.prev}">
                                    <a href="${path}/master/refundTicketInfo${pm.search(pm.startPage - 1)}">[이전]</a>
                                </c:if>
                                <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
                                    <c:choose>
                                        <c:when test="${i eq pm.cri.page}">
                                            <span id="selectedPage">[${i}]</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${path}/master/refundTicketInfo${pm.search(i)}">[${i}]</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${pm.next}">
                                    <a href="${path}/master/refundTicketInfo${pm.search(pm.endPage + 1)}">[다음]</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8">조회 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </sec:authorize>
</div>




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

    $("#re").click(function (){
        location.reload();
    });

</script>
</body>
</html>
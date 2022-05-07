<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/10
  Time: 9:31 PM
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
    <title>리뷰</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        .banner_section{
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


        #noticedetail_wrapwrap{
            position: relative;
            top: 800px;
            width: 1440px;
            height: 793px;
        }

        #noticedetail_wrap{
            position: relative;
            border-collapse: collapse;
            margin-left: 260px;
        }

        .table_detailbox{
            position: relative;
            border: 1px solid black;
        }

        .titlebox{
            background-color: #ffc4b0;
        }
        .box1{
            position: relative;
            width: 200px;
            height: 55px;
            text-align: center;
            font-size: 19px;
            border-left: none;
        }
        .box2{
            position: relative;
            width: 700px;
            height: 55px;
            font-size: 17px;
            padding-left: 50px;
            border-right: none;
        }
        .box3{
            position: relative;
            width: 900px;
            padding: 25px;
            line-height: 40px;
            border-right: none;
            border-left: none;
        }

        .noticeBtn1{
            position: relative;
            font-size: 17px;
            padding: 5px 20px;
            margin-left: 260px;
            margin-top: 20px;
            border: none;
            border-radius: 10px;
            background-color: #fe5c24;
            color: white;
            cursor: pointer;
            transition: 0.5s;
        }
        .noticeBtn1:hover{
            background-color: #2493e0;
        }
        .noticeBtn2{
            position: relative;
            font-size: 17px;
            padding: 5px 20px;
            left: 580px;
            margin-top: 20px;
            border: none;
            border-radius: 10px;
            background-color: #2493e0;
            color: white;
            cursor: pointer;
            transition: 0.5s;
        }
        .noticeBtn2:hover{
            background-color: #fe5c24;
        }


        /*                      footer                  */
        footer{
            top: 1050px;
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

<section class="banner_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">리 뷰(상세보기)</span>
        <span class="subbanner_title_text2">.review detail</span>
    </div>
</section>

<div id="noticedetail_wrapwrap">
    <table id="noticedetail_wrap">
        <tr>
            <td class="table_detailbox box1 titlebox">제목</td>
            <td class="table_detailbox box2 titlebox">${review.rTitle}</td>
        </tr>
        <tr>
            <td class="table_detailbox box1">별점</td>
            <td class="table_detailbox box2">
                <c:forEach var="i" begin="1" end="${review.rPoint}">
                    ⭐
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td class="table_detailbox box1">작성자</td>
            <td class="table_detailbox box2">${review.rWriter}</td>
        </tr>
        <tr>
            <td class="table_detailbox box1">작성일</td>
            <td class="table_detailbox box2"><f:formatDate value="${review.rDate}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <td class="table_detailbox box3" colspan="2">
                ${review.rContent}
            </td>
        </tr>
    </table>

    <form id="form">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="rNum" value="${review.rNum}" />
        <input type="hidden" name="page" value="${cri.page}" />
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="loginMember" property="principal.member"/>
            <input type="hidden" name="rUserNum" value="${loginMember.uNum}" />
        </sec:authorize>
    </form>

    <button class="noticeBtn1" type="button" onclick="toList()">목록으로 돌아가기</button>
    <c:choose>
        <c:when test="${loginMember.uNum != review.rUserNum}">
            <sec:authorize access="hasRole('ROLE_MASTER')">
            <button class="noticeBtn2" type="button" onclick="modifyNotice()">수정하기</button>
            <button class="noticeBtn2" type="button" onclick="deleteNotice()">삭제하기</button>
            </sec:authorize>
        </c:when>
        <c:otherwise>
            <button class="noticeBtn2" type="button" onclick="modifyNotice()">수정하기</button>
            <button class="noticeBtn2" type="button" onclick="deleteNotice()">삭제하기</button>
        </c:otherwise>
    </c:choose>


</div>

<jsp:include page="../commons/footer.jsp"/>



<script>

    console.log(${cri.page});
    console.log(${cri.perPageNum});

    var formObj = $("#form");

    function toList() {
        formObj.attr("action", "${path}/community/review").submit();
    }

    function modifyNotice() {
        formObj.attr("action", "${path}/community/reviewModify").submit();
    }

    function deleteNotice() {
        confirm("정말 삭제하시겠습니까?");
        formObj.attr("action", "${path}/community/reviewDelete").submit();
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

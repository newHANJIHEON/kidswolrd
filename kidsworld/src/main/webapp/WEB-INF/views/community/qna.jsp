<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/01
  Time: 3:48 PM
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
    <title>질문과 답변</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        a:hover {
            color: #fe5c24;
        }

        #selectedPage {
            color: #fe5c24;
        }


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


        #qna_wrapwrap{
            position: relative;
            top: 800px;
            width: 1440px;
            height: 800px;
            /*margin-left: 170px;*/
        }
        #qna_headtitle{
            position: relative;
            width: 500px;
            height: 60px;
            font-size: 40px;
            margin-left: 200px;
            border-left: 3px solid #fe5c24;
            padding-left: 20px;
            margin-bottom: 60px;
        }
        #qna_headtitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, #ffe359 0%, #fff2ac 100%);
        }
        #qna_headtitle{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, rgb(131, 243, 243) 0%, rgb(250, 250, 246) 100%);
        }

        #qna_wrap{
            position: relative;
            border-collapse: collapse;
            margin-left: 200px;
        }

        .box1{
            border: 1px solid black;
            border-left: none;
            width: 150px;
            height: 50px;
            text-align: center;
        }
        .box2{
            border: 1px solid black;
            height: 50px;
            width: 500px;
        }
        .box3{
            border: 1px solid black;
            width: 150px;
            height: 50px;
            text-align: center;
        }
        .box4{
            border: 1px solid black;
            border-right: none;
            width: 200px;
            height: 50px;
            text-align: center;
        }
        .box5{
            text-align: center;
            border: none;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        .title_box{
            background-color: #b0dfff;
            text-align: center;
            height: 60px;
            font-size: 20px;
        }
        #qnaText_box{
            padding-left: 30px;
        }


        #qnaBtn{
            position: relative;
            background-color: #fe5c24;
            color: white;
            font-size: 19px;
            padding: 2px 15px;
            border: none;
            border-radius: 10px;
            top: -5px;
            left: 1099px;
            cursor: pointer;
            transition: 0.5s;
        }
        #qnaBtn:hover{
            background-color: #2493e0;
        }



        /*                      footer                  */
        footer{
            top: 1000px;
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
        <span class="subbanner_title_text">질문과 답변</span>
        <span class="subbanner_title_text2">.Q n A</span>
    </div>
</section>


<div id="qna_wrapwrap">
    <h1 id="qna_headtitle">질문과 답변</h1>
    <table id="qna_wrap">
        <tr>
            <td class="box1 title_box">번 호</td>
            <td class="box2 title_box">제 목</td>
            <td class="box3 title_box">작 성 자</td>
            <td class="box4 title_box">작 성 날 짜</td>
        </tr>
        <c:choose>
            <c:when test="${!empty list}">
                <c:forEach var="qnas" items="${list}">
                    <c:choose>
                        <c:when test="${qnas.qDelete eq 'N'}">
                            <tr>
                                <td class="box1">
                                    <c:choose>
                                        <c:when test="${qnas.depth == 0}">
                                            ${qnas.origin}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="box2" id="qnaText_box">
                                    <c:forEach var="i" begin="1" end="${qnas.depth}">
                                        &nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                    <c:if test="${qnas.depth != 0}">
                                        ㄴ
                                    </c:if>
                                    <sec:authorize access="isAuthenticated()">
                                        <sec:authentication var="loginMember" property="principal.member"/>
                                        <a href="${path}/community/qnaRead?qNum=${qnas.qNum}&page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&uNum=${loginMember.uNum}">${qnas.qTitle}</a>
                                    </sec:authorize>
                                    <sec:authorize access="isAnonymous()">
                                        <a href="${path}/community/qnaRead?qNum=${qnas.qNum}&page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&uNum=${0}">${qnas.qTitle}</a>
                                    </sec:authorize>
                                </td>
                                <td class="box3">${qnas.qWriter}</td>
                                <td class="box4"><f:formatDate value="${qnas.qDate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${!empty pm}">
                    <tr>
                        <td class="box5" colspan="4">
                            <c:if test="${pm.prev}">
                                <a href="${path}/community/qna${pm.search(pm.startPage - 1)}">[이전]</a>
                            </c:if>
                            <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
                                <c:choose>
                                    <c:when test="${i eq pm.cri.page}">
                                        <span id="selectedPage">[${i}]</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${path}/community/qna${pm.search(i)}">[${i}]</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pm.next}">
                                <a href="${path}/community/qna${pm.search(pm.endPage + 1)}">[다음]</a>
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">질문과 답변이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
    <sec:authorize access="isAuthenticated()">
        <a id="qnaBtn" href="${path}/community/qnaWrite">질의 쓰기</a>
    </sec:authorize>
</div>




<jsp:include page="../commons/footer.jsp"/>




<script>

    if ("${message}" !== "") {
        alert("${message}");
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
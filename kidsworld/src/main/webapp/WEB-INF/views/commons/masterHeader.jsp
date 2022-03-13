<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>

<header>

    <div class="nav_down">
        <div class="head_login">
            <sec:authorize access="hasRole('ROLE_MASTER')">
                <span class="head_text" id="master"><a href="${path}/">일반 페이지</a></span>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication var="loginMember" property="principal.member"/>
                <span class="head_text head_text1"><a href="${path}/user/userInfo">${loginMember.uName}</a>님 반갑습니다.</span>
                <span class="head_text"><a href="${path}/user/logout">로그아웃</a></span>
            </sec:authorize>
        </div>
    </div>

    <div class="header_wrap">
        <nav class="nav02">
            <a href="${path}"><img src="${path}/resources/img/logo_img/logo1.png" alt="로고" id="logo_img"/></a>
            <ul>
                <li><div class="button_wrap"><a href="${path}/master/ticketManage">사용처리</a></div></li>
                <li><div class="button_wrap"><a href="${path}/master/usedTicketInfo">되돌리기</a></div></li>
                <li><div class="button_wrap"><a href="${path}/master/refundTicketInfo">반품목록</a></div></li>
                <li><div class="button_wrap"><a href="${path}/master/total">매출현황</a></div></li>
            </ul>
            <div>
                <ul class="nav navbar-nav">
                    <%----------------------------------------------%>
                    <%------------인가가 완료된 사용자인지 확인------------%>
                    <%----------------------------------------------%>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="loginMember" property="principal.member"/>
                        <li class="headerBtn">
                            <a id="re">새로고침</a>
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </nav>
    </div>


</header>
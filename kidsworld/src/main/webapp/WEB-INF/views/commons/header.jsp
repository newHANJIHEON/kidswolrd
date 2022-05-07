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
                <span class="head_text" id="master"><a href="${path}/master/ticketManage">관리자 페이지</a></span>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication var="loginMember" property="principal.member"/>
                <span class="head_text head_text1"><a href="${path}/user/userInfo">${loginMember.uName}</a>님 환영합니다.</span>
                <span class="head_text"><a href="${path}/ticket/myTicketInfo?uPhoneNum=${loginMember.uPhoneNum}">예매목록</a></span>
                <span class="head_text"><a href="${path}/user/logout">로그아웃</a></span>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <span class="head_text head_text2"><a href="${path}/user/join">회원가입</a></span>
                <span class="head_text"><a href="${path}/user/login">로그인</a></span>
            </sec:authorize>
        </div>
    </div>

    <div class="header_wrap">
        <nav class="nav02">
            <a href="${path}"><img src="${path}/resources/img/logo_img/logo1.png" alt="로고" id="logo_img"/></a>
            <ul>
                <li>
                    <div class="button_wrap"><a href="${path}/info">이용안내</a></div>
                    <ul>
                        <li><div class="button_wrapwrap"><a href="${path}/info#ticketPrice">티켓 가격</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/info#FAQ">자주하는 질문</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/info#notice">유의사항</a></div></li>
                    </ul>
                </li>
                <li>
                    <div class="button_wrap"><a>지점 보기</a></div>
                    <ul>
                        <li><div class="button_wrapwrap"><a href="${path}/bexco">부산 벡스코</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/kintex">경기 킨텍스</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/exco">대구 엑스코</a></div></li>
                    </ul>
                </li>
                <li><div class="button_wrap"><a href="${path}/event">이벤트</a></div></li>
                <li>
                    <div class="button_wrap"><a>소통 공간</a></div>
                    <ul>
                        <li><div class="button_wrapwrap"><a href="${path}/community/notice">공지사항</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/community/qna">질의응답</a></div></li>
                        <li><div class="button_wrapwrap"><a href="${path}/community/review">방문후기</a></div></li>
                    </ul>
                </li>
                <li><div class="button_wrap"><a href="${path}/business">제휴문의</a></div></li>
            </ul>
            <div>
                <ul class="nav navbar-nav">
                    <%----------------------------------------------%>
                    <%------------인가가 완료된 사용자인지 확인------------%>
                    <%----------------------------------------------%>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="loginMember" property="principal.member"/>
                        <li class="headerBtn">
                            <a href="${path}/ticket/info">예매하기</a>
                        </li>
                    </sec:authorize>
                    <%----------------------------------------------%>
                    <%------------인가정보가 없는 사용자의 경우------------%>
                    <%----------------------------------------------%>
                    <sec:authorize access="isAnonymous()">
                        <li class="headerBtn">
                            <a href="${path}/user/login">예매하기</a>
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </nav>
    </div>


</header>
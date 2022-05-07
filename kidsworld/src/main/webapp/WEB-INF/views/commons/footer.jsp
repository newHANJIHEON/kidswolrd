<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/01
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

<footer>

    <div class="newfooter-wrap">

        <div class="fontwrap">
            <span>(주)상상체험 키즈월드</span>
        </div>

        <div class="fontwrap">
            <span>주소 : 부산광역시 부산진구 서면로 123-123 서면타워 5층</span>
        </div>

        <div class="fontwrap">
            <span>대표이사 : 홍길동  ⎢  사업자등록번호 : 123-12-12345  ⎢  통신판매업 신고번호 : 제1234-부산진구-1234호</span>
        </div>

        <div class="fontwrap">
            <span>고객센터 : 1234-1234  ⎢  사업문의 : 4321-4321    ⎢    이메일 : kidsworld1234@naver.com</span>
        </div>

        <div class="fontwrap">
            <span>copyright @ H&K1234. All rights reserve.</span>
        </div>

        <img id="footlogo_img" src="${path}/resources/img/logo_img/logo3.png"/>

    </div>



</footer>

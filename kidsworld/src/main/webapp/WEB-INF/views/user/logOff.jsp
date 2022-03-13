<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/02
  Time: 12:36 PM
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
    <title>중복로그인</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
</head>
<body>
    <h1>중복로그인이 감지되었습니다</h1>
    <h5>다른 위치에서의 중복로그인이 감지되었습니다. 다시 로그인 해주시기 바랍니다.</h5>
    <h5><a href="${path}/user/login"></a>로그인 하러가기</h5>
    <h5><a href="${path}"></a>홈으로 돌아가기</h5>
</body>
</html>

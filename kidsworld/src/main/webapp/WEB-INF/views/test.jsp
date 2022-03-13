<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<style>

	</style>
</head>
<body>
<form action="${path}/join" method="post" id="joinForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" id="uId" name="uId" />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" id="uPassword" name="uPassword" />
			</td>
		</tr>
		<tr>
			<td>비밀번호 재입력</td>
			<td>
				<input type="password" id="uPasswordCheck" name="uPasswordCheck" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="uName" name="uName" />
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" id="uPhoneNum" name="uPhoneNum" />
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" id="uBirth" name="uBirth" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="제출" />
			</td>
		</tr>
	</table>
</form>

<script>

	// 규칙 추가
	$.validator.addMethod("regex",function(value,element,regexpr){
		// element : 검증 대상 요소
		// value : 검증 대상 요소가 가진 value 값
		// regexpr : 검증에 필요한 값 - 정규표현식
		return regexpr.test(value);
	});

	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;		// 특수문자 포함 비밀번호
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;						// mobile -표시 없이 숫자만

	$("#joinForm").validate({
		rules : {
			uId : {
				required : true,
				email : true
			},
			uPassword : {
				required : true,
				minlength : 8,
				maxlength : 16,
				regex : regexPass
			},
			uPasswordCheck : {
				required : true,
				equalTo : "#uPassword"
			},
			uName : {
				required : true,
				rangelength : [2, 6]
			},
			uPhoneNum : {
				required : true,
				regex : regexMobile
			},
			uBirth : {
				rangelength : [8, 8],
				required : true
			}
		},
		messages : {
			uId : {
				required : "이메일을 작성해주세요.",
				email : "올바른 이메일 형식이 아닙니다."
			},
			uPassword : {
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상으로 작성해주세요.",
				maxlength : "비밀번호는 최대 16글자 이하로 작성해주세요.",
				regex : "비밀번호는 특수문자와 숫자를 포함해야 합니다."
			},
			uPasswordCheck : {
				required : "비민번호확인을 작성해주세요.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			uName : {
				required : "이름을 작성해주세요.",
				rangelength : $.validator.format("문자 길이가 {0}에서 {1} 사이의 값을 입력해주세요.")
			},
			uPhoneNum : {
				required : "전화번호를 입력해주세요.",
				regex : "올바른 전화번호 형식이 아닙니다."
			},
			uBirth : {
				rangelength : "생년월일은 8자리로 작성해주세요.",
				required : "생년월일을 작성해주세요.",
			}
		},
		errorElement : "span",
		errorClass : "text_danger"
	});

	$.validator.setDefaults({
		submitHandler : function () {
			$("#joinForm").submit();
		}
	});

	//security를 사용하고 있기 때문에,
	//ajax 통신에 암호화 토큰을 넣어주기 위한 수식 - 값마다 따로 data에 토큰을 넣어주면 귀찮으니 통신마다 일어나도록 일괄처리하였다.
	//form태그 post 수신은 해당 태그 안에 따로 넣어주어야 한다(request이지 ajax통신이 아니니까).
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(
				"${_csrf.headerName}",
				"${_csrf.token}");
	});

</script>

</body>
</html>

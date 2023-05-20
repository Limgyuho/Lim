<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="main" method="post">
		<div class="center">
			<div class="login-form">
				<h1 class="text-2xl">대한민국 공공기관</h1>
				<hr />
				<hr />
				<div class="mt-5">
					<input type="text" name="loginId" placeholder="아이디" required>
				</div>
				<div class="input-field">
					<input type="password" name="loginPw" placeholder="비밀번호" required>
				</div>
				<div class="button-row">
					<button class="btn btn-outline btn-success type="submit">로그인</button>
	</form>
	<a class="btn-text-link btn btn-active mr-2 " href="/usr/member/join">회원가입</a>
	</div>
	</div>
	</div>

</body>
</html>
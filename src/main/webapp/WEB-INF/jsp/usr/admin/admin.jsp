<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp" %>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->


<form action="doLogin" method="POST">
	<div class="center">
	    <div class="login-form">
	        <h1 class="text-2xl">어드민 페이지</h1>
	        <hr />
	        <hr />
	        <div class="mt-5">
	            <input type="text" name="loginId" placeholder="아이디" >
	        </div>
	        <div class="input-field">
	            <input type="text" name="loginPw" placeholder="비밀번호" >
	        </div>
	        <div class="button-row">
	            <button class="btn btn-outline btn-success" type="submit">로그인</button>
	            
	        </div>
	
	        <p id="statusMessage"></p>
	    </div>
	</div>
</form>
</body>
</html>
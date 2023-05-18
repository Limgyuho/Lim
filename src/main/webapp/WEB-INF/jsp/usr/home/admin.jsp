<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="center">
	    <div class="login-form">
	        <h1 class="text-2xl">어드민 페이지</h1>
	        <hr />
	        <hr />
	        <div class="mt-5">
	            <input type="text" name="username" placeholder="아이디" required>
	        </div>
	        <div class="input-field">
	            <input type="password" name="password" placeholder="비밀번호" required>
	        </div>
	        <div class="button-row">
	            <button onclick="location.href='admindashboard'" class="btn btn-outline btn-success" type="submit">로그인</button>
	            
	        </div>
	
	        <p id="statusMessage"></p>
	    </div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>

<title></title>
</head>
<body>

<div class="w-52 h-20 bg-green-400">
	<input type="hidden" name="id" value="${member.id }"/>
    <div class="logo">
        <img src="로고 이미지 URL" alt="로고">
    </div>
    <div class="user-info">
        <img src="사용자 이미지 URL" alt="사용자 이미지" class="user-image">
        <span class="department">소속</span>
        <span class="username">직급<span>
        <span class="username">직급<span>
         <span>${rq.loginedMember.name }</span>
       <span class="Messenger" >메신저</span>
        <a href="/usr/home/home">로그아웃</a>
        
        <div class="w-80 h-60 border-black"></div>
        <div class="w-80 h-60 border-black"></div>
    </div>
</div>
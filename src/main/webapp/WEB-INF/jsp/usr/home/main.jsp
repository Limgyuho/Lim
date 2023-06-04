<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>

<div class="w-52 h-20 border-black">
	<input type="hidden" name="id" value="${member.id }"/>
    <div class="user-info">
        <span>${rq.loginedMember.department }</span>
        <span>${rq.loginedMember.position }</span>
        <span>${rq.loginedMember.name }</span>
       	<span class="Messenger" >메신저</span>
        <a href="/usr/home/home">로그아웃</a>
    </div>
</div>
<div class="flex mt-5 justify-center">
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
</div>
<%@ include file="../common/bottom.jsp" %>
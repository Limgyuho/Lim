<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>

<div class="flex-jc-c flex-ai-c h-20 flex  mx-auto text-3xl bg-red-50">
	<a href="/usr/home/main" class="block">대한민국 정부 기관</a>
</div>
<div class="top-bar con-min-width">
	<div class=" flex flex-ai-c ">	
		<nav class="menu-box-1 w-full">
			<ul class="flex justify-center height-100p justify-between">
				<li><a href="" class="block"></a></li>
				<li><a href="/usr/article/suggestion" class="block">건의/요청사항</a></li>
				<li><a href="/usr/article/transferList" class="block">인사 이동</a></li>
				<li><a href="/usr/article/departmentalData" class="block">부서별 자료</a></li>
<!-- 				<li><a href="/usr/article/transmission" class="block">개인 자료전송</a></li> -->
				<li><a href="/usr/article/program" class="block">필수 프로그램</a></li>
				<li><a href="/usr/article/leave" class="block">휴가/보고</a></li>
				<li><a href="#" class="block"></a></li>
			</ul>
		</nav>
	</div>
</div>

<div class="w-52 h-20 border-black">
    <div class="user-info">
        <span>${rq.loginedMember.department }</span>
        <span>${rq.loginedMember.position }</span>
        <span>${rq.loginedMember.name }</span>
       	<span class="Messenger" >메신저</span>
        <a href="/usr/home/home">로그아웃</a>
    </div>
</div>


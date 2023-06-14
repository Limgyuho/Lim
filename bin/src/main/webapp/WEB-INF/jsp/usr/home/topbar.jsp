<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>

<div class="flex-jc-c flex-ai-c h-20 flex  mx-auto text-3xl">
	<a href="/usr/home/main" class="block">대한민국 정부 기관</a>
</div>
<div class="top-bar con-min-width mb-3">
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

<div class="border-black w-48">
    <ul class="user-info">
        <li>부서 : ${rq.loginedMember.department }</li>
        <li>직급 : ${rq.loginedMember.position }</li>
        <li>이름 : ${rq.loginedMember.name }</li>
       	<li class="Messenger" >메신저</li>
        <a href="/usr/home/home">로그아웃</a>
    </ul>
</div>
<div>


</div>


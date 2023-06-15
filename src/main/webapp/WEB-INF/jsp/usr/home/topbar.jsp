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
				<li><a href="/usr/article/api" class="block">api</a></li>
				<li><a href="#" class="block"></a></li>
			</ul>
		</nav>
	</div>
</div>


<div class="flex">
	<div class="flex">
	  <div class="border-black w-48 p-4">
	    <ul class="user-info">
	      <li class="mb-4">
	        <span class="text-lg font-bold">프로필</span>
	      </li>
	      <li class="mb-2">
	        <span class="text-sm">부서:</span>
	        <span class="ml-2 text-base font-bold">${rq.loginedMember.department }</span>
	      </li>
	      <li class="mb-2">
	        <span class="text-sm">직급:</span>
	        <span class="ml-2 text-base font-bold">${rq.loginedMember.position }</span>
	      </li>
	      <li class="mb-2">
	        <span class="text-sm">이름:</span>
	        <span class="ml-2 text-base font-bold">${rq.loginedMember.name }</span>
	      </li>
	      <li class="mb-4 Messenger text-blue-500 hover:underline">
	      	메신저
	      </li>
	      <li>
	        <a href="/usr/home/home" class="text-red-500 hover:underline">로그아웃</a>
	      </li>
	    </ul>
	  </div>
	</div>

	
	
	<div class="text-center">ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㄹㅇㅁㄴㅇㄹ</div>


</div>


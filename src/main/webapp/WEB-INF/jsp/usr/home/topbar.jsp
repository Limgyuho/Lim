<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>

<div class="flex-jc-c flex-ai-c h-20 flex  mx-auto text-3xl">
	<a href="/usr/home/main" class="block">대한민국 정부 기관</a>
</div>



<div class="top-bar">
	<div class="flex flex-ai-c">
		<nav class="menu-box-1 w-full">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="/usr/article/suggestion">건의/요청사항</a></li>
				<li><a href="/usr/article/transferList">인사 이동</a></li>
				<li><a href="/usr/article/departmentalData">부서별 자료</a></li>
				<li><a href="/usr/article/program">필수 프로그램</a></li>
				<li><a href="/usr/article/leave">휴가/보고</a></li>
				<li><a href="/usr/article/bus">기관 일정</a></li>
				<li><a href="/usr/article/api">API</a></li>
			</ul>
		</nav>
	</div>
</div>



<div class="flex">
	<div class="flex">
		<div class="border-black w-48 p-4">
			<ul class="user-info">
				<li class="mb-4"><span class="text-lg font-bold">프로필</span></li>
				<li class="mb-2"><span class="text-sm">부서:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.department }</span>
				</li>
				<li class="mb-2"><span class="text-sm">직급:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.position }</span>
				</li>
				<li class="mb-2"><span class="text-sm">이름:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.name }</span></li>
				<li class="mb-4 Messenger text-blue-500 hover:underline">메신저</li>
				<li><a href="/usr/home/home"
					class="text-red-500 hover:underline">로그아웃</a></li>
			</ul>
		</div>
	</div>
	
<div class="flex border-red w-full">
  <div class="h-80">
    <div class="slider-container">
      <div class="slider-wrapper">
        <div class="slider-slide">
          <img src="/resource/images/제목 없음.png" alt="Image 1">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/제목 없음.png" alt="Image 2">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/제목 없음.png" alt="Image 3">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/제목 없음.png" alt="Image 4">
        </div>
      </div>
      <div class="slider-button slider-button-prev">&lt;</div>
      <div class="slider-button slider-button-next">&gt;</div>
    </div>
  </div>
</div>
</div>


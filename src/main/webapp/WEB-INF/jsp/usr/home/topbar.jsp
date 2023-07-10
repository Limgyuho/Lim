<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<script>
	$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Sejong&appid=8d2c2532f986952207c7366b1feffb69&units=metric',
			function(result){
		console.log(result.dt);
		$('.ctemp').append(result.main.temp);
		$('.lowtemp').append(result.main.temp_min);
		$('.highttemp').append(result.main.temp_max);
// 		result.weather[0].icon
		var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].icon.description+'" />'
		$('.icon').html(wiconUrl);
		
		var ct = result.dt;
		
		function convertTime(t){
			var ot = new Date(t*1000);
			console.log(t);
			//Tue Jun 20 2023 20:29:54 GMT+0900 (한국 표준시)
			var hr = ot.getHours();
			var m = ot.getMinutes();
			var s = ot.getSeconds();
			
			return hr+':'+m+':'+s
		}
		
		var currentTime= convertTime(ct);
		$('.time').append(currentTime);
		
	});
	
</script>
<div class="flex my-9">
	<div class="flex justify-start">
	    <img src="/resource/images/정보로고1.png" alt="Image 8" class="ml-5">
	</div>
	<div class="flex justify-center items-center  text-5xl w-full">
	  <a href="/usr/home/main" class="block " style="margin-left: 10px;">대한민국 정부 기관</a>
	  <div class="" style="position: absolute; right: 0;">
	    <div class="time text-sm">현재 시간 :</div>
	    <div class="ctemp text-sm">현재 온도 :</div>
	    <div class="highttemp text-sm">최고 온도 :</div>
	    <div class="icon text-sm"></div>	
	  </div>
	</div>
</div>





<div class="top-bar">
	<div class="flex flex-ai-c">
		<nav class="menu-box-1 w-full">
			<ul>
				<li><a href="/usr/home/main">Home</a></li>
				<li><a href="/usr/article/suggestion">용품,차량대여</a></li>
				<li><a href="/usr/article/transferList">인사 이동</a></li>
				<li><a href="/usr/article/departmentalData">부서별 자료</a></li>
				<li><a href="/usr/article/program">필수 프로그램</a></li>
				<li><a href="/usr/article/leave">휴가/보고</a></li>
				<li><a href="/usr/article/bus">통근 버스</a></li>
				<li><a href="/usr/chat/roomlist">온나라 </a></li>
			</ul>
		</nav>
	</div>
</div>
<section class="">
		<div class="container mx-auto px-3 h-full ">
			<a href="/usr/message/kakao" class="btn btn-success mr-2">카카오톡으로 가입문자 보내기</a>
			<a href="/usr/message/test" class="btn btn-success">문자로 메시지 보내기</a>
		</div>
	</section>



<div class="flex">
	<div class="flex">
		<div class="rounded-2xl border border-gray-300 w-48 p-4">
			<div class="mb-4 myPage text-lg font-bold ">마이 페이지</div>
			<ul class="user-info">
				<li class="mb-2"><span class="text-sm">부서:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.department }</span>
				</li>
				<li class="mb-2"><span class="text-sm">직급:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.position }</span>
				</li>
				<li class="mb-2"><span class="text-sm">이름:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.name }</span></li>	
				<li class="mb-4 Messenger text-blue-500 hover:underline">메신저</li>
				<li><a href="/usr/member/doLogout"class="text-red-500 hover:underline">로그아웃</a></li>				
			</ul>
		</div>
	</div>
	
<div class="flex w-full">
  <div class="h-80">
    <div class="slider-container">
      <div class="slider-wrapper">
        <div class="slider-slide">
          <img src="/resource/images/홍보.png" alt="Image 1">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/보이스피싱.png" alt="Image 2">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/컨설티.png" alt="Image 3">
        </div>
        <div class="slider-slide">
          <img src="/resource/images/보호.png" alt="Image 4">
        </div>
      </div>
    </div>
  </div>
</div>
</div>


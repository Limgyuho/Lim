<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<script>
	$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Sejong&appid=8d2c2532f986952207c7366b1feffb69&units=metric',
			function(result){
		
		$('.ctemp').append(result.main.temp);
		$('.lowtemp').append(result.main.temp_min);
		$('.highttemp').append(result.main.temp_max);
// 		result.weather[0].icon
		var wiconUrl = '<img src="https://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].icon.description+'" />'
		$('.icon').html(wiconUrl);
		
		var ct = result.dt;
		
		function convertTime(t){
			var ot = new Date(t*1000);
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

<div class="flex justify-center items-center my-9 text-4xl">
  <a href="/usr/home/main" class="block">대한민국 정부 기관</a>
  <div class="border-red" style="position: absolute; right: 0;">
    <div class="time text-sm">현재 시간 :</div>
    <div class="ctemp text-sm">현재 온도 :</div>
    <div class="highttemp text-sm">최고 온도 :</div>
    <div class="icon text-sm"></div>	
  </div>
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
				<li><a href="/usr/article/bus">통근 버스</a></li>
				<li><a href="/usr/article/api">API</a></li>
			</ul>
		</nav>
	</div>
</div>



<div class="flex">
	<div class="flex">
		<div class="border-black w-48 p-4">
			<ul class="user-info">
				<li class="mb-4"><a href="/usr/home/myPage" class="text-lg font-bold myPage">마이 페이지</a></li>
				<li class="mb-2"><span class="text-sm">부서:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.department }</span>
				</li>
				<li class="mb-2"><span class="text-sm">직급:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.position }</span>
				</li>
				<li class="mb-2"><span class="text-sm">이름:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.name }</span></li>	
				<li class="mb-4 Messenger text-blue-500 hover:underline">메신저</li>
				<li><a href="/usr/home/home"class="text-red-500 hover:underline">로그아웃</a></li>				
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


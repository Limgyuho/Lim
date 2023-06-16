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
                <li><a href="/usr/article/schedule">기관 일정</a></li>
                <li><a href="/usr/article/api">API</a></li>
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

	
	
<div class="flex border-red w-full">
    <div class="h-80 w-min">
        <script>
            $(document).ready(function () {
                var sliderWrapper = $(".slider-wrapper");
                var slideWidth = sliderWrapper.width() / 4;
                var slideIndex = 0;
                var totalSlides = 4; // 이미지의 총 개수

                $(".slider-button-prev").click(function () {
                    slideIndex--;
                    if (slideIndex < 0) {
                        slideIndex = totalSlides - 1; // 첫 번째 이미지에서 이전 버튼을 누르면 마지막 이미지로 이동
                    }
                    updateSliderPosition();
                });

                $(".slider-button-next").click(function () {
                    slideIndex++;
                    if (slideIndex >= totalSlides) {
                        slideIndex = 0; // 마지막 이미지에서 다음 버튼을 누르면 첫 번째 이미지로 이동
                    }
                    updateSliderPosition();
                });

                setInterval(function () {
                    slideIndex++;
                    if (slideIndex >= totalSlides) {
                        slideIndex = 0; // 마지막 이미지에서 다음 버튼을 누르면 첫 번째 이미지로 이동
                    }
                    updateSliderPosition();
                }, 3000); 

                function updateSliderPosition() {
                    var leftPosition = -slideWidth * slideIndex;
                    sliderWrapper.css("left", leftPosition);
                }
            });
        </script>
        <div class="slider-container">
            <div class="slider-wrapper">
                <div class="slider-slide"><img src="/resource/images/건축문의.jpg" alt="Image 1"></div>
                <div class="slider-slide"><img src="/resource/images/고령화.jpg" alt="Image 2"></div>
                <div class="slider-slide"><img src="/resource/images/주거사기.jpg" alt="Image 3"></div>
                <div class="slider-slide"><img src="/resource/images/지방세.jpg" alt="Image 4"></div>
            </div>
            <div class="slider-button slider-button-prev">&lt;</div>
            <div class="slider-button slider-button-next">&gt;</div>
        </div>
    </div>
</div>




</div>


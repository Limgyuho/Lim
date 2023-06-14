<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>

<div class ="border-blue h-80 mt-5">
<script>
        $(document).ready(function () {
            var sliderWrapper = $(".slider-wrapper");
            var slideWidth = sliderWrapper.width() / 4;
            var slideIndex = 0;

            $(".slider-button-prev").click(function () {
                slideIndex--;
                if (slideIndex < 0) {
                    slideIndex = 5;
                }
                updateSliderPosition();
            });

            $(".slider-button-next").click(function () {
                slideIndex++;
                if (slideIndex > 5) {
                    slideIndex = 0;
                }
                updateSliderPosition();
            });

            function updateSliderPosition() {
                var leftPosition = -slideWidth * slideIndex;
                sliderWrapper.css("left", leftPosition);
            }
        });
    </script>
<div class="slider-container ">
        <div class="slider-wrapper">
            <div class="slider-slide"><img src="/resource/images/건축문의.jpg" alt="Image 1"></div>
            <div class="slider-slide"><img src="/resource/images/고령화.jpg" alt="Image 2"></div>
            <div class="slider-slide"><img src="/resource/images/주거사기.jpg" alt="Image 3"></div>
            <div class="slider-slide"><img src="/resource/images/지방세.jpg" alt="Image 4"></div>
            <div class="slider-slide"><img src="/resource/images/폭염.jpg" alt="Image 5"></div>
            <div class="slider-slide"><img src="/resource/images/폭염.jpg" alt="Image 6"></div>
            <div class="slider-slide"><img src="/resource/images/폭염.jpg" alt="Image 7"></div>
        </div>
        <div class="slider-button slider-button-prev">&lt;</div>
        <div class="slider-button slider-button-next">&gt;</div>
    </div>

</div>

<div class="flex mt-5 justify-center border-blue banner_list--wrap mvis_list slick-initialized slick-slider">

	 <div class="flex w-3/12 h-60 border-black block m-11 rounded-xl">
	 	<span class="text-2xl">인사이동 대상자</span>
	 	<div class="border-red h-5/6">
				<c:forEach var="member" items="${approvedMembers}">
					<ul>		
						<li>${member.id} ${member.regDate}<a href="/usr/article/transferdetail?memberId=${member.id}">${member.name}</a>${member.department}</li>
					</ul>
				</c:forEach>
		</div>
	 </div>
	 <div class="flex w-3/12 h-60 border-black block m-11 rounded-xl">
	 	<span class="text-2xl">건의/요청사항</span>
	 	<div class="border-red h-5/6">
		 	<c:forEach var="suggestion" items="${showsuggestion}">
				<div>
					<span>신청 사항 : ${suggestion.item}요청 결과 : </span>
					<c:choose>
						<c:when test="${suggestion.permission == 1}">
							<span>승인</span>
						</c:when>
						<c:when test="${suggestion.permission == -1}">
							<span> 거부</span>
						</c:when>
						<c:otherwise>
							<span> 대기중 </span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
		</div>
	 </div>

	 <div class="flex w-3/12 h-60 border-black block m-11 rounded-xl">
	 	<span class="text-2xl">필수 프로그램</span>
	 	<div class="border-red h-5/6">
	 		<c:forEach var="file" items="${files}">
				<ul>
					<li>${file.id}${file.orgName }<a href="/usr/article/file/${file.id}" download>
					  		<i class="fa-solid fa-download"></i>
						</a></li>
				</ul>
			</c:forEach>
		</div>		
	 </div>
	 
	 
	 <div class="flex w-3/12 h-60 border-black block m-11 rounded-xl">
	 	<span class="text-2xl">휴가/보고</span> 	
		<div class="border-red h-5/6">
		    <c:forEach var="vacation" items="${showVacation}">
			<ul>
				<li>${vacation.date}${vacation.vacationType1}${vacation.vacationType2} <c:if test="${vacation.status == 1}">
			            <span class="text-green-500">허가</span>
			          </c:if>
			          <c:if test="${vacation.status == 0}">
			            <span class="text-yellow-500">대기</span>
			          </c:if>
			          <c:if test="${vacation.status == -1}">
			            <span class="text-red-500">거부</span>
			          </c:if></li>
			</ul>
		    </c:forEach>
		</div>	 	
	 </div>
</div>


<%@ include file="../common/bottom.jsp"%>

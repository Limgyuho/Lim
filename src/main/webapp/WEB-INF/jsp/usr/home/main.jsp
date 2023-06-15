<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>

<!-- FullCalendar CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />

<!-- FullCalendar JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>



<div class="flex border-red mt-5">
	<div class =" h-80 w-min ">
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
	<div  id="calendar" class="border-blue">기관 일정 캘린더</div>
</div>
<script>
$(document).ready(function() {
  $('#calendar').fullCalendar({
    // 달력 옵션 설정
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    defaultView: 'month',
    // ...

    // 이벤트 데이터 로드
    events: '/events', // 서버에서 이벤트 데이터를 제공하는 URL

    // 일정 추가
    selectable: true,
    select: function(start, end) {
      var eventData = {
        title: '새로운 일정',
        start: start,
        end: end
      };
      // 서버에 일정 추가 요청
      $.ajax({
        url: '/addEvent',
        type: 'POST',
        data: JSON.stringify(eventData),
        contentType: 'application/json',
        success: function(response) {
          // 일정 추가 성공 시, 달력에 일정을 표시
          $('#calendar').fullCalendar('renderEvent', eventData, true);
        },
        error: function(xhr) {
          console.log('일정 추가 실패');
        }
      });
      $('#calendar').fullCalendar('unselect');
    },

    // 일정 수정 및 삭제
    editable: true,
    eventDrop: function(event, delta, revertFunc) {
      // 서버에 일정 수정 요청
      $.ajax({
        url: '/updateEvent',
        type: 'POST',
        data: JSON.stringify(event),
        contentType: 'application/json',
        success: function(response) {
          console.log('일정 수정 성공');
        },
        error: function(xhr) {
          console.log('일정 수정 실패');
          revertFunc(); // 일정 위치를 원래대로 되돌림
        }
      });
    },
    eventResize: function(event, delta, revertFunc) {
      // 서버에 일정 수정 요청
      $.ajax({
        url: '/updateEvent',
        type: 'POST',
        data: JSON.stringify(event),
        contentType: 'application/json',
        success: function(response) {
          console.log('일정 수정 성공');
        },
        error: function(xhr) {
          console.log('일정 수정 실패');
          revertFunc(); // 일정 크기를 원래대로 되돌림
        }
      });
    },
    eventClick: function(event) {
      if (confirm('일정을 삭제하시겠습니까?')) {
        // 서버에 일정 삭제 요청
        $.ajax({
          url: '/deleteEvent',
          type: 'POST',
          data: JSON.stringify(event),
          contentType: 'application/json',
          success: function(response) {
            console.log('일정 삭제 성공');
            $('#calendar').fullCalendar('removeEvents', event._id);
          },
          error: function(xhr) {
            console.log('일정 삭제 실패');
          }
        });
      }
    }
  });
});
</script>

<div class="flex mt-5 justify-center ">
    <div class="flex w-3/12 h-60  block m-11 rounded-xl">
        <div class="text-2xl bg-yellow-300">인사이동 대상자</div>
        <div class="h-5/6 mt-6">
            <ul class="m-0 p-0 space-y-2">
                <c:forEach var="member" items="${approvedMembers}">
                    <li>${member.regDate}<a href="/usr/article/transferdetail?memberId=${member.id}">${member.name}</a>${member.department}</li>
                    <hr />
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="flex w-3/12 h-60  block m-11 border-pink-500">
        <div class="text-2xl bg-pink-300">건의/요청사항</div>
        <div class="h-5/6 mt-6">
            <ul class="p-0 space-y-2">
                <c:forEach var="suggestion" items="${showsuggestion}">
                    <li>
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
                        <hr />
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="flex w-3/12 h-60  block m-11 rounded-xl">
        <div class="text-2xl bg-green-500">필수 프로그램</div>
        <div class="h-5/6 mt-6">
            <ul class="p-0 space-y-2">
                <c:forEach var="file" items="${files}">
                    <li>${file.id}${file.orgName}<a href="/usr/article/file/${file.id}" download>
                            <i class="fa-solid fa-download"></i>
                        </a></li>
                    <hr />
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="flex w-3/12 h-60  block m-11 rounded-xl">
        <div class="text-2xl bg-blue-500">휴가/보고</div>
        <div class="h-5/6 mt-6">
            <ul class="p-0 space-y-2">
                <c:forEach var="vacation" items="${showVacation}">
                    <li>${vacation.date}${vacation.vacationType1}${vacation.vacationType2}
                        <c:if test="${vacation.status == 1}">
                            <span class="text-green-500">허가</span>
                        </c:if>
                        <c:if test="${vacation.status == 0}">
                            <span class="text-yellow-500">대기</span>
                        </c:if>
                        <c:if test="${vacation.status == -1}">
                            <span class="text-red-500">거부</span>
                        </c:if>
                        <hr />
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>





<%@ include file="../common/bottom.jsp"%>

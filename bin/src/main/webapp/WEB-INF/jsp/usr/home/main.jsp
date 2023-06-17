<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>

<!-- FullCalendar CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css"
	rel="stylesheet" />

<!-- FullCalendar JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>


<script>
// $(document).ready(function() {
//   $('#calendar').fullCalendar({
//     // 달력 옵션 설정
//     header: {
//       left: 'prev,next today',
//       center: 'title',
//       right: 'month,agendaWeek,agendaDay'
//     },
//     defaultView: 'month',
//     // ...

//     // 이벤트 데이터 로드
//     events: '/events', // 서버에서 이벤트 데이터를 제공하는 URL

//     // 일정 추가
//     selectable: true,
//     select: function(start, end) {
//       var eventData = {
//         title: '새로운 일정',
//         start: start,
//         end: end
//       };
//       // 서버에 일정 추가 요청
//       $.ajax({
//         url: '/addEvent',
//         type: 'POST',
//         data: JSON.stringify(eventData),
//         contentType: 'application/json',
//         success: function(response) {
//           // 일정 추가 성공 시, 달력에 일정을 표시
//           $('#calendar').fullCalendar('renderEvent', eventData, true);
//         },
//         error: function(xhr) {
//           console.log('일정 추가 실패');
//         }
//       });
//       $('#calendar').fullCalendar('unselect');
//     },

//     // 일정 수정 및 삭제
//     editable: true,
//     eventDrop: function(event, delta, revertFunc) {
//       // 서버에 일정 수정 요청
//       $.ajax({
//         url: '/updateEvent',
//         type: 'POST',
//         data: JSON.stringify(event),
//         contentType: 'application/json',
//         success: function(response) {
//           console.log('일정 수정 성공');
//         },
//         error: function(xhr) {
//           console.log('일정 수정 실패');
//           revertFunc(); // 일정 위치를 원래대로 되돌림
//         }
//       });
//     },
//     eventResize: function(event, delta, revertFunc) {
//       // 서버에 일정 수정 요청
//       $.ajax({
//         url: '/updateEvent',
//         type: 'POST',
//         data: JSON.stringify(event),
//         contentType: 'application/json',
//         success: function(response) {
//           console.log('일정 수정 성공');
//         },
//         error: function(xhr) {
//           console.log('일정 수정 실패');
//           revertFunc(); // 일정 크기를 원래대로 되돌림
//         }
//       });
//     },
//     eventClick: function(event) {
//       if (confirm('일정을 삭제하시겠습니까?')) {
//         // 서버에 일정 삭제 요청
//         $.ajax({
//           url: '/deleteEvent',
//           type: 'POST',
//           data: JSON.stringify(event),
//           contentType: 'application/json',
//           success: function(response) {
//             console.log('일정 삭제 성공');
//             $('#calendar').fullCalendar('removeEvents', event._id);
//           },
//           error: function(xhr) {
//             console.log('일정 삭제 실패');
//           }
//         });
//       }
//     }
//   });
// });
</script>
<div class="flex items-end justify-end mt-24 px-10">
	<div id="calendar" class="mt-8"></div>
	<div class="p-4 rounded-lg border border-gray-300 h-96">
		<div class="text-xl bg-gray-300 text-gray-800 py-2 px-4">인사이동
			대상자</div>
		<div class="mt-6 overflow-y-auto">
			<ul class="m-0 p-0 space-y-2">
				<c:forEach var="member" items="${approvedMembers}">
					<li class="py-2"><span class="text-gray-800">${member.regDate}</span>
						<a href="/usr/article/transferdetail?memberId=${member.id}"
						class="text-blue-500 hover:underline">${member.name}</a> <span
						class="text-gray-800">${member.department}</span></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="p-4 ml-4 rounded-lg border border-gray-300 h-96">
		<div
			class="text-xl bg-gray-300 text-gray-800 py-2 px-4 rounded-t-lg w-80">건의/요청사항</div>
		<div class="mt-6 overflow-y-auto">
			<ul class="p-0 space-y-2">
				<c:forEach var="suggestion" items="${showsuggestion}">
					<li class="py-2"><span class="text-gray-800">신청 사항:
							${suggestion.item} 요청 결과: </span> <c:choose>
							<c:when test="${suggestion.permission == 1}">
								<span class="text-green-500">승인</span>
							</c:when>
							<c:when test="${suggestion.permission == -1}">
								<span class="text-red-500">거부</span>
							</c:when>
							<c:otherwise>
								<span class="text-yellow-500">대기중</span>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>



<div class="flex items-end justify-end mt-10 px-10">

	<div class="p-4 rounded-lg border border-gray-300 h-96">
		<div
			class="text-xl bg-gray-300 text-gray-800 py-2 px-4 rounded-t-lg w-80">필수
			프로그램</div>
		<div class="h-5/6 mt-6 overflow-y-auto">
			<ul class="p-0 space-y-2">
				<c:forEach var="file" items="${files}">
					<li class="py-2"><span class="text-gray-800">${file.id}
							${file.orgName}</span> <a href="/usr/article/file/${file.id}" download
						class="text-blue-500 hover:underline"> <i
							class="fa-solid fa-download"></i>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="p-4 ml-4 rounded-lg border border-gray-300 h-96">
		<div
			class="text-xl bg-gray-300 text-gray-800 py-2 px-4 rounded-t-lg w-80">휴가신청
			현황</div>
		<div class="h-5/6 mt-6 overflow-y-auto">
			<ul class="p-0 space-y-2">
				<c:forEach var="vacation" items="${showVacation}">
					<li class="py-2"><span class="text-gray-800">${vacation.date}
							${vacation.vacationType1}${vacation.vacationType2}</span> <c:choose>
							<c:when test="${vacation.status == 1}">
								<span class="text-green-500">허가</span>
							</c:when>
							<c:when test="${vacation.status == 0}">
								<span class="text-yellow-500">대기</span>
							</c:when>
							<c:when test="${vacation.status == -1}">
								<span class="text-red-500">거부</span>
							</c:when>
						</c:choose></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>






<%@ include file="../common/bottom.jsp"%>

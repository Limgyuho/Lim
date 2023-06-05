<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css' rel='stylesheet' />
 <div id='calendar'></div>
 <script src='https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js'></script>
 <script src='https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js'></script>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js'></script>
 <script>
$(document).ready(function() {
  $('#calendar').fullCalendar({
    selectable: true, // 날짜 선택 기능 활성화
    select: function(start, end) { // 날짜 선택 이벤트 핸들러
      var title = prompt('일정 제목을 입력하세요:');
      if (title) {
        var eventData = {
          title: title,
          start: start,
          end: end
        };
        $('#calendar').fullCalendar('renderEvent', eventData, true); // 선택한 날짜에 이벤트 추가
      }
      $('#calendar').fullCalendar('unselect'); // 날짜 선택 해제
    }
  });
});
</script>
<div class="fixed-bottom">
    <%@ include file="../common/bottom.jsp" %>
</div>
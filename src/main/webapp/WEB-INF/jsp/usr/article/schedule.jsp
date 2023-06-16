<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div id="calendar"></div>

<!-- 일정 추가 모달 -->
<div id="addModal" class="modal">
  <div class="modal-content">
    <h4>일정 추가</h4>
    <form id="addForm">
      <input type="text" id="startDate" placeholder="시작 날짜">
      <input type="text" id="endDate" placeholder="끝 날짜">
      <input type="text" id="title" placeholder="제목">
      <textarea id="description" placeholder="내용"></textarea>
      <button type="submit">추가</button>
    </form>
  </div>
</div>

<!-- 일정 수정 모달 -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <h4>일정 수정</h4>
    <form id="editForm">
      <input type="text" id="editStartDate" placeholder="시작 날짜">
      <input type="text" id="editEndDate" placeholder="끝 날짜">
      <input type="text" id="editTitle" placeholder="제목">
      <textarea id="editDescription" placeholder="내용"></textarea>
      <button type="submit">수정</button>
      <button id="deleteButton">삭제</button>
    </form>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
<script>
  $(document).ready(function() {
    // 달력 초기화
    $('#calendar').fullCalendar({
      events: '/api/schedule', // 스케줄 데이터를 제공하는 API의 URL
      // 기타 FullCalendar의 옵션들을 설정할 수 있습니다.
      // ...
    });

    // 일정 추가 모달 열기
    $('#addButton').click(function() {
      $('#addModal').modal('open');
    });

    // 일정 추가 폼 제출
    $('#addForm').submit(function(event) {
      event.preventDefault();
      var startDate = $('#startDate').val();
      var endDate = $('#endDate').val();
      var title = $('#title').val();
      var description = $('#description').val();

      // 서버로 데이터 전송 및 처리 로직 추가
      $.ajax({
        type: 'POST',
        url: '/api/schedule',
        data: {
          startDate: startDate,
          endDate: endDate,
          title: title,
          description: description
        },
        success: function(response) {
          // 일정 추가 후 달력 리로드
          $('#calendar').fullCalendar('refetchEvents');
          // 모달 닫기
          $('#addModal').modal('close');
        },
        error: function(xhr, status, error) {
          // 오류 처리 로직 추가
        }
      });
    });

    // 일정 수정 모달 열기
    $('#calendar').on('click', '.fc-event', function() {
      var eventId = $(this).data('eventid');
      var event = getEventById(eventId);

      $('#editStartDate').val(event.start.format('YYYY-MM-DD'));
      $('#editEndDate').val(event.end.format('YYYY-MM-DD'));
      $('#editTitle').val(event.title);
      $('#editDescription').val(event.description);

      $('#editModal').modal('open');
    });

    // 일정 수정 폼 제출
    $('#editForm').submit(function(event) {
      event.preventDefault();
      var startDate = $('#editStartDate').val();
      var endDate = $('#editEndDate').val();
      var title = $('#editTitle').val();
      var description = $('#editDescription').val();

      // 서버로 데이터 전송 및 처리 로직 추가
      $.ajax({
        type: 'PUT',
        url: '/api/schedule/' + eventId, // 수정할 일정의 eventId
        data: {
          startDate: startDate,
          endDate: endDate,
          title: title,
          description: description
        },
        success: function(response) {
          // 일정 수정 후 달력 리로드
          $('#calendar').fullCalendar('refetchEvents');
          // 모달 닫기
          $('#editModal').modal('close');
        },
        error: function(xhr, status, error) {
          // 오류 처리 로직 추가
        }
      });
    });

    // 일정 삭제 버튼 클릭
    $('#deleteButton').click(function(event) {
      event.preventDefault();
      
      // 선택한 일정의 eventId 가져오기
      var eventId = getSelectedEventId();

      // 서버로 데이터 전송 및 처리 로직 추가
      $.ajax({
        type: 'DELETE',
        url: '/api/schedule/' + eventId, // 삭제할 일정의 eventId
        success: function(response) {
          // 일정 삭제 후 달력 리로드
          $('#calendar').fullCalendar('refetchEvents');
          // 모달 닫기
          $('#editModal').modal('close');
        },
        error: function(xhr, status, error) {
          // 오류 처리 로직 추가
        }
      });
    });

    // 일정 데이터 가져오기
    function getEventById(eventId) {
      // 서버로 데이터 요청 및 처리 로직 추가
      // ...
      return {
        // 가져온 일정 데이터 반환
        // ...
      };
    }

    // 선택한 일정의 eventId 가져오기
    function getSelectedEventId() {	
      // 선택한 일정의 eventId 반환
      // ...
    }
  });
</script>

<%@ include file="../common/bottom.jsp"%>

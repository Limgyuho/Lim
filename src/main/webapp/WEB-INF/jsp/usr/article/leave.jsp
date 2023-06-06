<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<form action="/usr/article/leaveRequest" method="post">
	<label for="date">날짜:</label> <input type="text" id="date" name="date">
	<br> <br> <label for="vacationType">법정 휴가:</label> <select
		id="vacationType" name="vacationType">
		<option value="없음" selected>없음</option>
		<option value="연차">연차</option>
		<option value="월차">월차</option>
		<option value="반차">반차</option>
		<option value="가족돌봄휴가">가족돌봄휴가</option>
		<option value="공가">공가</option>
	</select>
	<ul>
		<li><span>연차: 1년을 계속 근로한 근로자가 근로기준법 요건에 해당하는 경우 받게 되는
				유급휴가입니다.</span></li>
		<li><span>월차: 연차 유급휴가를 가리키는 말이며, 1개월 만근 시 1일의 휴가를 받을 수 있는
				제도입니다.</span></li>
		<li><span>반차: 보통 오전과 오후로 나뉘는 휴가입니다.</span></li>
	</ul>

	<label for="vacationType">약정 휴가:</label> <select id="vacationType"
		name="vacationType">
		<option value="없음" selected>없음</option>
		<option value="경조사">경조사</option>
		<option value="포상휴가">포상휴가</option>
	</select> <br> <br>
	<ul>
		<li><span>경조사: 봉인: 5일 / 자녀: 1일 / 출산(본인): 20일, (배우자): 5일 /
				사망(배우자): 5일</span></li>
		<li><span>포상휴가: 행정기관의 장은 소속 공무원이 국가 또는 해당 기관의 주요 업무를 성공적으로
				수행하여 탁월한 성과와 공로가 인정되는 경우에는 10일 이내의 포상휴가를 줄 수 있습니다.</span></li>
	</ul>

	<input type="submit" value="제출">
</form>

<div>
	<ul>
		<li>
		<c:forEach var="vacation" items="${showVacation}">
				${vacation.id},${vacation.vacationType},${vacation.date}

		</c:forEach>
		</li>
	</ul>
</div>


<script>
  $(function() {
    // 폼 제출 이벤트 핸들러
    $("form").submit(function(e) {
      // 선택된 날짜와 휴가 종류를 가져옴
      var selectedDate = $("#date").val();
      var selectedVacationType = $("#vacationType").val();

      // 선택된 값이 없는 경우
      if (selectedDate === "" || selectedVacationType === "없음") {
        e.preventDefault(); // 제출 방지
        alert("날짜와 휴가 종류를 선택해주세요.");
      }

      // 법정 휴가와 약정 휴가가 동시에 선택된 경우
      if (
        selectedVacationType === "법정 휴가" &&
        $("#otherVacationType").val() !== "없음"
      ) {
        e.preventDefault(); // 제출 방지
        alert("법정 휴가와 약정 휴가는 동시에 선택할 수 없습니다.");
      }

      // 약정 휴가와 법정 휴가가 동시에 선택된 경우
      if (
        selectedVacationType === "약정 휴가" &&
        $("#vacationType").val() === "법정 휴가"
      ) {
        e.preventDefault(); // 제출 방지
        alert("법정 휴가와 약정 휴가는 동시에 선택할 수 없습니다.");
      }
    });

    // Datepicker 설정
    $("#date").datepicker({
      dateFormat: "yy-mm-dd" // 날짜 형식 설정
    });
  });
</script>


<div class="fixed-bottom">
	<%@ include file="../common/bottom.jsp"%>
</div>
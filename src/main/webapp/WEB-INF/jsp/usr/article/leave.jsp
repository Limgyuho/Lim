<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<div class="flex">


	<div class="border-blue w-80 h-100">
		<form action="/usr/article/leaveRequest" method="post">
			<label for="date">날짜:</label> <input type="text" id="date" name="date">
			<br />
			<br />
			<label for="vacationType1">법정 휴가:</label> 
			<select id="vacationType1" name="vacationType1">
				<option value="없음" selected>없음</option>
				<option value="연차">연차</option>
				<option value="월차">월차</option>
				<option value="반차">반차</option>
				<option value="가족돌봄휴가">가족돌봄휴가</option>
				<option value="공가">공가</option>
			</select>
			<br />	
			<br />
			<ul>
				<li>연차: 1년을 계속 근로한 근로자가 근로기준법 요건에 해당하는 경우 받게 되는
						유급휴가입니다.</li>
				<li>월차: 연차 유급휴가를 가리키는 말이며, 1개월 만근 시 1일의 휴가를 받을 수 있는
						제도입니다.</li>
				<li>반차: 보통 오전과 오후로 나뉘는 휴가입니다.</li>
			</ul>
			<br />	
			<br />
			<label for="vacationType2">약정 휴가:</label> 
			<select id="vacationType2" name="vacationType2">
				<option value="없음" selected>없음</option>
				<option value="경조사">경조사</option>
				<option value="포상휴가">포상휴가</option>
			</select>
			<br />	
			<br />
			<ul>
				<li>경조사: 봉인: 5일 / 자녀: 1일 / 출산(본인): 20일, (배우자): 5일 /
						사망(배우자): 5일</li>
				<li>포상휴가: 행정기관의 장은 소속 공무원이 국가 또는 해당 기관의 주요 업무를 성공적으로
						수행하여 탁월한 성과와 공로가 인정되는 경우에는 10일 이내의 포상휴가를 줄 수 있습니다.</li>
			</ul>

			<input type="submit" value="제출">
		</form>
	</div>
	
	
	<table class="border-collapse border-blue ">
	  <thead>
	    <tr>
	      <th class="border border-blue px-4 py-2">날짜</th>
	      <th class="border border-blue px-4 py-2">법정 휴가</th>
	      <th class="border border-blue px-4 py-2">약정 휴가</th>
	      <th class="border border-blue px-4 py-2">상태</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach var="vacation" items="${showVacation}">
	      <tr>
	        <td class="border border-blue px-4 py-2">${vacation.date}</td>
	        <td class="border border-blue px-4 py-2">${vacation.vacationType1}</td>
	        <td class="border border-blue px-4 py-2">${vacation.vacationType2}</td>
	        <td class="border border-blue px-4 py-2">
	          <c:if test="${vacation.status == 1}">
	            <span class="text-green-500">허가</span>
	          </c:if>
	          <c:if test="${vacation.status == 0}">
	            <span class="text-yellow-500">대기</span>
	          </c:if>
	          <c:if test="${vacation.status == -1}">
	            <span class="text-red-500">거부</span>
	          </c:if>
	        </td>
	      </tr>
	    </c:forEach>
	  </tbody>
	</table>

	<c:forEach var="member" items="${manager}">
	  <c:if test="${member.position == rq.getLoginedMember().getPosition()}">
	  	<div class="border-blue w-30 h-50 overflow-auto">
			  <table class="table-auto">
			    <thead>
			      <tr>
			        <th class="px-4 py-2">ID</th>
			        <th class="px-4 py-2">법정휴가</th>
			        <th class="px-4 py-2">포상휴가</th>
			        <th class="px-4 py-2">날짜</th>
			        <th class="px-4 py-2">승인 상태</th>
			      </tr>
			    </thead>
			    <tbody>
				      <c:forEach var="vacation" items="${showallVacation}">
				          <tr>
				            <td class="border px-4 py-2">
				              <input type="checkbox" name="id" class="checkbox checkbox-info" value="${vacation.id}" />
				            </td>
				            <td class="border px-4 py-2">${vacation.vacationType1}</td>
				            <td class="border px-4 py-2">${vacation.vacationType2}</td>
				            <td class="border px-4 py-2">${vacation.date}</td>

				              <c:if test="${vacation.status == 1}">
				                <td>허가</td>
				              </c:if>
				              <c:if test="${vacation.status == -1}">
				                <td>거부</td>
				              </c:if>

				          </tr>
					   </c:forEach>	
			    </tbody>	
			    
			  </table>
			        <a href="leaveAp?id=${vacation.id}&status=1" class="button">허가</a>
		              &nbsp;
		              &nbsp;
              		<a href="leaveAp?id=${vacation.id}&status=-1" class="button">거부</a>
              		<button class="btn btn-outline btn-secondary" type="button"
              		 onclick="leaveAp()" id="" >거부</button>
			</div>
		</c:if>
	</c:forEach>
</div>

<script>
  $(function() {
    // 폼 제출 이벤트 핸들러
    $("form").submit(function(e) {
      // 선택된 날짜와 휴가 종류를 가져옴
      var selectedDate = $("#date").val();
      var selectedVacationType1 = $("#vacationType1").val();
      var selectedVacationType2 = $("#vacationType2").val();
      // 선택된 값이 없는 경우
      if (selectedDate === "" ) {
        e.preventDefault(); // 제출 방지
        alert("날짜를 선택해주세요.");
      } else if (selectedVacationType1 === "없음" && selectedVacationType2 === "없음") {
        e.preventDefault(); // 제출 방지
        alert("법정 휴가 또는 약정 휴가 중 하나를 선택해주세요.");
      } else if (selectedVacationType1 !== "없음" && selectedVacationType2 !== "없음") {
        e.preventDefault(); // 제출 방지
        alert("법정 휴가 또는 약정 휴가 중 하나만 선택해주세요.");
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
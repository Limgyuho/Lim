<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>
<div class="text-6xl text-center mb-14">휴가 보고</div>

<div class="flex justify-center">
    <div class="p-4 rounded-2xl border border-gray-300 w-80 h-100 rounded-3xl p-8 m-3">
        <form action="/usr/article/leaveRequest" method="post">
            <label for="date" class="text-lg font-bold">날짜:</label>
            <input type="date" id="date" name="date" autocomplete="off" class="p-2 border border-gray-300 rounded mb-4">

            <br>

            <label for="vacationType1" class="text-lg font-bold">법정 휴가:</label>
            <select id="vacationType1" name="vacationType1" class="p-2 border border-gray-300 rounded mb-4">
                <option value="없음" selected>없음</option>
                <option value="연차">연차</option>
                <option value="월차">월차</option>
                <option value="반차">반차</option>
                <option value="가족돌봄휴가">가족돌봄휴가</option>
                <option value="공가">공가</option>
            </select><br>

            <ul class="list-disc list-inside ml-4 mb-4">
                <li>연차: 1년을 계속 근로한 근로자가 근로기준법 요건에 해당하는 경우 받게 되는 유급휴가입니다.</li>
                <li>월차: 연차 유급휴가를 가리키는 말이며, 1개월 만근 시 1일의 휴가를 받을 수 있는 제도입니다.</li>
                <li>반차: 보통 오전과 오후로 나뉘는 휴가입니다.</li>
            </ul>

            <label for="vacationType2" class="text-lg font-bold">약정 휴가:</label>
            <select id="vacationType2" name="vacationType2" class="p-2 border border-gray-300 rounded mb-4">
                <option value="없음" selected>없음</option>
                <option value="경조사">경조사</option>
                <option value="포상휴가">포상휴가</option>
            </select><br>

            <ul class="list-disc list-inside ml-4 mb-4">
                <li>경조사: 봉인: 5일 / 자녀: 1일 / 출산(본인): 20일, (배우자): 5일 / 사망(배우자): 5일</li>
                <li>포상휴가: 행정기관의 장은 소속 공무원이 국가 또는 해당 기관의 주요 업무를 성공적으로 수행하여 탁월한
                    성과와 공로가 인정되는 경우에는 10일 이내의 포상휴가를 줄 수 있습니다.</li>
            </ul>

            <input type="submit" value="제출" class="border-blue hover:bg-blue-700 text-black font-bold py-2 px-4 rounded">
        </form>
    </div>

    <div class="p-4 rounded-2xl border border-gray-300  p-8 m-3">
        <div class="text-2xl">나의 휴가신청 현황</div>
        <table class="table-auto">
            <thead>
                <tr>
                    <th class="px-4 py-2">날짜</th>
                    <th class="px-4 py-2">법정 휴가</th>
                    <th class="px-4 py-2">약정 휴가</th>
                    <th class="px-4 py-2">승인 상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vacation" items="${showVacation}">
                    <tr>
                        <td class="border px-4 py-2">${vacation.date}</td>
                        <td class="border px-4 py-2">${vacation.vacationType1}</td>
                        <td class="border px-4 py-2">${vacation.vacationType2}</td>
                        <td class="border px-4 py-2">
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
    </div>

    <c:if test="${rq.getLoginedMember().getPosition() eq '과장'}">
        <div class="w-30 h-50 overflow-auto p-8 m-3">
            <table class="table-auto">
                <thead>
                    <tr>
                        <th class="px-4 py-2">이름</th>
                        <th class="px-4 py-2">법정휴가</th>
                        <th class="px-4 py-2">포상휴가</th>
                        <th class="px-4 py-2">날짜</th>
                        <th class="px-4 py-2">승인 상태</th>
                        <th class="px-4 py-2">처리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vacation" items="${showallVacation}">
                        <tr>
                            <td class="border px-4 py-2">${vacation.applicantName}</td>
                            <td class="border px-4 py-2">${vacation.vacationType1}</td>
                            <td class="border px-4 py-2">${vacation.vacationType2}</td>
                            <td class="border px-4 py-2">${vacation.date}</td>
                            <td class="border px-4 py-2">
                                <c:if test="${vacation.status == 1}">
                                    허가
                                </c:if>
                                <c:if test="${vacation.status == -1}">
                                    거부
                                </c:if>
                            </td>
                            <td class="border px-4 py-2">
                                <a href="leaveAp?id=${vacation.id}&status=1" class="button bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" data-id="${vacation.id}" data-status="1">허가</a>
                                <a href="leaveAp?id=${vacation.id}&status=-1" class="button bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" data-id="${vacation.id}" data-status="-1">거부</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
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
            if (selectedDate === "") {
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
        // 허가/거부 버튼 클릭 이벤트 핸들러
        $(".button").on("click", function(e) {
            e.preventDefault(); // 링크 클릭 시 기본 동작 방지

            var status = $(this).attr("data-status"); // 허가/거부 상태 가져오기
            var row = $(this).closest("tr"); // 현재 행(row) 선택

            // AJAX 요청을 통해 서버에 상태 업데이트 전송
            $.ajax({
                url: "leaveAp?id=" + $(this).attr("data-id") + "&status=" + status,
                type: "GET",
                success: function() {
                    // 서버 요청이 성공적으로 완료되면 해당 행(row) 제거
                    row.remove();
                },
                error: function() {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });
</script>

<%@ include file="../common/bottom.jsp"%>

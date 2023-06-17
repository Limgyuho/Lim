<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>

<div class="flex  justify-end mt-24 px-10">
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

<div class="flex justify-end mt-10 px-10">
	<div class="min-h-full w-full mx-8 ">
		<span class="text-3xl">출퇴근 버스 운행 시간</span>
		<table>
			<thead>
				<tr>
					<th>세종청사 출근 운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>08:12</td>
					<td>08:17</td>
					<td>08:22</td>
					<td>08:33</td>
					<td>08:40</td>
					<td>08:45</td>
					<td>08:52</td>
				</tr>
			</tbody>
		</table>
		<table>
			<thead>
				<tr>
					<th>세종청사 퇴근 운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>18:05</td>
					<td>18:17</td>
					<td>18:25</td>
					<td>18:37</td>
					<td>18:45</td>
					<td>19:05</td>
					<td>19:17</td>
				</tr>
			</tbody>
		</table>
		<table>
			<thead>
				<tr>
					<th>오송역 출근 운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>07:50</td>
					<td>07:55</td>
					<td>08:00</td>
					<td>08:08</td>
					<td>08:15</td>
					<td>08:17</td>
					<td>08:21</td>
				</tr>
			</tbody>
		</table>
		
	</div>
	
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


<style>
  table {
    margin-bottom: 20px;
    border-collapse: collapse;
    width: 100%;
  }

  th, td {
    padding: 8px;
    text-align: left;
    border: 1px solid #ddd;
  }
</style>



<%@ include file="../common/bottom.jsp"%>

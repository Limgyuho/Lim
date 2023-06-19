<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>

<div class="flex border-red m-16">
	<div>
		<div class="border-black m-10 ">
			<div
				class="bg-blue-200 text-3xl p-10 rounded-full flex justify-center items-center">
				<a href="/usr/article/ministry"> 협력 <br /> 부처
				</a>
			</div>
		</div>
		<div class="border-black m-10 ">
			<div
				class="bg-blue-200 text-3xl p-10 rounded-full  flex justify-center items-center">
				<a href="/usr/article/organization"> 직원 <br /> 안내
				</a>
			</div>
		</div>
	</div>
	
	<div>
		<div class="border-black m-10 ">
			<div
				class="bg-blue-200 text-3xl p-10 rounded-full flex justify-center items-center">
				<a href="/usr/article/cafeteria"> 구내 <br /> 식당
				</a>
			</div>
		</div>
		<div class="border-black m-10 ">
			<div
				class="bg-blue-200 text-3xl p-10 rounded-full flex justify-center items-center">
				옥상 <br /> 정원
			</div>
		</div>
	</div>
</div>



<div class="flex  border-red m-16 justify-between">
	<div class=" border-black m-10 ">
		<div class="flex px-10 w-full ">
			<button
				class="  bg-gray-300  rounded-l-full px-10 py-5 hover:bg-blue-200"
				onclick="showTab('member')">인사이동대상자</button>
			<button class="  bg-gray-300  px-10 py-5 hover:bg-blue-200"
				onclick="showTab('suggestion')">건의/요청사항</button>
			<button class="  bg-gray-300  px-10 py-5 hover:bg-blue-200"
				onclick="showTab('program')">필수프로그램</button>
			<button
				class="  bg-gray-300  rounded-r-full px-10 py-5 hover:bg-blue-200"
				onclick="showTab('vacation')">휴가신청현황</button>
		</div>
		<br />
		<div class="flex justify-end px-10">
			<div id="memberTab" class="tab-content">
				<div class="p-4 rounded-2xl border border-gray-300 h-72">
					<div class="mt-6 ">
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
			</div>

			<div id="suggestionTab" class="tab-content hidden">
				<div class="p-4 ml-4 rounded-lg border border-gray-300 h-72">
					<div class="mt-6 ">
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

			<div id="programTab" class="tab-content hidden">
				<div class="p-4 rounded-lg border border-gray-300 h-72">
					<div class="h-5/6 mt-6 ">
						<ul class="p-0 space-y-2">
							<c:forEach var="file" items="${files}">
								<li class="py-2"><span class="text-gray-800">${file.id}
										${file.orgName}</span> <a href="/usr/article/file/${file.id}"
									download class="text-blue-500 hover:underline"> <i
										class="fa-solid fa-download"></i>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

			<div id="vacationTab" class="tab-content hidden">
				<div class="p-4 ml-4 rounded-lg border border-gray-300 h-72">
					<div class="h-5/6 mt-6 ">
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
		</div>
	</div>

	<div class="flex justify-end  m-10 px-10 flex-grow">
		<div class="min-h-full w-full  border-blue ">
			<span class="text-3xl">통근 버스 운행 시간</span>
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
	</div>
</div>




<script>
	document.getElementById('memberTab').style.display = 'block';

	function showTab(tabName) {
		// 모든 탭 컨텐츠를 숨김
		const tabContents = document.getElementsByClassName('tab-content');
		for (let i = 0; i < tabContents.length; i++) {
			tabContents[i].style.display = 'none';
		}

		// 선택한 탭 컨텐츠만 표시
		const selectedTab = document.getElementById(tabName + 'Tab');
		selectedTab.style.display = 'block';
	}
</script>

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

.btn {
	flex: 1; 
}

.tab-content {
	flex: 1; 
}
table th,
table td {
	padding: 0;
	border: 1px solid black;
}
</style>



<%@ include file="../common/bottom.jsp"%>

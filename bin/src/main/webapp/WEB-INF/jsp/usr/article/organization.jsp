<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>


<div class="flex justify-center items-center my-40 text-8xl">부서별 직원안내</div>

<div class="flex justify-center items-center mb-48">

	<div>
		<div class="flex px-10 w-full mb-16 ">
			<button class="px-10 py-5 hover:bg-blue-200 mx-10 border-black" onclick="showTab('운영지원과')">운영지원과</button>
			<button class="px-10 py-5 hover:bg-blue-200 mx-10 border-black" onclick="showTab('기획재정담당관')">기획재정담당관</button>
			<button class="px-10 py-5 hover:bg-blue-200 mx-10 border-black" onclick="showTab('감사과')">감사과</button>
			<button class="px-10 py-5 hover:bg-blue-200 mx-10 border-black" onclick="showTab('정보과')">정보과</button>
		</div>

		<div class="flex w-full">
			<div id="운영지원과Tab" class="tab-content w-full">
				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>직급</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${approvedMembers}">
								<c:if test="${member.department == '운영지원과'}">
									<tr>
										<td>${member.name}</td>
										<td>${member.position}</td>
										<td>${member.cellphoneNum}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="기획재정담당관Tab" class="tab-content hidden w-full">
				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>직급</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${approvedMembers}">
								<c:if test="${member.department == '기획재정담당관'}">
									<tr>
										<td>${member.name}</td>
										<td>${member.position}</td>
										<td>${member.cellphoneNum}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="감사과Tab" class="tab-content hidden w-full">
				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>직급</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${approvedMembers}">
								<c:if test="${member.department == '감사과'}">
									<tr>
										<td>${member.name}</td>
										<td>${member.position}</td>
										<td>${member.cellphoneNum}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="정보과Tab" class="tab-content hidden w-full">
				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>이름</th>
								<th>직급</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${approvedMembers}">
								<c:if test="${member.department == '정보과'}">
									<tr>
										<td>${member.name}</td>
										<td>${member.position}</td>
										<td>${member.cellphoneNum}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/bottom.jsp"%>
<script>
	document.getElementById('운영지원과Tab').style.display = 'block';

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

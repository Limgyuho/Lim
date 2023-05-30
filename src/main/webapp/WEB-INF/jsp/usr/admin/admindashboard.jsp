<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드민 대시보드</title>
<style>
.tab-content {
	display: none;
}
</style>
</head>
<body>
	<h1>어드민 대시보드</h1>

	<!-- 탭 버튼 -->
	<div>
		<button onclick="showTab('joinRequests')">Join Requests</button>
		<button onclick="showTab('approvedMembers')">Approved Members</button>
	</div>

	<!-- 가입 요청자 탭 -->
	<div id="joinRequests" class="tab-content">
		<div class="flex">
			<h2 class="flex-grow-1">요청자 목록</h2>
			<h2 class="flex-grow-1 justify-content-end">총 인원 :
				${joinRequestCnt  } 명</h2>
		</div>

		<table>
			<thead>
				<tr>
					<th>요청번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>부서</th>
					<th>직급</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>요청날짜</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%-- 가입 요청자 정보 반복문 --%>
				<c:forEach var="joinRequest" items="${getAllRequests}">
					<tr>
						<td>${joinRequest.id}</td>
						<td>${joinRequest.loginId}</td>
						<td>${joinRequest.loginPw}</td>
						<td>${joinRequest.department}</td>
						<td>${joinRequest.position}</td>
						<td>${joinRequest.name}</td>
						<td>${joinRequest.cellphoneNum}</td>
						<td>${joinRequest.email}</td>
						<td>${joinRequest.regDate}</td>
						<td><a href="approve?id=${joinRequest.id}&permission=1">Approve</a>
							<a href="approve?id=${joinRequest.id}&permission=0">Reject</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 가입 완료된 멤버 탭 -->
	<div id="approvedMembers" class="tab-content">
		<div class="flex">
			<h2 class="flex-grow-1">가입된 멤버들</h2>
			<h2 class="flex-grow-1 justify-content-end">총 인원 : ${memberCnt }
				명</h2>
		</div>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>회원번호</th>
					<th>가입날짜</th>
					<th>로그인 아이디</th>
					<th>로그인 패스워드</th>
					<th>부서</th>
					<th>직급</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>승인 상태</th>
				</tr>
			</thead>
			<tbody>
				<%-- 가입 완료된 멤버 정보 반복문 --%>
				<c:forEach var="member" items="${getAllApprovedMembers}">
					<tr>
						<td>
							<div class="form-control">
								<label class="cursor-pointer label"> <input
									type="checkbox" class="checkbox checkbox-info" />
								</label>
							</div>
						</td>
						<td>${member.id}</td>
						<td>${member.regDate}</td>
						<td>${member.loginId}</td>
						<td>${member.loginPw}</td>
						<td>${member.department}</td>
						<td>${member.position}</td>
						<td>${member.name}</td>
						<td>${member.cellphoneNum}</td>
						<td>${member.email}</td>
						<c:if test="${member.permission == 1}">
							<td>허가 상태</td>
						</c:if>
						<a href=""></a>
						<c:if test="${member.permission == 0}">
							<td>거부 상태
								<button onclick="location.href='/usr/admin/Reapproval'"">재승인</button>
							</td>
							<!-- 							//일단은 실제로 동작하는지 재승인 -->
							<!-- 							//경로를 설정하여 컨트롤러에서 -->
							<!-- 							//서비스에서 레파지토리에서 혹은xml 에서 -->
							<!-- 							//업데이트 쿼리문을 날려 -->
							<!-- 							//테이블에 있는 퍼미션이 0인 대상자들을 -->
							<!-- 							//1로 변경한다 -->
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<form method="GET">
		<select data-value="${department }" class="select select-bordered"
			name="department">
			<option value="전체" ${department == '' ? 'selected' : ''}>전체</option>
			<option value="운영지원과" ${department == '운영지원과' ? 'selected' : ''}>운영지원과</option>
			<option value="정보과" ${department == '정보과' ? 'selected' : ''}>정보과</option>
			<option value="기획재정담당관" ${department == '기획재정담당관' ? 'selected' : ''}>기획재정담당관</option>
			<option value="감사과" ${department == '감사과' ? 'selected' : ''}>감사과</option>
		</select> <input class="ml-2 w-80 input input-bordered" name="name"
			placeholder="검색어를 입력해주세요" maxlength="20" value="${name }" />
		<button class="ml-2 btn-text-link btn btn-active" type="submit">검색</button>
	</form>


	<script>
		function showTab(tabName) {
			// 모든 탭 컨텐츠 숨기기
			var tabContents = document.getElementsByClassName("tab-content");
			for (var i = 0; i < tabContents.length; i++) {
				tabContents[i].style.display = "none";
			}

			// 선택한 탭 컨텐츠 보이기
			var selectedTab = document.getElementById(tabName);
			selectedTab.style.display = "block";
		}
	</script>

</body>
</html>

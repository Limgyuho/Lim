<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="admindashboard" />
<%@ include file="../common/head.jsp"%>

<h1 class="text-2xl">어드민 대시보드</h1>

<div>
	<button onclick="showTab('joinRequests')">가입 요청자 목록</button>
	&nbsp;
	&nbsp;
	<button onclick="showTab('approvedMembers')">가입 멤버 목록</button>
	&nbsp;
	&nbsp;
	<button onclick="showTab('suggestion')">요청 사항 목록</button>
</div>
<!-- 가입 요청자 탭 -->
<div id="joinRequests" class="tab-content">
	<div class="flex">
		<h2 class="flex-grow-1">요청자 목록</h2>
		<h2 class="flex-grow-1 justify-content-end">총 인원: ${joinRequestCnt} 명</h2>
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
					<td>
						<a href="approve?id=${joinRequest.id}&permission=1">Approve</a>
						<a href="approve?id=${joinRequest.id}&permission=0">Reject</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- 가입 완료된 멤버 탭 -->
<div id="approvedMembers" class="tab-content">
	<div class="flex">
		<h2 class="flex-grow-1">가입된 멤버들</h2>
		<h2 class="flex-grow-1 justify-content-end">총 인원: ${memberCnt} 명</h2>
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
			<c:forEach var="member" items="${getAllApprovedMembers}">
				<tr>
					<td>
						<form method="GET" action="/usr/admin/transfer">
							<div class="form-control">
								<label class="cursor-pointer label">
									<input type="checkbox" name="id" class="checkbox checkbox-info"
										value="${member.id}" />
									<button class="ml-2 btn-text-link btn btn-active" type="submit">인사이동</button>
								</label>
							</div>
						</form>
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
					<c:if test="${member.permission == 0}">
						<td>거부 상태
							<button onclick="location.href='/usr/admin/Reapproval'">재승인</button>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="flex">
	<div>
		 <form method="GET">
			<select data-value="${department }" class="select select-bordered" name="department">
				<option value="전체" ${empty department ? 'selected' : ''}>전체</option>
				<option value="운영지원과" ${department == '운영지원과' ? 'selected' : ''}>운영지원과</option>
				<option value="정보과" ${department == '정보과' ? 'selected' : ''}>정보과</option>
				<option value="기획재정담당관"${department == '기획재정담당관' ? 'selected' : ''}>기획재정담당관</option>
				<option value="감사과" ${department == '감사과' ? 'selected' : ''}>감사과</option>
			</select>
			<input class="ml-2 w-80 input input-bordered" name="name" placeholder="검색어를 입력해주세요"
				maxlength="20" value="${name }" />
			<button class="ml-2 btn-text-link btn btn-active" type="submit">검색</button>
		</form>
	</div>
</div>
<!-- 요청 -->
<div id="suggestion" class="tab-content">
  <table>
    <thead>
      <tr>
        <th>신청 날짜</th>
        <th>신청자 부서</th>
        <th>신청자 직급</th>
        <th>신청이름</th>
        <th>신청 사항</th>      
        <th>승인 상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="suggestion" items="${getsuggestion}">
        <tr>
          <td>${suggestion.regDate}</td>
          <td>${suggestion.department}</td>
          <td>${suggestion.position}</td>
          <td>${suggestion.name}</td>
          <td>${suggestion.item}</td>
          <td>
          	<c:choose>
          		<c:when test="${suggestion.permission == 1}">
          			요청 허가
          		</c:when>
          		<c:when test="${suggestion.permission == -1}">
          			요청 거부
          		</c:when>
          		<c:otherwise>
          			<c:set var="reason" value="${empty suggestion.reason ? '' : suggestion.reason}" />
          			<c:if test="${not empty suggestion.reason}">
          				${suggestion.reason}
          			</c:if>
          			<c:if test="${empty suggestion.reason}">
          				<form action="suggestionap" method="get">
          					<input type="hidden" name="id" value="${suggestion.id}">
          					<input type="hidden" name="permission" value="1">
          					<input type="text" name="reason" value="${reason}" placeholder="사유를 적으세요">
          					<button type="submit" onclick="return validateReason()">Approve</button>
          				</form>
          				<form action="suggestionap" method="get">
          					<input type="hidden" name="id" value="${suggestion.id}">
          					 <input type="hidden" name="permission" value="-1">
          					<input type="text" name="reason" value="${reason}" placeholder="사유를 적으세요">
          					<button type="submit" onclick="return validateReason()">Reject</button>
          				</form>
          			</c:if>
          		</c:otherwise>
          	</c:choose>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

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

<script>
  function validateReason() {
    var reasonInput = document.getElementsByName("reason")[0];
    var reason = reasonInput.value.trim();
    
    if (reason.length == 0) {
      alert("사유를 반드시 입력해야 합니다.");
      return false; // 어프로브나 리젝트 동작을 중단합니다.
    }
    
    return true; // 어프로브나 리젝트 동작을 계속합니다.
  }
</script>
</body>
</html>

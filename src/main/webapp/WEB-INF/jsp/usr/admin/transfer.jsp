<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	인사이동 관리창 입니다

	<c:forEach var="member" items="${searchMember}">
		<div>${member.id}</div>
		<div>${member.regDate}</div>
		<div>${member.loginId}</div>
		<div>${member.loginPw}</div>S
		<div>${member.position}</div>
		<div>${member.department}</div>
		<div>${member.name}</div>
		<div>${member.cellphoneNum}</div>
		<div>${member.email}</div>
		
	</c:forEach>
		
				<form class="flex" method="GET">
					<div>부서</div>				
					<select data-value="${department }" class="select select-bordered"
						name="department">
						<option value="운영지원과" ${department}>과장</option>
						<option value="정보과" ${department}>정보과</option>
						<option value="기획재정담당관" ${department}>기획재정담당관</option>
						<option value="감사과" ${department}>감사과</option>
					</select>
					<div>직급</div>
					<select data-value="${position }" class="select select-bordered"
						name="department">
						<option value="과장" ${position }>과장</option>
						<option value="서기관" ${position }>서기관</option>
						<option value="사무관"${position }>사무관</option>
						<option value="주무관" ${position }>주무관</option>
					</select>
					<button class="ml-2 btn-text-link btn btn-active" type="submit">변경</button>
				</form>

</body>
</html>
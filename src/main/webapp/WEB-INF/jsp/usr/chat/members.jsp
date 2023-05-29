<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

<div id="approvedMembers" class="tab-content">
		<div class="flex">
			<h2 class="flex-grow-1">가입된 멤버들</h2>
			<h2 class="flex-grow-1 justify-content-end">총 인원 : ${memberCnt }
				명</h2>
		</div>
		<table>
			<thead>

				<tr>
					<th>직급</th>
					<th>이름</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<%-- 가입 완료된 멤버 정보 반복문 --%>
				<c:forEach var="member" items="${departmentMembers }">
					<tr>
						<td>${member.position }</td>
						<td><button onclick="location.href='/usr/chat/chat'">${member.name }</button></td>
						<td>${member.cellphoneNum }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
	<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
</body>
</html>
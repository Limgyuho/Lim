<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="text-6xl text-center mb-14">인사이동</div>

<div class="container mx-auto px-3  items-center">
	
	<div class="flex justify-center">
		<table class="table ">
			<colgroup>
				<col width="60" />
				<col width="200" />
				<col />
				<col width="120" />
				<col width="60" />
				<col width="40" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>인사이동 날짜</th>
					<th>인사이동 대상자</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${approvedMembers}">
					<tr>		
						<td>${member.id}</td>
						<td>${member.regDate}</td>
						<td><a href="/usr/article/transferdetail?memberId=${member.id}">${member.name}</a></td>
						<td>${member.department}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>


<div class="fixed-bottom">
    <%@ include file="../common/bottom.jsp" %>
</div>
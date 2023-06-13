<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="text-6xl text-center mb-14">필수 프로그램</div>

<div class="flex justify-center">
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>게시일</th>
				<th>파일 이름</th>
				<th>게시자</th>
				<th>파일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="file" items="${files}">
				<tr>
					<td>${file.id}</td>
					<td>${rq.getLoginedMember().getRegDate()}</td>
					<td>${file.originName }</td>
					<td>${rq.getLoginedMember().getName()}</td>
					<td>
						<a href="/usr/article/file/${file.id}" download>
					  		<i class="fa-solid fa-download"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>





<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
	<form action="upload" method="POST" enctype="multipart/form-data">
		<input type="file" name="file" />
		<button>업로드</button>
	</form>
</c:if>


<div class="fixed-bottom">
	<%@ include file="../common/bottom.jsp"%>
</div>

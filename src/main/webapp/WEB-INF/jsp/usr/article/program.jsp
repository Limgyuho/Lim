<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

업로드 장소
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

<div class="mt-2 flex justify-center">
	<div class="btn-group">
		<c:set var="pageMenuLen" value="5" />
		<c:set var="startPage"
			value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
		<c:set var="endPage"
			value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }" />

		<c:set var="pageBaseUri"
			value="?searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }" />

		<c:if test="${membersCnt != 0 }">
			<c:if test="${page == 1 }">
				<a class="btn btn-sm btn-disabled">«</a>
				<a class="btn btn-sm btn-disabled">&lt;</a>
			</c:if>
			<c:if test="${page > 1 }">
				<a class="btn btn-sm" href="${pageBaseUri }&page=1">«</a>
				<a class="btn btn-sm" href="${pageBaseUri }&page=${page - 1 }">&lt;</a>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${page == i ? 'btn-active' : '' }"
					href="${pageBaseUri }&page=${i }">${i }</a>
			</c:forEach>
			<c:if test="${page < pagesCount }">
				<a class="btn btn-sm" href="${pageBaseUri }&page=${page + 1 }">&gt;</a>
				<a class="btn btn-sm" href="${pageBaseUri }&page=${pagesCount }">»</a>
			</c:if>
			<c:if test="${page == pagesCount }">
				<a class="btn btn-sm btn-disabled">&gt;</a>
				<a class="btn btn-sm btn-disabled">»</a>
			</c:if>
		</c:if>
	</div>
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

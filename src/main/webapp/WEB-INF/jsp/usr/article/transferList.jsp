<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>
	<div class="container mx-auto px-3  items-center">
		<div>
			<div class="w-full ">
				<form class="flex justify-end ">
					<input type="hidden" name="boardId" value="${board.id }" /> <select
						data-value="${searchKeywordType }" class="select select-bordered"
						name="searchKeywordType">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목 + 내용</option>
					</select> <input class="ml-2 w-80 input input-bordered" name="searchKeyword"
						placeholder="검색어를 입력해주세요" maxlength="20" value="${searchKeyword }" />
					<button class="ml-2 btn-text-link btn btn-active">검색</button>
				</form>
			</div>
		</div>
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
							<td><a href="/usr/article/transferdetail">${member.name}</a></td>
							<td>${member.department}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="mt-5 flex justify-center">
			<div class="btn-group">
				<c:set var="pageMenuLen" value="5" />
				<c:set var="startPage"
					value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
				<c:set var="endPage"
					value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }" />

				<c:set var="pageBaseUri"
					value="?boardId=${board.id }&searchKeywordType=${searchKeywordType }&searchKeyword=${searchKeyword }" />

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
			</div>
		</div>
	</div>
</body>
</html>
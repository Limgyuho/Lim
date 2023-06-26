<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<div class="flex items-center justify-center min-h-screen bg-gray-100">
	<div class="w-full max-w-3xl">
		<div class="flex justify-end mb-6">
			<h2 class="text-2xl font-bold">총 인원 : ${memberCnt}명</h2>
		</div>
		<div
			class="overflow-auto bg-white border border-gray-200 rounded-lg shadow-sm">
			<table class="w-full">
				<thead class="bg-gray-200">
					<tr>
						<th class="px-4 py-3">직급</th>
						<th class="px-4 py-3">이름</th>
						<th class="px-4 py-3">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${departmentMembers}">
						<tr>
							<td class="px-4 py-3">${member.position}</td>
							<td class="px-4 py-3"><a href="#"
								class="text-blue-500 hover:underline chat-link"
								data-member-id="${member.id}">${member.name}</a></td>
							<td class="px-4 py-3">${member.cellphoneNum}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="flex justify-center mt-6">
			<button
				class="px-4 py-2 text-sm text-white bg-blue-500 rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600"
				onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</div>

<script>
 
$(".chat-link").on("click", function (event) {
	  event.preventDefault();
	  var memberId = $(this).data("member-id");
	  openChat(memberId);
	});
	function openChat(memberId) {
	  window.location.href = "/usr/chat/chat/" + memberId;
	}
   
</script>
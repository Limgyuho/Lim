<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<form action="main" method="post">
	<div class=" min-h-screen flex items-center justify-center"
		style="background-image: url('/resource/images/배경1.png'); background-size: cover;">
		<div class="max-w-md bg-white p-8 rounded-lg shadow-md">
			<h1 class="text-3xl font-bold text-center mb-6">대한민국 공공기관</h1>
			<hr class="my-4">
			<div class="mt-6"></div>
			<div class="mt-4">

				<div>${rq.loginedMember.department }</div>

				<span class="text-sm">직급:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.position }</span>

				<span class="text-sm">이름:</span> <span
					class="ml-2 text-base font-bold">${rq.loginedMember.name }</span>
			</div>
			<div class="flex justify-center mt-6">
				<button type="submit"
					class=" hover:bg-blue-600  py-2 px-4 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
					접속</button>
			</div>
		</div>
	</div>
</form>

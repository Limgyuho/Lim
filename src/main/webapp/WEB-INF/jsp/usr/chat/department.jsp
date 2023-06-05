<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Chat" />
<%@ include file="../common/head.jsp"%>


<div class="flex justify-center items-center h-screen">
	<div>
		<ul class="text-3xl">
			<li>부서</li>
			<li><a href="/usr/chat/members?department=운영지원과">운영지원과</a></li>
			<li><a href="/usr/chat/members?department=정보과">정보과</a></li>
			<li><a href="/usr/chat/members?department=기획재정담당관">기획재정담당관</a></li>
			<li><a href="/usr/chat/members?department=감사과">감사과</a></li>
		</ul>
	</div>
</div>

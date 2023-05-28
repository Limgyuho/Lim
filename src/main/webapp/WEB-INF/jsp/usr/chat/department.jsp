<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
</head>
<body>

	<div class="flex justify-center items-center h-screen">
		<div>
			<ul class="text-3xl">
				<li>부서</li>
				<li><a href="/usr/chat/members?department=General Affairs Division">운영지원과</a></li>
				<li><a href="/usr/chat/members?department=Junbo">정보과</a></li>
				<li><a href="/usr/chat/members?department=Planning and Finance">기획재정담당관</a></li>
				<li><a href="/usr/chat/members?department=Inspector General">감사과</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
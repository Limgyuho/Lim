<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>
		
		<c:forEach var="member" items="${approvedMembers}">
				<tr>		
					<td>${member.id}</td>
					<td>${member.regDate}</td>
					<td><a href="#">${member.name}</a></td>
					<td>${member.department}</td>
				</tr>
		</c:forEach>

</html>
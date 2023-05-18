<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 대시보드</h1>

<table>
    <tr>
        <th>이름</th>
        <th>아이디</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>승인</th>
    </tr>
    <c:forEach items="${registrationRequests}" var="request">
        <tr>
            <td>${rq.name}</td>
            <td>${rq.username}</td>
            <td>${rq.email}</td>
            <td>${rq.phone}</td>
            <td>
                <form action="/admin/approve" method="post">
                    <input type="hidden" name="requestId" value="${rq.id}">
                    <button class="btn btn-outline btn-success"  type="submit">승인</button>
                </form>
                <form action="/admin/reject" method="post">
                    <input type="hidden" name="requestId" value="${rq.id}">
                </form>
                    <button class="btn btn-outline btn-success" type="submit">거절</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
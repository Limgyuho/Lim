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
        <th>ID</th>
        <th>이름</th>
        <th>아이디</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>승인 상태</th>
        <th>작업</th>
    </tr>
    <c:forEach items="${registrationRequests}" var="request">
        <tr>
            <td>${request.id}</td>
            <td>${request.name}</td>
            <td>${request.username}</td>
            <td>${request.email}</td>
            <td>${request.phone}</td>
            <td>대기중</td>
            <td>
                <form id="approveForm${request.id}" action="/admin/approve" method="post">
                    <input type="hidden" name="requestId" value="${request.id}">
                    <button type="submit" onclick="showProcessingMessage(${request.id})">승인</button>
                </form>
                <form id="rejectForm${request.id}" action="/admin/reject" method="post">
                    <input type="hidden" name="requestId" value="${request.id}">
                    <button type="submit" onclick="showProcessingMessage(${request.id})">거부</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
    function showProcessingMessage(requestId) {
        var messageElement = document.getElementById("statusMessage");
        messageElement.innerText = "승인 처리중입니다...";
        var approveForm = document.getElementById("approveForm" + requestId);
        var rejectForm = document.getElementById("rejectForm" + requestId);
        approveForm.addEventListener("submit", function() {
            messageElement.innerText = "회원가입이 승인되었습니다.";
        });
        rejectForm.addEventListener("submit", function() {
            messageElement.innerText = "회원가입이 거절되었습니다.";
        });
    }
</script>

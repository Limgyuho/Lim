<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>어드민 대시보드</title>
    <style>
        .tab-content {
            display: none;
        }
    </style>
</head>
<body>
    <h1>어드민 대시보드</h1>

    <!-- 탭 버튼 -->
    <div>
        <button onclick="showTab('joinRequests')">Join Requests</button>
        <button onclick="showTab('approvedMembers')">Approved Members</button>
    </div>

    <!-- 가입 요청자 탭 -->
    <div id="joinRequests" class="tab-content">
        <h2>요청자 목록</h2>
        <table>
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>비민번호</th>
                    <th>이름</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- 가입 요청자 정보 반복문 --%>
                <c:forEach var="joinRequest" items="${joinRequests}">
                    <tr>
                        <td>${joinRequest.id}</td>
                        <td>${joinRequest.pw}</td>
                        <td>${joinRequest.name}</td>
                        <td>
                            <form action="/admin/approve" method="post">
                                <input type="hidden" name="requestId" value="${joinRequest.id}" />
                                <button type="submit">Approve</button>
                            </form>
                            <form action="/admin/reject" method="post">
                                <input type="hidden" name="requestId" value="${joinRequest.id}" />
                                <button type="submit">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 가입 완료된 멤버 탭 -->
    <div id="approvedMembers" class="tab-content">
        <h2>가입된 멤버들</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>CellphoneNum</th>
                    <th>Email</th>
                    <th>Login Status</th>
                </tr>
            </thead>
            <tbody>
                <%-- 가입 완료된 멤버 정보 반복문 --%>
                <c:forEach var="member" items="${members }">
                    <tr>
                        <td>${member.loginId}</td>
                        <td>${member.name }</td>
                        <td>${member.cellphoneNum}</td>
                        <td>${member.email}</td>
                        <td>${member.loginStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script>
        function showTab(tabName) {
            // 모든 탭 컨텐츠 숨기기
            var tabContents = document.getElementsByClassName("tab-content");
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }

            // 선택한 탭 컨텐츠 보이기
            var selectedTab = document.getElementById(tabName);
            selectedTab.style.display = "block";
        }
    </script>
</body>
</html>
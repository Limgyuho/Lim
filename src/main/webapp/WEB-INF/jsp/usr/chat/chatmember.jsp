<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>
</head>
<body>
<!-- 가입 완료된 멤버 탭 -->
    <div id="approvedMembers" class="tab-content">
        <h2>가입된 멤버들</h2>
        <table>
            <thead>
                <tr>
                    <th>사번 혹은 직급</th>
                    <th>이름</th>
                    <th>내선 번호</th>                 
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
            <form action="chat" method="POST">
                <%-- 가입 완료된 멤버 정보 반복문 --%>
                <c:forEach var="member" items="${approvedMembers}">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.name}</td>
                        <td>${member.cellphoneNum}</td>
                        <td>${member.email}</td>
                        <td><button class="btn btn-outline btn-success" type="submit">채팅</button></td>
                    </tr>
                </c:forEach>
            </form>
            </tbody>
            
        </table>
    </div>
</body>
</html>
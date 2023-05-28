<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${approvedMembers }" var="member">
                <tr>
                    <td>${member.regDate}</td>
                    <td>${member.name}</td>
                    <td>${member.department}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
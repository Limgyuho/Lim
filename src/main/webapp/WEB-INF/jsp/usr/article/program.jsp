<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<head>
    <title>Insert title here</title>
</head>

<body>
    업로드 장소
    <c:forEach var="file" items="${files}">
        <div>
            <img src="/usr/article/file/${file.id}" />
        </div>
    </c:forEach>
    
    <c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
        <div>
            <form action="upload" method="POST" enctype="multipart/form-data">
                <input type="file" name="file" />
                <button>업로드</button>
            </form>
        </div>
    </c:if>
</body>

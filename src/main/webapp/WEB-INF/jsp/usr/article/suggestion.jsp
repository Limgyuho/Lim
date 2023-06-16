<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="text-6xl text-center mb-14">인사이동</div>

<div class="mx-auto px-3 items-center">

    <div class="flex justify-center">
        <table class="table">
            <thead>
                <tr>
                    <th style="width: 100px;">번호</th>
                    <th style="width: 200px;">인사이동 날짜</th>
                    <th style="width: 200px;">인사이동 대상자</th>
                    <th style="width: 150px;">부서</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${approvedMembers}">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.regDate}</td>
                        <td><a href="/usr/article/transferdetail?memberId=${member.id}">${member.name}</a></td>
                        <td>${member.department}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="mt-5 flex justify-center">
        <div class="btn-group">
            <c:set var="pageMenuLen" value="5" />
            <c:set var="startPage" value="${currentPage - pageMenuLen >= 1 ? currentPage - pageMenuLen : 1 }" />
            <c:set var="endPage" value="${currentPage + pageMenuLen <= totalPages ? currentPage + pageMenuLen : totalPages }" />

            <c:choose>
                <c:when test="${currentPage > 1}">
                    <a href="/usr/article/transferList?page=${currentPage - 1}" class="btn btn-blue">이전</a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="btn btn-disabled">이전</a>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                <a href="/usr/article/transferList?page=${i}" class="btn ${currentPage == i ? 'btn-blue' : 'btn-gray'}">${i}</a>
            </c:forEach>

            <c:choose>
                <c:when test="${currentPage < totalPages }">
                    <a href="/usr/article/transferList?page=${currentPage + 1}" class="btn btn-blue">다음</a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="btn btn-disabled">다음</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

<%@ include file="../common/bottom.jsp" %>

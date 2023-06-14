<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/head.jsp" %>
<%@ include file="../home/topbar.jsp" %>

<div class="text-6xl text-center mb-14">부서별 자료</div>

<div class="flex mt-5 justify-center content-center">
    <div id="div1" class="flex w-80 h-96 border-black block m-7 rounded-2xl">
        <span class="text-2xl">운영지원과</span>
        <ul>
            <c:forEach var="file" items="${files2}">
                <c:if test="${file.dpn eq '운영지원과'}">
                    <li>
                        <a href="/usr/article/file2/${file.id}" download>
                            ${file.originName} <i class="fa-solid fa-download"></i>
                        </a>
                    </li>
                </c:if>
            </c:forEach>	
        </ul>
        <c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
            <form id="form1" action="/usr/article/upload2" method="POST" enctype="multipart/form-data">
                <input type="file" name="file2" />
                <input type="hidden" name="dpn" value="운영지원과" />
                <button type="submit">업로드</button>
            </form>
        </c:if>
    </div>

    <div id="div2" class="flex w-80 h-96 border-black block m-7 rounded-2xl">
    	<span class="text-2xl">기획재정담당관</span>
        <ul>
            <c:forEach var="file" items="${files2}">
                <c:if test="${file.dpn eq '기획재정담당관'}">
                    <li>
                        <a href="/usr/article/file2/${file.id}" download>
                            ${file.originName} <i class="fa-solid fa-download"></i>
                        </a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
            <form id="form2" action="/usr/article/upload2" method="POST" enctype="multipart/form-data">
                <input type="file" name="file2" />
                <input type="hidden" name="dpn" value="기획재정담당관" />
                <button type="submit">업로드</button>
            </form>
        </c:if>
    </div>

    <div id="div3" class="flex w-80 h-96 border-black block m-7 rounded-2xl">
        <span class="text-2xl">정보과</span>
        <ul>
            <c:forEach var="file" items="${files2}">
                <c:if test="${file.dpn eq '정보과'}">
                    <li>
                        <a href="/usr/article/file2/${file.id}" download>
                            ${file.originName} <i class="fa-solid fa-download"></i>
                        </a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
            <form id="form3" action="/usr/article/upload2" method="POST" enctype="multipart/form-data">
                <input type="file" name="file2" />
                <input type="hidden" name="dpn" value="정보과" />
                <button type="submit">업로드</button>
            </form>
        </c:if>
    </div>

    <div id="div4" class="flex w-80 h-96 border-black block m-7 rounded-2xl">
        <span class="text-2xl">감사과</span>
        <ul>
            <c:forEach var="file" items="${files2}">
                <c:if test="${file.dpn eq '감사과'}">
                    <li>
                        <a href="/usr/article/file2/${file.id}" download>
                            ${file.originName} <i class="fa-solid fa-download"></i>
                        </a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
            <form id="form4" action="/usr/article/upload2" method="POST" enctype="multipart/form-data">
                <input type="file" name="file2" />
                <input type="hidden" name="dpn" value="감사과" />
                <button type="submit">업로드</button>
            </form>
        </c:if>
    </div>
</div>

<div class="fixed-bottom">
    <%@ include file="../common/bottom.jsp" %>
</div>

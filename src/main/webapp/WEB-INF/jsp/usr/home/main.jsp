<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>
<div class="w-52 h-20 bg-green-400">
	<input type="hidden" name="id" value="${member.id }"/>
    <div class="logo">
        <img src="로고 이미지 URL" alt="로고">
    </div>
    <div class="user-info">
        <img src="사용자 이미지 URL" alt="사용자 이미지" class="user-image">
        <span>${rq.loginedMember.department }</span>
        <span>${rq.loginedMember.position }</span>
        <span>${rq.loginedMember.name }</span>
       <span class="Messenger" >메신저</span>
        <a href="/usr/home/home">로그아웃</a>
        <div class="w-80 h-60 border-black"></div>
        <div class="w-80 h-60 border-black"></div>
        
        
        <c:forEach var="file" items="${files }">
		<div>
			<img src="/usr/home/file/${file.id}" />
		</div>
		
		
		<div>
				<form action="upload" method="POST" enctype="multipart/form-data">
					<input type="file" name="file" />
					<button>업로드</button>
				</form>
			</div>
			
			<div>
				<a href="/usr/home/view">파일보러가기</a>
			</div>
	</c:forEach>
    </div>
</div>
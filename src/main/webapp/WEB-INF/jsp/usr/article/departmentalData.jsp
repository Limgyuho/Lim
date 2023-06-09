<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>



<div class="flex mt-5 justify-center content-center h-screen">
	<div class="flex w-80 h-96 border-black block">운영지원과
		업로드 장소

	
	<c:forEach var="file" items="${files2}">
		<ul>
			<li>
				<a href="/usr/article/file/${file.id}"  download>
					 ${file.originName } <i class="fa-solid fa-download"></i>
				</a>
			</li>
		</ul>
	</c:forEach>
	</div>
	<div class="flex w-80 h-96 border-black block">기획재정담당관</div>
	<div class="flex w-80 h-96 border-black block">정보과</div>
	<div class="flex w-80 h-96 border-black block">감사과</div>
	
	
	<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
		<form action="upload2" method="POST" enctype="multipart/form-data">
			<input type="file" name="file2" />
			<button>업로드</button>
		</form>
	</c:if>
</div>

























<div class="fixed-bottom">
	<%@ include file="../common/bottom.jsp"%>
</div>
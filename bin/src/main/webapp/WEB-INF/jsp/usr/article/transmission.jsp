<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="flex">
	<div class="flex border-red">
		<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
<!-- 			<form action="upload" method="POST" enctype="multipart/form-data"> -->
				<input type="file" name="file" />
<!-- 			</form> -->
		</c:if>
	</div>
	<div class="member-list border-red">
		<table>
			<tbody id="memberTable">
				<c:forEach var="member	" items="${transmissionMembers }">
					<tr>
						<td>${member.department }</td>
						<td>${member.position }</td>
						<td>
							<a href="#" class="send-file" data-member="${member.name}">
								${member.name}
							</a>
						</td>
						<td>${member.cellphoneNum }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="file-list border-red">
	<h3>받은 파일</h3>
	<ul>
		<c:forEach var="file" items="${receivedFiles}">
			<li>
				<a href="${file.filePath}" download="${file.fileName}">
					${file.fileName}
				</a>
			</li>
		</c:forEach>
	</ul>
</div>




<%@ include file="../common/bottom.jsp"%>

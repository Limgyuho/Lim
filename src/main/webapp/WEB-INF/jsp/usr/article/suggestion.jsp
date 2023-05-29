<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="flex justify-center">요청 및 건의 사항</div>

	<div class="form-control">
		<label class="cursor-pointer label"> <span class="label-text">Remember
				me</span> <input type="checkbox" checked="checked"
			class="checkbox checkbox-accent" />
		</label>
	</div>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="/usr/member/dojoin" method="POST"
				onsubmit="join_submitForm(this); return false;">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr height="105">	
								<th>사무용품 교체 및 요청</th>
								<td>
									<ul>sadf
										<li>asdf</li>
										<li>sdf</li>
										<li>sadf</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td></td>
							</tr>
							<tr>

								<th>이름</th>
								<td></td>
							</tr>
							<tr>

							</tr>
							<tr>

							</tr>
							<tr>
						</tbody>
					</table>
				</div>
			</form>



			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button"
					onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
</body>
</html>
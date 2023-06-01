
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
	<div>${rq.getLoginedMember().getId()}</div>
	<div class="flex justify-center">요청 및 건의 사항</div>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="/usr/article/suggestion" method="POST"onsubmit="join_submitForm(this); return false;">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr height="105">
								<th>사무용품 교체,요청</th>
								<td>
									<div>
										모니터 교체 신청<input name="monitor" type="checkbox"
											checked="checked" class="checkbox checkbox-accent" />
									</div> pc 교체 신청 <input name="pc" type="checkbox" checked="checked"
									class="checkbox checkbox-accent" />
									<div>
										의자 교체 신청 <input name="chair" type="checkbox" checked="checked"
											class="checkbox checkbox-accent" />
									</div>
									<div>
										책상 교체 신청 <input name="desk" type="checkbox" checked="checked"
											class="checkbox checkbox-accent" />
									</div> <input name="reason1" type="text" placeholder="사유적기" />
								</td>
							</tr>
							<div>${rq.getLoginedMember().getIdName</div>
							<tr>
								<th>관용차 대여 요청</th>
								<td>
									<div>
										스타렉스 <input name="starex" type="checkbox" checked="checked"
											class="checkbox checkbox-accent" />
									</div>
									<div>
										제네시스 <input name="genesis" type="checkbox" checked="checked"
											class="checkbox checkbox-accent" />
									</div>
									<div>
										포터 <input name="potter" type="checkbox" checked="checked"
											class="checkbox checkbox-accent" />
										<div>
											<input name="destination" type="text" placeholder="목적지" /> <input
												name="reason2" type="text" placeholder="사유적기" />
								</td>
							</tr>
							<tr>
								<th>편의 시설 사용 신청</th>
								<td></td>
							</tr>
							<tr>
								<th>자리 배치 이동 요청</th>
								<td><input type="text" placeholder="사유적기" /></td>
							</tr>
							<button class=" ml-2 btn-text-link btn btn-active" type="submit">신청</button>
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
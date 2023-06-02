<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>
<html>
<head>
</head>
<body>
	<div class="flex justify-center">요청 및 건의 사항</div>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="/usr/article/insertSuggestion" method="POST"onsubmit="join_submitForm(this); return false;">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr height="105">
							<th>신청자</th>
								<td>
									부서 : ${rq.getLoginedMember().getDepartment()} ,직급 : ${rq.getLoginedMember().getPosition()}, 이름 : ${rq.getLoginedMember().getName()}
								</td>
							</tr>	
								<th>사무용품 교체,요청</th>
								<td>
									<div>
										모니터 교체 신청<input name="item" value="모니터"type="checkbox"  class="checkbox checkbox-accent" />
									</div>
										 pc 교체 신청 <input name="item" value="pc" type="checkbox" class="checkbox checkbox-accent" />
									<div>
										의자 교체 신청 <input name="item" value ="의자" type="checkbox" class="checkbox checkbox-accent" />
									</div>
									<div>
										책상 교체 신청 <input name="item" value ="책상" type="checkbox"class="checkbox checkbox-accent" />
									</div> 
									사유 : <input name="reason" type="text" placeholder="사유적기" />
								</td>
							</tr>	
							<tr>
								<th>관용차 대여 요청</th>
								<td>
									<div>
										스타렉스 <input value ="스타렉스" name="item" type="checkbox" class="checkbox checkbox-accent" />
									</div>
									<div>
										제네시스 <input value="제네시스" name="item" type="checkbox" class="checkbox checkbox-accent" />
									</div>
									<div>
										포터 <input value ="포터"name="item" type="checkbox" class="checkbox checkbox-accent" />
									<div>
										사유 : <input name="reason" type="text" placeholder="사유적기" />
									</div>
									</div>
								</td>
							</tr>
							<tr>
						</tbody>
					</table>
				</div>
				<button class="ml-2 btn-text-link btn btn-active" type="submit">신청</button>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button"
					onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
</body>
</html>
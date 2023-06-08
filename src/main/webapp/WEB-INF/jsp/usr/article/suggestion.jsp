<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="container">
	<div>
	<div class="flex justify-center text-3xl mt-10">요청 및 건의 사항</div>

	<section class="mt-8 text-xl ">
		<div class="container mx-auto px-3">
			<form action="/usr/article/insertSuggestion" method="POST"onsubmit="join_submitForm(this); return false;">
			 	<input type="hidden" name="applicant_number" value="${rq.getLoginedMember().getId()}" />
				<div class="">
					<table class="table">
						<colgroup>
							<col width="160" />
						</colgroup>
						<tbody>
							<tr height="145">
							<th>신청자</th>
								<td>
									부서 : ${rq.getLoginedMember().getDepartment()}   직급 : ${rq.getLoginedMember().getPosition()}   이름 : ${rq.getLoginedMember().getName()}
								</td>
							</tr>
							<tr>	
								<th>사무용품 교체,요청</th>
								<td>
									<div>
										<span>모니터 교체 신청</span><input name="item" value="모니터"type="checkbox"  class="checkbox checkbox-accent" />
								
										 <span>pc 교체 신청</span> <input name="item" value="pc" type="checkbox" class="checkbox checkbox-accent" />
								
										<span>의자 교체 신청</span> <input name="item" value ="의자" type="checkbox" class="checkbox checkbox-accent" />
									
										<span>책상 교체 신청</span> <input name="item" value ="책상" type="checkbox"class="checkbox checkbox-accent" />
									</div> 
								</td>
							</tr>		
							<tr>
								<th>관용차 대여 요청</th>
								<td>
									<div>
										<span>스타렉스</span> <input value ="스타렉스" name="item" type="checkbox" class="checkbox checkbox-accent" />
								
										<span>제네시스 </span><input value="제네시스" name="item" type="checkbox" class="checkbox checkbox-accent" />
									
										<span>포터</span> <input value ="포터"name="item" type="checkbox" class="checkbox checkbox-accent" />
									</div>
								</td>
							</tr>
							<tr>
								<th>요청 목록</th>
								<td>
								<c:forEach var="suggestion" items="${showsuggestion}">
									<div>
										<span>신청 사항 : ${suggestion.item}요청 결과 : </span>  
										<c:choose>
							            <c:when test="${suggestion.permission == 1}">
							            <span>승인</span>
							            </c:when>
							            <c:when test="${suggestion.permission == -1}">
							            <span> 거부</span>
							            </c:when>
							            <c:otherwise>
							            <span> 대기중 </span>
							            </c:otherwise>
							        </c:choose>
									</div>
								</c:forEach>
								</td>
							</tr>
							<tr>
						</tbody>
					</table>
				</div>
				<div class="btns mt-2">
				<button class="ml-2 btn-text-link btn btn-active" type="submit">신청</button>
					<button class="btn-text-link btn btn-active" type="button" 
					onclick="window.location.href='/usr/home/main'">뒤로가기</button>
				</div>
			</form>	
		</div>
	</section>
	</div>
</div>
	
	
	  <script>
			function join_submitForm(form) {
    		var checkboxes = form.querySelectorAll('input[type="checkbox"]');
   			var checkedCount = 0;
    
    		for (var i = 0; i < checkboxes.length; i++) {
        		if (checkboxes[i].checked) {
            		checkedCount++;
        		}
    		}
    
    		if (checkedCount === 0) {
        		alert('하나 이상의 체크박스를 선택해주세요.');
        		return false;
    }
    
    // 체크박스가 선택되었을 경우에만 form 제출
    form.submit();
}
</script>

<%@ include file="../common/bottom.jsp" %>
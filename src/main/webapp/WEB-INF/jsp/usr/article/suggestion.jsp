<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/daisyui@1.11.2/dist/full.css" rel="stylesheet">

<div class="text-6xl text-center mb-14">요청 및 건의 사항</div>

<div class="flex justify-center bg-blue items-center">
  <div class="p-16">
    <div class="mx-auto px-3 bg-blue-300 py-9">
      <form class="" action="/usr/article/insertSuggestion" method="POST" onsubmit="join_submitForm(this); return false;">
        <input type="hidden" name="applicant_number" value="${rq.getLoginedMember().getId()}" />
        <div class="flex justify-center">
          <table class="table">
            <tbody>
              <tr>
                <th>신청자</th>
                <td>부서: ${rq.getLoginedMember().getDepartment()} 직급: ${rq.getLoginedMember().getPosition()} 이름: ${rq.getLoginedMember().getName()}</td>
              </tr>
              <tr>
                <th>사무용품 교체 요청</th>
                <td>
                  <div class="space-x-2">
                    <label for="monitor">
                      <input id="monitor" name="item" value="모니터" type="checkbox" class="checkbox checkbox-accent">
                      <span>모니터 교체 신청</span>
                    </label>
                    <label for="pc">
                      <input id="pc" name="item" value="pc" type="checkbox" class="checkbox checkbox-accent">
                      <span>PC 교체 신청</span>
                    </label>
                    <label for="chair">
                      <input id="chair" name="item" value="의자" type="checkbox" class="checkbox checkbox-accent">
                      <span>의자 교체 신청</span>
                    </label>
                    <label for="desk">
                      <input id="desk" name="item" value="책상" type="checkbox" class="checkbox checkbox-accent">
                      <span>책상 교체 신청</span>
                    </label>
                  </div>
                </td>
              </tr>
              <tr>
                <th>관용차 대여 요청</th>
                <td>
                  <div class="space-x-2">
                    <label for="starlet">
                      <input id="starlet" value="스타렉스" name="item" type="checkbox" class="checkbox checkbox-accent">
                      <span>스타렉스</span>
                    </label>
                    <label for="genesis">
                      <input id="genesis" value="제네시스" name="item" type="checkbox" class="checkbox checkbox-accent">
                      <span>제네시스</span>
                    </label>
                    <label for="porter">
                      <input id="porter" value="포터" name="item" type="checkbox" class="checkbox checkbox-accent">
                      <span>포터</span>
                    </label>
                  </div>
                </td>
              </tr>
              <tr>
                <th>요청 목록</th>
                <td style="max-height: 200px; overflow-y: auto;">
                  <div style="overflow-y: scroll; max-height: 200px;">
                    <table class="table">
                      <tbody>
                        <c:forEach var="suggestion" items="${showsuggestion}">
                          <tr>
                            <td>
                              <div>
                                <span>신청 사항: ${suggestion.item} 요청 결과: </span>
                                <c:choose>
                                  <c:when test="${suggestion.permission == 1}">
                                    <span>승인</span>
                                  </c:when>
                                  <c:when test="${suggestion.permission == -1}">
                                    <span>거부</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span>대기중</span>
                                  </c:otherwise>
                                </c:choose>
                              </div>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="btns mt-2">
          <button class="btn-text-link btn btn-active" type="button" onclick="window.location.href='/usr/home/main'">뒤로가기</button>
          <button class="ml-2 btn-text-link btn btn-active" type="submit">신청</button>
        </div>
      </form>
    </div>
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

<%@ include file="../common/bottom.jsp"%>

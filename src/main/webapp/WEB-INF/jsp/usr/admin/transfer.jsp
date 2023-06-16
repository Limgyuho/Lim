<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="transfer" />
<%@ include file="../common/head.jsp"%>

<div class="flex justify-center items-center h-screen bg-gray-100">
  <div class="bg-white w-96 p-8 rounded shadow-lg">
    <h1 class="text-3xl font-bold mb-8">인사이동 관리창</h1>

    <table class="w-full mb-8">
      <tbody>
        <tr>
          <td class="font-bold pr-4 py-2">ID</td>
          <td>${searchMember.getId()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">가입일</td>
          <td>${searchMember.getRegDate()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">로그인 ID</td>
          <td>${searchMember.getLoginId()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">로그인 비밀번호</td>
          <td>${searchMember.getLoginPw()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">직급</td>
          <td>${searchMember.getPosition()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">부서</td>
          <td>${searchMember.getDepartment()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">이름</td>
          <td>${searchMember.getName()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">전화번호</td>
          <td>${searchMember.getCellphoneNum()}</td>
        </tr>
        <tr>
          <td class="font-bold pr-4 py-2">이메일</td>
          <td>${searchMember.getEmail()}</td>
        </tr>
      </tbody>
    </table>

    <form action="transferupdate" class="flex justify-center" method="GET">
      <input type="hidden" name="id" value="${searchMember.getId()}" />
      <div class="mb-4">
        <label class="block font-bold text-gray-700 mb-2" for="department">부서</label>
        <select data-value="${department}" class="select select-bordered" name="department">
          <option value="운영지원과" ${department == '운영지원과' ? 'selected' : ''}>운영지원과</option>
          <option value="정보과" ${department == '정보과' ? 'selected' : ''}>정보과</option>
          <option value="기획재정담당관" ${department == '기획재정담당관' ? 'selected' : ''}>기획재정담당관</option>
          <option value="감사과" ${department == '감사과' ? 'selected' : ''}>감사과</option>
        </select>
      </div>
      <div class="mb-4">
        <label class="block font-bold text-gray-700 mb-2" for="position">직급</label>
        <select data-value="${position}" class="select select-bordered" name="position">
          <option value="과장" ${position == '과장' ? 'selected' : ''}>과장</option>
          <option value="서기관" ${position == '서기관' ? 'selected' : ''}>서기관</option>
          <option value="사무관" ${position == '사무관' ? 'selected' : ''}>사무관</option>
          <option value="주무관" ${position == '주무관' ? 'selected' : ''}>주무관</option>
        </select>
      </div>
      <button style="background-color: #BBDEFB" class="px-4 py-2  rounded" type="submit">변경</button>
    </form>
  </div>
</div>

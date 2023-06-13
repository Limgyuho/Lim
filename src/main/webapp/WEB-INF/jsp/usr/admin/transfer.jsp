<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="transfer" />
<%@ include file="../common/head.jsp"%>
<h1 class="text-2xl text-center">인사이동 관리창 입니다</h1>

<div class="flex justify-center items-center">
  <table class="table-auto">
    <tbody>
      <tr>
        <td class="border px-4 py-2">ID</td>
        <td class="border px-4 py-2">${searchMember.getId()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">가입일</td>
        <td class="border px-4 py-2">${searchMember.getRegDate()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">로그인 ID</td>
        <td class="border px-4 py-2">${searchMember.getLoginId()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">로그인 비밀번호</td>
        <td class="border px-4 py-2">${searchMember.getLoginPw()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">직급</td>
        <td class="border px-4 py-2">${searchMember.getPosition()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">부서</td>
        <td class="border px-4 py-2">${searchMember.getDepartment()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">이름</td>
        <td class="border px-4 py-2">${searchMember.getName()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">전화번호</td>
        <td class="border px-4 py-2">${searchMember.getCellphoneNum()}</td>
      </tr>
      <tr>
        <td class="border px-4 py-2">이메일</td>
        <td class="border px-4 py-2">${searchMember.getEmail()}</td>
      </tr>
    </tbody>
  </table>
</div>

<form action="transferupdate" class="flex justify-center mt-4" method="GET">
  <input type="hidden" name="id" value="${searchMember.getId()}" />
  <div class="mt-4">
    <label class="block mb-2 font-bold text-gray-700" for="department">부서</label>
    <select data-value="${department}" class="select select-bordered" name="department">
      <option value="운영지원과" ${department == '운영지원과' ? 'selected' : ''}>운영지원과</option>
      <option value="정보과" ${department == '정보과' ? 'selected' : ''}>정보과</option>
      <option value="기획재정담당관" ${department == '기획재정담당관' ? 'selected' : ''}>기획재정담당관</option>
      <option value="감사과" ${department == '감사과' ? 'selected' : ''}>감사과</option>
    </select>
  </div>
  <div class="mt-4">
    <label class="block mb-2 font-bold text-gray-700" for="position">직급</label>
    <select data-value="${position}" class="select select-bordered" name="position">
      <option value="과장" ${position == '과장' ? 'selected' : ''}>과장</option>
      <option value="서기관" ${position == '서기관' ? 'selected' : ''}>서기관</option>
      <option value="사무관" ${position == '사무관' ? 'selected' : ''}>사무관</option>
      <option value="주무관" ${position == '주무관' ? 'selected' : ''}>주무관</option>
    </select>
  </div>
  <button class="mt-4 ml-2 px-4 py-2 bg-blue-400 text-black rounded" type="submit">변경</button>
</form>

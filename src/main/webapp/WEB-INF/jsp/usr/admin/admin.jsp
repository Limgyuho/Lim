<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="admin" />
<%@ include file="../common/head.jsp" %>

<form action="doLogin" method="POST">
  <div class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="max-w-md bg-white p-8 rounded-lg shadow-md">
      <h1 class="text-3xl font-bold text-center mb-6">어드민 페이지</h1>
      <hr class="my-4">
      <div class="mt-6">
        <input type="text" name="loginId" placeholder="아이디" class="w-full py-2 px-4 border border-gray-300 rounded focus:outline-none focus:border-blue-500">
      </div>
      <div class="mt-4">
        <input type="password" name="loginPw" placeholder="비밀번호" class="w-full py-2 px-4 border border-gray-300 rounded focus:outline-none focus:border-blue-500">
      </div>
      <div class="flex justify-center mt-6">
        <button type="submit" class="border-green  text-black py-2 px-4 rounded   ">
          로그인
        </button>
      </div>
      <p id="statusMessage"></p>
    </div>
  </div>
</form>



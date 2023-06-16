<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Home" />
<%@ include file="../common/head.jsp"%>

<form action="doLogin" method="post">
  <div class="bg-blue-300 min-h-screen flex items-center justify-center">
    <div class="max-w-md bg-white p-8 rounded-lg shadow-md">
      <h1 class="text-3xl font-bold text-center mb-6">대한민국 공공기관</h1>
      <hr class="my-4">
      <div class="mt-6">
        <input type="text" name="loginId" placeholder="아이디" 
          class="w-full py-2 px-4 border border-gray-300 rounded focus:outline-none focus:border-blue-500">
      </div>
      <div class="mt-4">
        <input type="password" name="loginPw" placeholder="비밀번호" 
          class="w-full py-2 px-4 border border-gray-300 rounded focus:outline-none focus:border-blue-500">
      </div>
      <div class="flex justify-center mt-6">
        <button type="submit"
          class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
          로그인
        </button>	
        <a href="/usr/member/join"
          class="ml-4 bg-white hover:bg-gray-200 text-blue-500 py-2 px-4 rounded focus:outline-none focus:ring-2 focus:ring-blue-500">
          회원가입
        </a>
      </div>
    </div>	
  </div>
</form>

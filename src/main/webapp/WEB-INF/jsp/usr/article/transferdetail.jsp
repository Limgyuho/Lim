<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<h1 class=" font-bold text-5xl text-center m-16">인사이동 발령문</h1>

<div class="flex justify-center items-center ">



  <div class="w-1/2 h-96 border-red rounded-3xl p-8 m-3">
    <div class="p-4">
      <h2 class="text-xl font-bold mb-4 text-2xl">인사이동 발령</h2>	
      <h3 class="text-lg">우리 기관에서 알려드립니다</h3>
      <h3 class="">${member.regDate}부로</h3>
      <h3>${member.name}님 께서 </h3>
      <h3>${member.department} 부서로 인사이동 발령이 있었습니다.</h3>
      <h3 class="text-lg bottom-0">${member.regDate} 기관장 </h3>
      <img src="/resource/images/직인.png" class="sm:">
    </div>
  </div>
</div>

<div class="fixed-bottom">
  <%@ include file="../common/bottom.jsp" %>
</div>

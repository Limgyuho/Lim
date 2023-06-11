<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>

<div class="flex justify-center items-center h-screen">
  <div class="w-1/2 h-96 border-red">
    <div class="p-4">
      <h2 class="text-xl font-bold mb-4">인사이동 발령</h2>
      <p>${member.department} 부서에 인사이동 발령이 있었습니다.</p>
      <p>인사이동 날짜: ${member.regDate}</p>
      <p>인사이동 대상자: ${member.name}</p>
    </div>
  </div>
</div>

<div class="fixed-bottom">
  <%@ include file="../common/bottom.jsp" %>
</div>

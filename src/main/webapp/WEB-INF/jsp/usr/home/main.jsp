<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp" %>
<%@ include file="../common/head.jsp" %>
<div class="w-52 h-20 bg-green-400">
	<input type="hidden" name="id" value="${member.id }"/>
    <div class="logo">
        <img src="로고 이미지 URL" alt="로고">
    </div>
    <div class="user-info">
        <img src="사용자 이미지 URL" alt="사용자 이미지" class="user-image">
        <span>${rq.loginedMember.department }</span>
        <span>${rq.loginedMember.position }</span>
        <span>${rq.loginedMember.name }</span>
       <span class="Messenger" >메신저</span>
        <a href="/usr/home/home">로그아웃</a>

    </div>
</div>
<div class="flex mt-5 justify-center">
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
	 <div class="flex w-80 h-60 border-black block"></div>
</div>



<div class="bottom-bar con-min-width mt-10">
    <div class="con flec justify-end" >
        <div class="box-1">
            <div class="menu-box-1">
                <ul class="flex flex-wrap">
                    <li><a href="#" class="">개인정보처리방침</a></li>
                    <div>|</div>
                    <li><a href="#" class="">전자민원접수</a></li>
                    <div>|</div>
                    <li><a href="#">우리 기관주소</a></li>
                    <div>|</div>
                    <li><a href="#">이용약관</a></li>
                </ul>
            </div>
        </div>
        <div class="box-2">
            <span class="">공공기관 내부망 유지보수</span>
            <span class="">대표전화 044-123-1234 이메일 rbghqodnrl@gmail.com</span>
        </div>
        
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/head.jsp" %>

<script>
  let validLoginId = '';
  function join_submitForm(form) {
	  form.loginId.value = form.loginId.value.trim();
	  if (form.loginId.value.length === 0) {
	    alert('아이디를 입력해주세요');
	    form.loginId.focus();
	    return;
	  }

	  if (form.loginId.value != validLoginId) {
	    alert(form.loginId.value + '은(는) 사용할 수 없는 아이디입니다');
	    form.loginId.value = '';
	    form.loginId.focus();
	    return;
	  }

	  form.loginPw.value = form.loginPw.value.trim();
	  if (form.loginPw.value.length === 0) {
	    alert('비밀번호를 입력해주세요');
	    form.loginPw.focus();
	    return;
	  }

	  form.loginPwChk.value = form.loginPwChk.value.trim();
	  if (form.loginPwChk.value.length === 0) {
	    alert('비밀번호 확인을 입력해주세요');
	    form.loginPwChk.focus();
	    return;
	  }

	  // Password validation: at least one uppercase letter, one lowercase letter, and one special character
	  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;
	  if (!passwordRegex.test(form.loginPw.value)) {
	    alert('비밀번호는 대문자, 소문자, 특수문자를 포함한 8자 이상이어야 합니다');
	    form.loginPw.value = '';
	    form.loginPwChk.value = '';
	    form.loginPw.focus();
	    return;
	  }

	  if (form.loginPw.value != form.loginPwChk.value) {
	    alert('비밀번호가 일치하지 않습니다');
	    form.loginPw.value = '';
	    form.loginPwChk.value = '';
	    form.loginPw.focus();
	    return;
	  }			

	  form.name.value = form.name.value.trim();
	  if (form.name.value.length === 0) {
	    alert('이름을 입력해주세요');
	    form.name.focus();
	    return;
	  }

	  form.cellphoneNum.value = form.cellphoneNum.value.trim();
	  if (form.cellphoneNum.value.length === 0) {
	    alert('전화번호를 입력해주세요');
	    form.cellphoneNum.focus();
	    return;
	  }

	  // Phone number validation: must contain hyphen (-)
	  const phoneRegex = /^(\d{3})-(\d{3,4})-(\d{4})$/;
	  if (!phoneRegex.test(form.cellphoneNum.value)) {
	    alert('전화번호는 하이픈(-)을 포함하여 입력해야 합니다 (예: 010-1234-5678)');
	    form.cellphoneNum.value = '';
	    form.cellphoneNum.focus();
	    return;
	  }

	  form.email.value = form.email.value.trim();
	  if (form.email.value.length === 0) {
	    alert('이메일을 입력해주세요');
	    form.email.focus();
	    return;
	  }

	  // Email validation: basic email format
	  const emailRegex = /^\S+@\S+\.\S+$/;
	  if (!emailRegex.test(form.email.value)) {
	    alert('유효한 이메일 주소를 입력해주세요');
	    form.email.value = '';
	    form.email.focus();
	    return;
	  }

	  form.submit();
	}

  function loginIdDupCheck(el) {
    let loginIdDupCheckMsg = $('#loginIdDupCheckMsg');

    loginIdDupCheckMsg.empty();

    el.value = el.value.trim();

    if (el.value.length == 0) {
      loginIdDupCheckMsg.removeClass('text-green-500');
      loginIdDupCheckMsg.addClass('text-red-500');
      loginIdDupCheckMsg.html('<span>아이디는 필수 입력 정보입니다</span>');
      return;
    }

    $.get('loginIdDupCheck', {
      loginId: el.value,
    }, function (data) {
      if (data.success) {
        loginIdDupCheckMsg.removeClass('text-red-500');
        loginIdDupCheckMsg.addClass('text-green-500');
        loginIdDupCheckMsg.html(`<span>\${data.data1 }은(는) \${data.msg }</span>`);
        validLoginId = data.data1;
      } else {
        loginIdDupCheckMsg.removeClass('text-green-500');
        loginIdDupCheckMsg.addClass('text-red-500');
        loginIdDupCheckMsg.html(`<span>\${data.data1 }은(는) \${data.msg }</span>`);
        validLoginId = '';
      }
    }, 'json');
  }
</script>
<div class=" min-h-screen flex items-center justify-center" style="background-image: url('/resource/images/배경1.png'); background-size: cover;">
<section class="mt-8">
  <h1 class="text-xl text-center">우리기관 회원가입</h1>

  <div class="container mx-auto px-2">
    <form action="/usr/member/dojoin" method="POST" onsubmit="join_submitForm(this); return false;">
      <div class="bg-white shadow rounded p-4">
        <div class="form-group mb-4">
          <label for="loginId" class="block font-semibold mb-1">아이디</label>
          <input type="text" name="loginId" id="loginId" placeholder="아이디를 입력해주세요" onblur="loginIdDupCheck(this);" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
          <div id="loginIdDupCheckMsg" class="text-red-500"></div>
        </div>
        <div class="form-group mb-4">
          <label for="loginPw" class="block font-semibold mb-1">비밀번호</label>
          <input type="password" name="loginPw" id="loginPw" placeholder="비밀번호를 입력해주세요" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
        </div>
        <div class="form-group mb-4">
          <label for="loginPwChk" class="block font-semibold mb-1">비밀번호 확인</label>
          <input type="password" name="loginPwChk" id="loginPwChk" placeholder="비밀번호 확인을 입력해주세요" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
        </div>
        <div class="form-group mb-4">
          <label for="name" class="block font-semibold mb-1">이름</label>
          <input type="text" name="name" id="name" placeholder="이름을 입력해주세요" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
        </div>
        <div class="form-group mb-4">
          <label for="department" class="block font-semibold mb-1">부서</label>
          <select id="department" name="department" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500">
            <option value="운영지원과">운영지원과</option>
            <option value="정보과">정보과</option>
            <option value="기획재정담당관">기획재정담당관</option>
            <option value="감사과">감사과</option>
          </select>
        </div>
        <div class="form-group mb-4">
          <label for="position" class="block font-semibold mb-1">직급</label>
          <select id="position" name="position" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500">
            <option value="과장">과장</option>
            <option value="서기관">서기관</option>
            <option value="사무관">사무관</option>
            <option value="주무관">주무관</option>
          </select>
        </div>
        <div class="form-group mb-4">
          <label for="cellphoneNum" class="block font-semibold mb-1">전화번호</label>
          <input type="text" name="cellphoneNum" id="cellphoneNum" placeholder="전화번호를 입력해주세요" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
        </div>
        <div class="form-group mb-4">
          <label for="email" class="block font-semibold mb-1">이메일</label>
          <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요" class="w-full p-2 border rounded focus:outline-none focus:border-blue-500" />
        </div>
        <div class="button-row flex justify-between items-center">
          <button class="btn btn-primary px-3 py-2 rounded" type="submit">회원가입</button>
          <button class="btn btn-secondary px-3 py-2 rounded" type="button" onclick="history.back();">뒤로가기</button>
        </div>
      </div>
    </form>
  </div>
</section>
</div>


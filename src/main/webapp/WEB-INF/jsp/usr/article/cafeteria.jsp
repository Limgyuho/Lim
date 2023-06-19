<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>

<form id="date-form" action="/usr/article/cafeteria" method="get">
    <label for="date">날짜 선택:</label>
    <input type="date" id="date" name="date" required>
    <button type="submit">변경</button>
</form>

<div class="flex">
    ${date} ${rice} ${soup} ${sideDish1} ${sideDish2} ${sideDish3}
</div>


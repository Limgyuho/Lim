<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>


<div class="border-red mt-24 mx-auto" style="width: 800px;">
	<form id="date-form" action="/usr/article/cafeteria" method="get">
	    <label for="date">날짜 선택:</label>
	    <input type="date" id="date" name="date" required>
	    <button type="submit">변경</button>
	</form>
	
	<div class="text-3xl">점심</div>
	<div class="flex">
		<table>
			<thead>
				<tr>
					<th>선택 날짜</th>
					<th>밥</th>
					<th>국</th>
					<th colspan="3">메뉴1</th>
				</tr>		
			</thead>
			<tbody>
				<tr>
					<td>${date}</td>			
					<td>${rice}</td>			
					<td>${soup}</td>			
					<td colspan="3">${sideDish1}, ${sideDish2}, ${sideDish3}</td>					
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="text-3xl">저녁</div>
	<div class="flex">
		<table>
			<thead>
				<tr>
					<th>선택 날짜</th>
					<th>밥</th>
					<th>국</th>
					<th colspan="3">메뉴1</th>
				</tr>		
			</thead>
			<tbody>
				<tr>
					<td>${date}</td>			
					<td>${rice2}</td>			
					<td>${soup2}</td>			
					<td colspan="3">${sideDish12}, ${sideDish22}, ${sideDish32}</td>					
				</tr>
			</tbody>
		</table>
	</div>
</div>

<%@ include file="../common/bottom.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../home/topbar.jsp"%>
<%@ include file="../common/head.jsp"%>


<div class="container">
    <form id="date-form" action="/usr/article/cafeteria" method="get" class="form-container">
        <label for="date">날짜 선택:</label>
        <input type="date" id="date" name="date" required>
        <button type="submit">변경</button>
    </form>

    <div class="menu-heading">점심 메뉴</div>
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

    <div class="menu-heading">저녁 메뉴</div>
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

<style>
    .container {
        width: 800px;
        margin: 24px auto;
        border: 1px solid #ccc;
        border-radius: 20px;
        padding: 20px;
    }

    .form-container {
        margin-bottom: 20px;
    }

    .form-container label {
        font-size: 18px;
        font-weight: bold;
    }

    .form-container input[type="date"] {
        font-size: 16px;
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .form-container button {
        font-size: 16px;
        padding: 5px 10px;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    .menu-heading {
        font-size: 24px;
        font-weight: bold;
        margin-top: 20px;
    }

   
    table {
        margin-top: 10px;
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
</style>
<%@ include file="../common/bottom.jsp"%>

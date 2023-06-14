<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>

<div class="flex items-center flex-col justify-center h-screen">
    <div class="flex">
        <h2 class="flex-grow-1">가입된 멤버들</h2>
        <h2 class="flex-grow-1 justify-content-end">총 인원 : ${memberCnt}명</h2>
    </div>
    <div class="scrollable-table border-red">
        <table>
            <thead>
                <tr>
                    <th>직급</th>
                    <th>이름</th>
                    <th>전화번호</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${departmentMembers}">
                    <tr>
                        <td>${member.position}</td>
                        <td>
                            <a href="#" class="chat-link" data-member-id="${member.id}">${member.name}</a>
                        </td>
                        <td>${member.cellphoneNum}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="btns mt-2">
        <button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
    </div>
</div>


<script>
    $(document).ready(function () {
        // 채팅 링크 클릭 시 이벤트 처리
        $(".chat-link").on("click", function (event) {
            event.preventDefault();
            var memberId = $(this).data("member-id");
            openChat(memberId);
        });

        // 채팅창 열기
        function openChat(memberId) {
            window.location.href = "/usr/chat/chat/" + memberId;
        }
    });
</script>

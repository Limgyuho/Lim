<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/head.jsp"%>
<script>
    var socket;
    $(document).ready(function () {
        // 이전 메시지 로드
        var previousMessages = localStorage.getItem('chatMessages');
        if (previousMessages) {
            $("#chat-window").html(previousMessages);
        }

        // WebSocket 연결
        socket = new WebSocket("ws://localhost:8085/chat");

        // 연결이 열린 경우
        socket.onopen = function (event) {
            console.log("WebSocket 연결이 열렸습니다.");
        };

        // 메시지 수신
        socket.onmessage = function (event) {
            var message = JSON.parse(event.data);
            console.log('event', event);
            console.log('message', message);
            handleMessage(message);
        };

        var currentUserName = "${userName}"; // 로그인한 사용자의 이름

        // 연결이 닫힌 경우
        socket.onclose = function (event) {
            console.log("WebSocket 연결이 닫혔습니다.");
        };

        // 메시지 전송
        $("#send-button").on("click", function () {
            var messageInput = $("#message-input");
            var message = messageInput.val();

            if (message.trim() !== "") {
                var data = {
                    senderName: currentUserName,
                    content: message
                };
                socket.send(JSON.stringify(data));
                messageInput.val(""); // 입력 필드 초기화
            }
        });

        // 엔터 키 입력 시 메시지 전송
        $("#message-input").on("keydown", function (event) {
            if (event.keyCode === 13) { // 엔터 키
                event.preventDefault();
                $("#send-button").click();
            }
        });

        // 메시지 처리
        function handleMessage(message) {
            console.log(message);
            var senderName = message.senderName;
            var content = message.content;

            var chatMessage = "<p><strong>" + senderName + ":</strong> " + content + "</p>";
            $("#chat-window").append(chatMessage);
            $("#chat-window").scrollTop($("#chat-window")[0].scrollHeight);

            // 현재 메시지와 이전 메시지 저장
            var allMessages = $("#chat-window").html();
            localStorage.setItem('chatMessages', allMessages);
        }
    });
</script>

<h1>채팅 화면</h1>
<div id="chat-window" style="height: 400px; overflow-y: scroll; border: 1px solid #ccc; padding: 10px;"></div>
<input type="text" id="message-input" style="margin-top: 10px;">
<button id="send-button" style="margin-top: 10px;">전송</button>

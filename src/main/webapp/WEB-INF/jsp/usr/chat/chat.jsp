<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat</title>
    <style>
        /* CSS 스타일을 여기에 작성해주세요. */
        #chat-container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #message-container {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        #input-container {
            display: flex;
        }

        #message-input {
            flex-grow: 1;
            margin-right: 10px;
            padding: 5px;
        }

        #send-button {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div id="chat-container">
        <div id="message-container"></div>
        <div id="input-container">
            <input type="text" id="message-input" placeholder="메시지를 입력하세요">
            <button id="send-button">전송</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // WebSocket 연결
            var socket = new WebSocket("ws://localhost:8080/chat");

            // 연결이 열린 경우
            socket.onopen = function (event) {
                console.log("WebSocket 연결이 열렸습니다.");
            };

            // 메시지 수신
            socket.onmessage = function (event) {
                var message = JSON.parse(event.data);
                handleMessage(message);
            };

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
                        senderName: "현재 로그인한 사용자의 이름", // 현재 로그인한 사용자의 이름으로 수정해주세요.
                        content: message
                    };
                    socket.send(JSON.stringify(data));

                    messageInput.val(""); // 입력 필드 초기화
                }
            });

            // 메시지 처리
            function handleMessage(message) {
                var senderName = message.senderName;
                var content = message.content;

                $("#message-container").append("<p><strong>" + senderName + ":</strong> " + content + "</p>");
                // 채팅 메시지를 화면에 추가하는 로직을 작성해주세요.
            }
        });
    </script>
</body>
</html>

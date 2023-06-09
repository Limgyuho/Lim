<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>

<script>
    var ws;

    function wsOpen() {
        ws = new WebSocket("ws://" + location.host + "/websocket");
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function(data) {
            // 소켓이 열리면 동작
            var option = {
                type: "getId",
                sessionId: null
            };
            ws.send(JSON.stringify(option));
        };

        ws.onmessage = function(data) {
            // 메시지를 받으면 동작
            var msg = data.data;
            if (msg != null && msg.trim() != "") {
                var d = JSON.parse(msg);
                if (d.type == "getId") {
                    var si = d.sessionId != null ? d.sessionId : "";
                    if (si != "") {
                        $("#sessionId").val(si);
                    }
                } else if (d.type == "message") {
                    if (d.sessionId == $("#sessionId").val()) {
                        $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");
                    } else {
                        $("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
                    }
                } else {
                    console.warn("unknown type!");
                }
            }
        };

        document.addEventListener("keypress", function(e) {
            if (e.keyCode == 13) {
                // Enter 키를 눌렀을 때
                send();
            }
        });
    }

    function send() {
        var option = {
            type: "message",
            sessionId: $("#sessionId").val(),
            userName: "${member.name}",
            msg: $("#chatting").val()
        };
        ws.send(JSON.stringify(option));
        $("#chatting").val("");
    }

    $(document).ready(function() {
        wsOpen();
    });
</script>

<h1>채팅 화면</h1>
<p>멤버 이름: ${member.name}</p>

<div id="container" class="container">
    <input type="hidden" id="sessionId" value="">
    
    <div id="chating" class="chating">
    </div>
    
    <div id="yourMsg">
        <table class="inputTable">
            <tr>
                <th>메시지</th>
                <th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
                <th><button onclick="send()" id="sendBtn">보내기</button></th>
            </tr>
        </table>
    </div>
</div>

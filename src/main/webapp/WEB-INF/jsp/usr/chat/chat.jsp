<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = ${rq.getLoginedMember().getName()}.val();
		if(userName != null || userName.trim() == ""){
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>

<div id="container" class="container">
	<h1>채팅</h1>
	<input type="hidden" id="sessionId" value="">
	
	<div id="chating" class="chating">
	</div>
	
	<div id="yourName">
		<table class="inputTable">
			<tr>
				<th>사용자명</th>
				<th><input type="text" name="userName" id="userName"></th>
				<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
			</tr>
		</table>
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


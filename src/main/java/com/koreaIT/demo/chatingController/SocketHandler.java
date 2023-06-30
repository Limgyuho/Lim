package com.koreaIT.demo.chatingController;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
	private HashMap<String, ChatSession> sessionMap = new HashMap<>();
	private static final String FILE_UPLOAD_PATH = "C:/test/websocket/";
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);

		System.out.println(obj);
		for (ChatSession chatSession : sessionMap.values()) {
			chatSession.sendMessage(obj.toJSONString());
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		ChatSession chatSession = new ChatSession(session);
		sessionMap.put(session.getId(), chatSession);
		String previousMessages = chatSession.getChatHistory();
		if (previousMessages != null && !previousMessages.isEmpty()) {
			JSONObject obj = new JSONObject();

			chatSession.sendMessage(obj.toJSONString());
		}
	}

	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		
		
		
	    try {

	        JSONObject obj = new JSONObject();

	        for (ChatSession chatSession : sessionMap.values()) {
	            chatSession.sendMessage(obj.toJSONString());
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리를 수행하거나 로깅을 진행할 수 있습니다.
	    }
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		ChatSession chatSession = sessionMap.remove(session.getId());
		if (chatSession != null) {
			chatSession.close();
		}
		super.afterConnectionClosed(session, status);
	}

	private JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}

	private class ChatSession {
		private WebSocketSession session;
		private StringBuilder chatHistory;

		public ChatSession(WebSocketSession session) {
			this.session = session;
			this.chatHistory = new StringBuilder();
		}

		public void sendMessage(String message) {
			try {
				session.sendMessage(new TextMessage(message));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public synchronized void appendToChatHistory(String message) {
			chatHistory.append(message);
			chatHistory.append("\n");
		}

		public String getChatHistory() {
			return chatHistory.toString();
		}

		public void close() {
			try {
				session.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
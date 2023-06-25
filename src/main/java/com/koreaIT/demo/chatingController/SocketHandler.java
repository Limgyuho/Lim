package com.koreaIT.demo.chatingController;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
    // 웹소켓 세션을 담아둘 맵
    HashMap<Long, ChatSession> sessionMap = new HashMap<>();

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 메시지 발송
        String msg = message.getPayload();
        JSONObject obj = jsonToObjectParser(msg);

        // 해당 채팅 세션에 메시지 전송
        Long chatRoomId = extractChatRoomIdFromSession(session);
        if (chatRoomId != null) {
            ChatSession chatSession = sessionMap.get(chatRoomId);
            if (chatSession != null) {
                chatSession.sendMessage(obj.toJSONString());
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결
        super.afterConnectionEstablished(session);
        // ChatSession 생성 및 맵에 추가
        Long chatRoomId = extractChatRoomIdFromSession(session);
        if (chatRoomId != null) {
            ChatSession chatSession = new ChatSession(session);
            sessionMap.put(chatRoomId, chatSession);
            // 이전 메시지 로드 및 전송
            String previousMessages = chatSession.getChatHistory();
            if (previousMessages != null && !previousMessages.isEmpty()) {
                JSONObject obj = new JSONObject();
                obj.put("type", "previousMessages");
                obj.put("messages", previousMessages);
                chatSession.sendMessage(obj.toJSONString());
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료

        // 맵에서 해당 세션 제거 및 ChatSession 닫기
        Long chatRoomId = extractChatRoomIdFromSession(session);
        if (chatRoomId != null) {
            ChatSession chatSession = sessionMap.remove(chatRoomId);
            if (chatSession != null) {
                chatSession.close();
            }
        }
        super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }

    private Long extractChatRoomIdFromSession(WebSocketSession session) {
        String uri = session.getUri().toString();
        String[] parts = uri.split("/");
        if (parts.length > 0) {
            try {
                return Long.parseLong(parts[parts.length - 1]);
            } catch (NumberFormatException e) {
                // 유효한 채팅 방 ID가 아닌 경우 처리
            }
        }
        return null;
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
            } catch (Exception e) {
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
            session = null;
        }
    }
}

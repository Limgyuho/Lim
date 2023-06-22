package com.koreaIT.demo.chatingController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

    // 채팅방 별로 세션을 관리할 맵
    private Map<String, Map<String, ChatSession>> chatRooms = new HashMap<>();

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 메시지 발송
        String msg = message.getPayload();
        JSONObject obj = jsonToObjectParser(msg);

        // 채팅방 ID를 가져옴
        String roomId = (String) obj.get("roomId");

        // 해당 채팅방의 모든 채팅 세션에 메시지 전송
        Map<String, ChatSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            for (ChatSession chatSession : roomSessions.values()) {
                chatSession.sendMessage(obj.toJSONString());
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결
        super.afterConnectionEstablished(session);

        // 요청 URL에서 채팅방 ID 파라미터를 추출
        String roomId = extractRoomIdFromUrl(session.getUri().getPath());

        // 채팅방 ID에 해당하는 채팅 세션 맵을 가져옴
        Map<String, ChatSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions == null) {
            // 채팅방 ID에 해당하는 채팅 세션 맵이 없는 경우 새로 생성
            roomSessions = new HashMap<>();
            chatRooms.put(roomId, roomSessions);
        }

        // ChatSession 생성 및 맵에 추가
        ChatSession chatSession = new ChatSession(session);
        roomSessions.put(session.getId(), chatSession);

        // 이전 메시지 로드 및 전송
        String previousMessages = chatSession.getChatHistory();
        if (previousMessages != null && !previousMessages.isEmpty()) {
            // 이전 메시지를 JSON 형식으로 만들어 전송
            JSONObject obj = new JSONObject();
            obj.put("type", "previousMessages");
            obj.put("messages", previousMessages);
            chatSession.sendMessage(obj.toJSONString());
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료
        // 해당 채팅방의 맵에서 세션 제거 및 ChatSession 닫기
        String roomId = extractRoomIdFromUrl(session.getUri().getPath());
        Map<String, ChatSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            ChatSession chatSession = roomSessions.remove(session.getId());
            if (chatSession != null) {
                chatSession.close();
            }
            if (roomSessions.isEmpty()) {
                chatRooms.remove(roomId);
            }
        }
        super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        // JSON 문자열을 JSONObject로 파싱
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }

    private String extractRoomIdFromUrl(String url) {
        // URL에서 채팅방 ID 추출
        String[] parts = url.split("/");
        return parts[parts.length - 1];
    }

    private class ChatSession {
        // 채팅 세션 정보를 담고 있는 내부 클래스
        private WebSocketSession session;
        private StringBuilder chatHistory;

        public ChatSession(WebSocketSession session) {
            this.session = session;
            this.chatHistory = new StringBuilder();
        }

        public void sendMessage(String message) {
            // 메시지 전송
            try {
                session.sendMessage(new TextMessage(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public synchronized void appendToChatHistory(String message) {
            // 채팅 내역에 메시지 추가
            chatHistory.append(message);
            chatHistory.append("\n");
        }

        public String getChatHistory() {
            // 채팅 내역 반환
            return chatHistory.toString();
        }

        public void close() {
            // 세션 닫기
            session = null;
        }
    }

    public void handleChatMessage(String roomId, String message) {
        // 해당 채팅방의 모든 채팅 세션에 메시지 전송
        Map<String, ChatSession> roomSessions = chatRooms.get(roomId);
        if (roomSessions != null) {
            JSONObject obj = new JSONObject();
            obj.put("type", "chatMessage");
            obj.put("message", message);

            for (ChatSession chatSession : roomSessions.values()) {
                chatSession.sendMessage(obj.toJSONString());
            }
        }
    }
}

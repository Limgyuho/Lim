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
    // 웹소켓 세션을 담아둘 맵
    private HashMap<String, ChatSession> sessionMap = new HashMap<>();

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 메시지 발송
        String msg = message.getPayload();
        JSONObject obj = jsonToObjectParser(msg);

        // 모든 채팅 세션에 메시지 전송
        for (ChatSession chatSession : sessionMap.values()) {
            chatSession.sendMessage(obj.toJSONString());
        }
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결
        super.afterConnectionEstablished(session);
        // ChatSession 생성 및 맵에 추가
        ChatSession chatSession = new ChatSession(session);
        sessionMap.put(session.getId(), chatSession);
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
    public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
        // 파일 처리
        byte[] fileData = message.getPayload().array();
        String fileName = session.getAttributes().get("fileName").toString();
        String senderName = session.getAttributes().get("senderName").toString();
        String roomId = session.getAttributes().get("roomId").toString();

        // 파일 데이터를 Base64로 인코딩
        String fileDataEncoded = Base64.getEncoder().encodeToString(fileData);

        // 파일 전송 메시지 생성
        JSONObject obj = new JSONObject();
        obj.put("type", "file");
        obj.put("senderName", senderName);
        obj.put("content", fileDataEncoded);
        obj.put("roomId", roomId);
        obj.put("fileName", fileName);

        // 모든 채팅 세션에 파일 전송 메시지 전송
        for (ChatSession chatSession : sessionMap.values()) {
            chatSession.sendMessage(obj.toJSONString());
        }
    }



    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료
        // 맵에서 해당 세션 제거 및 ChatSession 닫기
        ChatSession chatSession = sessionMap.remove(session.getId());
        if (chatSession != null) {
            chatSession.close();
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
            // 대화 내용을 채팅 기록에 추가
            chatHistory.append(message);
            chatHistory.append("\n");
        }

        public String getChatHistory() {
            // 채팅 기록 반환
            return chatHistory.toString();
        }

        public void close() {
            // 채팅 세션 종료
            session = null;
        }
    }
}

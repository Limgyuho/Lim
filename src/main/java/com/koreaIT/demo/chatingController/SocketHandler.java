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
    HashMap<String, ChatSession> sessionMap = new HashMap<>();

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

    @SuppressWarnings("unchecked")
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

//    private static String getSessionAttribute(WebSocketSession session, String attributeName) {
//        Object attributeValue = session.getAttributes().get(attributeName);
//        return attributeValue != null ? attributeValue.toString() : null;
//    }

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
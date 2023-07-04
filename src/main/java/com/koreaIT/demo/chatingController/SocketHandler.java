package com.koreaIT.demo.chatingController;

import java.io.File;
import java.io.FileOutputStream;
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
            // WebSocket 메시지에서 바이너리 데이터 가져오기
            byte[] fileBytes = message.getPayload().array();

            // 고유한 파일 이름 생성
            String fileName = generateFileName();

            // 서버에 파일 저장
            String filePath = "/path/to/save/files/" + fileName; // 실제 파일 저장 경로로 변경
            saveFile(fileBytes, filePath);

            // 파일 URL 생성
//            String fileURL = "http://example.com/files/" + fileName; // 서버의 파일 URL로 변경

            // 파일 정보를 담은 JSON 객체 생성
            JSONObject fileMessage = new JSONObject();
//            fileMessage.put("fileName", fileName);
//            fileMessage.put("fileURL", fileURL);

            // 연결된 모든 클라이언트에 파일 메시지 전송
            for (ChatSession chatSession : sessionMap.values()) {
                chatSession.sendMessage(fileMessage.toJSONString());
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    private String generateFileName() {
        return Long.toString(System.currentTimeMillis());
    }

    private void saveFile(byte[] bytes, String filePath) throws IOException {
        File file = new File(filePath);
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(bytes);
        }
    }
}

package com.koreaIT.demo.chatingController;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Component
public class SocketHandler extends TextWebSocketHandler {

    private final Map<Integer, WebSocketSession> sessions = new ConcurrentHashMap<>();

    @Autowired
    private Rq rq;

    @Autowired
    private MemberService memberService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        int loginedMemberId = rq.getLoginedMemberId();
        sessions.put(loginedMemberId, session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        JSONParser parser = new JSONParser();

        try {
            JSONObject jsonObject = (JSONObject) parser.parse(payload);
            String content = (String) jsonObject.get("content");
            String senderName = (String) jsonObject.get("sender");

            int loginedMemberId = rq.getLoginedMemberId();
            Member sender = memberService.getMemberById(loginedMemberId);

            // 메시지 전송 로직 구현
            sendMessageToUser(loginedMemberId, senderName, content);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        int loginedMemberId = rq.getLoginedMemberId();
        sessions.remove(loginedMemberId);
    }

    private void sendMessageToUser(int loginedMemberId, String senderName, String content) throws IOException {
        WebSocketSession session = sessions.get(loginedMemberId);
        if (session != null && session.isOpen()) {
            JSONObject message = new JSONObject();
            message.put("sender", senderName);
            message.put("content", content);

            session.sendMessage(new TextMessage(message.toJSONString()));
        }
    }
}

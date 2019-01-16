package util;
import java.io.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

//@ServerEndpoint("/ChatEchoServer/{myName}")
@ServerEndpoint("/ChatEchoServer/{myRoom}/{myName}")
public class ChatEchoServer {
	
//	private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<Session, String> sessionsMap = new ConcurrentHashMap<>();
	
	@OnOpen
//	public void onOpen(@PathParam("myName") String myName, Session userSession) throws IOException {
	public void onOpen(@PathParam("myRoom") String myRoom, @PathParam("myName") String myName, Session userSession) throws IOException {
//		allSessions.add(userSession);
		sessionsMap.put(userSession, myRoom);
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(myName + ": 已連線");
		System.out.println(myRoom + ": 房號(案例編號)");
		JSONObject jsonObj = new JSONObject();
		try {
			jsonObj.accumulate("online", myName);
			jsonObj.accumulate("missing_case_id", myRoom);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		onLine(sessionsMap, jsonObj.toString());
//		userSession.getBasicRemote().sendText("WebSocket 連線成功");
	}

	
	@OnMessage
	public void onMessage(Session userSession, String message) {
		System.out.println("Message received: " + message);
		System.out.println("sessionsMap.keySet()=== " + sessionsMap.keySet());
		for (Session session : sessionsMap.keySet()) {
			System.out.println("案例編號==="+sessionsMap.get(session)+"，session編號==="+session.getId());
			if (session.isOpen() && message.contains(sessionsMap.get(session)))
				System.out.println("案例編號==="+sessionsMap.get(session)+"，session編號==="+session.getId());
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}
	
	public void onLine(Map<Session, String> sessionsMap, String message) {
		System.out.println("Message received: " + message);
		System.out.println("sessionsMap.keySet()=== " + sessionsMap.keySet().toString());
		for (Session session : sessionsMap.keySet()) {
			System.out.println("案例編號==="+sessionsMap.get(session)+"，session編號==="+session.getId());
			if (session.isOpen() && message.contains(sessionsMap.get(session)))
				System.out.println("案例編號==="+sessionsMap.get(session)+"，session編號==="+session.getId());
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(@PathParam("myRoom") String myRoom, @PathParam("myName") String myName, Session userSession, CloseReason reason) {
		JSONObject jsonObj = new JSONObject();
		try {
			jsonObj.accumulate("offline", myName);
			jsonObj.accumulate("missing_case_id", myRoom);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		offLine(sessionsMap, jsonObj.toString());
		sessionsMap.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}
	
	public void offLine(Map<Session, String> sessionsMap, String message) {
		System.out.println("Message received: " + message);
		System.out.println("sessionsMap.keySet()=== " + sessionsMap.keySet().toString());
		for (Session session : sessionsMap.keySet()) {
			System.out.println("案例編號==="+sessionsMap.get(session)+"，session編號==="+session.getId());
			if (session.isOpen() && message.contains(sessionsMap.get(session)))
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}

 
}

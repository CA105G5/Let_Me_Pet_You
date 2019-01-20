package com.rescue.controller;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;

import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.websocket.CloseReason;

@ServerEndpoint("/RescueEchoServer")
public class RescueEchoServer implements ServletContextListener {
	
private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
	
	public Timer timer = new Timer();
	TimerTask task;
	private RescueService rescueSvc= new RescueService();


	public void contextInitialized(ServletContextEvent event) {
         
	     task = new TimerTask(){
		     public void run(){
		    	 int count = 0; 
		    	 List<RescueVO> list = new RescueService().getAllDelay();
		         List<String> toRsc = new ArrayList();
		         JSONObject jsonObj = new JSONObject();
		         System.out.println("現在時間RescueEchoServer="+new Date());
		         for (RescueVO resVO: list) {
		         	System.out.println("====="+resVO.getRsc_id());
		         	if (resVO.getRsc_etime()==null && new Date().getTime()-resVO.getRsc_btime().getTime()>=60*60*2000) {
			         	System.out.println("RescueEchoServer=====================");
			         	System.out.println("救援案例編號RescueEchoServer="+resVO.getRsc_id());
			         	System.out.println("救援案例開始時間RescueEchoServer="+resVO.getRsc_btime());
			         	toRsc.add(resVO.getRsc_id());
			         	String rsc_name = rescueSvc.getOneRescue(resVO.getRsc_id()).getRsc_name();
			         	try {
							jsonObj.accumulate(resVO.getRsc_id(), rsc_name);
						} catch (JSONException e) {
							e.printStackTrace();
						}
		         	}
		         }
		         sendRescueToAll(allSessions, jsonObj.toString());
		            	
			     System.out.println("This is Task"+ count);
			     System.out.println("工作排定的時間RescueEchoServer = " + new Date(scheduledExecutionTime()));
			     System.out.println("工作執行的時間 RescueEchoServer= " + new Date() + "\n"); 
			     System.out.println("待分配救援案例RescueEchoServer="+toRsc);
			     count++;
		     }
	     };
	     
	     Calendar cal = new GregorianCalendar();
//	     timer.schedule(task, cal.getTime(), 1*60*1000); 
	}
	
	public void contextDestroyed(ServletContextEvent event) {
		// do nothing
		System.out.println("ServletContextListener通知: contextDestroyed....");
	}
	
	@OnOpen
	public void onOpen(Session userSession) throws IOException {
		allSessions.add(userSession);
		System.out.println(userSession.getId() + ": 已連線66666");
//		userSession.getBasicRemote().sendText("WebSocket 連線成功");
	}

	
	@OnMessage
	public void onMessage(Session userSession, String message) {
		for (Session session : allSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received:RescueEchoServer " + message);
	}
	
	public void sendRescueToAll(Set<Session> allSessions, String message) {
		for (Session session : allSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
		
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		allSessions.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}

 
}

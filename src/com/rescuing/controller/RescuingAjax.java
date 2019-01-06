package com.rescuing.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingService;

public class RescuingAjax extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println(action);
		
	
		if ("doneRscPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			JSONArray array = new JSONArray();
			try {

				String rsc_id = req.getParameter("rsc_id");
				
				RescuingService rscuingSvc = new RescuingService();
				Map<String, String[]> map = new TreeMap<String, String[]>();
				map.put("rsc_id",new String[] {rsc_id});
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				
				

				// 回傳
//				List<missingMsgVO> msgList = new ArrayList<missingMsgVO>();
//				msgList.add((missingMsgVO) missingMsgSvc.findByCase(missing_case_id));
//				for (missingMsgVO msg : msgList) {
//					JSONObject obj = new JSONObject();
//					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					obj.put("missing_case_id", msg.getMissing_case_id());
//					obj.put("memb_id", msg.getMemb_id());
//					obj.put("missing_msg_date", sdf.format(msg.getMissing_msg_date()));
//					obj.put("missing_msg_cont", msg.getMissing_msg_cont());
//					array.put(obj);
//
//				}
//				System.out.println(array);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
				failureView.forward(req, res);

			}
//			res.setContentType("text/plain");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			out.write(array.toString());
//			out.flush();
//			out.close();
		}
		
		if ("doneRscNoPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			JSONArray array = new JSONArray();
			try {

				String rsc_id = req.getParameter("rsc_id");
				
				
				
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RescueService rescueSvc = new RescueService();
				

				// 回傳
//				List<missingMsgVO> msgList = new ArrayList<missingMsgVO>();
//				msgList.add((missingMsgVO) missingMsgSvc.findByCase(missing_case_id));
//				for (missingMsgVO msg : msgList) {
//					JSONObject obj = new JSONObject();
//					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//					obj.put("missing_case_id", msg.getMissing_case_id());
//					obj.put("memb_id", msg.getMemb_id());
//					obj.put("missing_msg_date", sdf.format(msg.getMissing_msg_date()));
//					obj.put("missing_msg_cont", msg.getMissing_msg_cont());
//					array.put(obj);
//
//				}
//				System.out.println(array);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
				failureView.forward(req, res);

			}
//			res.setContentType("text/plain");
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			out.write(array.toString());
//			out.flush();
//			out.close();
		}
		
		
	
	
	
	
	
	
	
	}
}

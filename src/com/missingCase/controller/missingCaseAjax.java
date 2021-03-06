package com.missingCase.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.missingCase.model.*;
import com.missingMsg.model.missingMsgService;
import com.missingMsg.model.missingMsgVO;
import com.reportMissing.model.reportMissingService;
import com.reportMissing.model.reportMissingVO;

public class missingCaseAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println(action);
		if ("getChange".equals(action)) {
			String missing_case_id = req.getParameter("missing_case_id");
			String status = req.getParameter("status");
//新增
			// 回傳全部的留言
			if ("上架".equals(status)) {
				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_status_shelve(status);

				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.updateStatus(missing_case_id, status);

			} else if ("下架".equals(status)) {
				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_status_shelve(status);

				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.updateStatus(missing_case_id, status);

			}
			
			
			JSONObject obj = new JSONObject();
			obj.put("missing_case_id", missing_case_id);
			
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(obj.toString());
			out.flush();
			out.close();
		}

		if ("addMsg".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			JSONArray array = new JSONArray();
			try {

				String missing_msg_cont = req.getParameter("missing_msg_cont");
				String missing_case_id = req.getParameter("missing_case_id");
				String memb_id = req.getParameter("memb_id");
				Timestamp missing_msg_date = java.sql.Timestamp.valueOf(req.getParameter("missing_msg_date").trim());

				if (missing_msg_cont == null || missing_msg_cont.trim().length() == 0) {
					errorMsgs.add("留言內容請勿空白!");
				}

				missingMsgVO missingMsgVO = new missingMsgVO();
				missingMsgVO.setMissing_case_id(missing_case_id);
				missingMsgVO.setMemb_id(memb_id);
				missingMsgVO.setMissing_msg_date(missing_msg_date);
				missingMsgVO.setMissing_msg_cont(missing_msg_cont);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("missingMsgVO", missingMsgVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/missingCase/listOneMissingCase.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				missingMsgService missingMsgSvc = new missingMsgService();
				missingMsgVO = missingMsgSvc.addMissingMsg(missing_case_id, memb_id, missing_msg_date,
						missing_msg_cont);

				// 回傳全部留言
				List<missingMsgVO> msgList = new ArrayList<missingMsgVO>();
				msgList.add((missingMsgVO) missingMsgSvc.findByCase(missing_case_id));
				for (missingMsgVO msg : msgList) {
					JSONObject obj = new JSONObject();
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					obj.put("missing_case_id", msg.getMissing_case_id());
					obj.put("memb_id", msg.getMemb_id());
					obj.put("missing_msg_date", sdf.format(msg.getMissing_msg_date()));
					obj.put("missing_msg_cont", msg.getMissing_msg_cont());
					array.put(obj);

				}
				System.out.println(array);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listOneMissingCase.jsp");
				failureView.forward(req, res);

			}
			res.setContentType("text/plain");
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}

		if ("changeStatus".equals(action)) {
			String report_missing_sta = req.getParameter("report_missing_sta");
			String report_missing_id = req.getParameter("report_missing_id");
			if ("通過".equals(report_missing_sta)) {
				reportMissingVO reportMissingVO = new reportMissingVO();
				reportMissingVO.setReport_missing_sta(report_missing_sta);

				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingVO = reportMissingSvc.updateStatus(report_missing_sta, report_missing_id);
			}
			if ("未通過".equals(report_missing_sta)) {
				reportMissingVO reportMissingVO = new reportMissingVO();
				reportMissingVO.setReport_missing_sta(report_missing_sta);

				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingVO = reportMissingSvc.updateStatus(report_missing_sta, report_missing_id);
			}

		}
		if ("reportMissing".equals(action)) {
			String report_missing_id = req.getParameter("report_missing_id");
			String status = req.getParameter("status");
			System.out.println(report_missing_id);
			System.out.println(status);
			if("未通過".equals(status)) {
				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingSvc.updateStatus(status, report_missing_id);
			}else if("通過".equals(status)) {
				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingSvc.updateStatus(status, report_missing_id);
				String missing_case_id = reportMissingSvc.getOneReport(report_missing_id).getMissing_case_id();
				
				missingCaseService missingCaseSvc = new missingCaseService();
				
				missingCaseSvc.updateStatus(missing_case_id, "下架");
			}
			
			
		}
		
	}

}

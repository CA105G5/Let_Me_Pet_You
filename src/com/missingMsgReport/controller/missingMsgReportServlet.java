package com.missingMsgReport.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.missingMsgReport.model.missingMsgReportService;
import com.missingMsgReport.model.missingMsgReportVO;

public class missingMsgReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String missing_msg_id = req.getParameter("missing_msg_id");
				String memb_id = req.getParameter("memb_id");
				String missing_msg_rt_cont = req.getParameter("missing_msg_rt_cont");
				String missing_msg_rt_sta = req.getParameter("missing_msg_rt_sta");
				String missing_case_id = req.getParameter("missing_case_id");

				java.sql.Timestamp missing_msg_rt_time = null;

				if (missing_msg_rt_cont == null || missing_msg_rt_cont.trim().length() == 0) {
					errorMsgs.add("請輸入檢舉理由");
				}

				try {
					missing_msg_rt_time = java.sql.Timestamp.valueOf(req.getParameter("missing_msg_rt_time").trim());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				}

				missingMsgReportVO missingMsgReportVO = new missingMsgReportVO();
				missingMsgReportVO.setMissing_msg_id(missing_msg_id);
				missingMsgReportVO.setMemb_id(memb_id);
				missingMsgReportVO.setMissing_msg_rt_cont(missing_msg_rt_cont);
				missingMsgReportVO.setMissing_msg_rt_sta(missing_msg_rt_sta);
				missingMsgReportVO.setMissing_msg_rt_time(missing_msg_rt_time);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("missingMsgReportVO", missingMsgReportVO); // 含有輸入格式錯誤的reportMissingVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(
							"http://localhost:8081/CA105G5/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id="
									+ missing_case_id);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				missingMsgReportService missingMsgReportSvc = new missingMsgReportService();
				missingMsgReportVO = missingMsgReportSvc.addMissingMsgReport(missing_msg_id, memb_id,
						missing_msg_rt_cont, missing_msg_rt_sta, missing_msg_rt_time);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "http://localhost:8081/CA105G5/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id="
						+ missing_case_id;
				res.sendRedirect(url); // 新增成功後轉交回該檢舉案例

				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listAllMissingCase.jsp");
				failureView.forward(req, res);
			}

		}

	}

}

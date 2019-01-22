package com.reportMissing.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reportMissing.model.reportMissingService;
import com.reportMissing.model.reportMissingVO;

public class reportMissingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println("action==="+action);

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
 
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String missing_case_id = req.getParameter("missing_case_id");
				String memb_id = req.getParameter("memb_id");
				String report_missing_cont = req.getParameter("report_missing_cont");
				String report_missing_sta = req.getParameter("report_missing_sta");
				java.sql.Timestamp report_missing_time = null;
				System.out.println("report_missing_cont==="+report_missing_cont);

				if (report_missing_cont == null || report_missing_cont.trim().length() == 0) {
					errorMsgs.add("請輸入檢舉理由");
				}

				try {
					report_missing_time = java.sql.Timestamp.valueOf(req.getParameter("report_missing_time").trim());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				}

				reportMissingVO reportMissingVO = new reportMissingVO();
				reportMissingVO.setMissing_case_id(missing_case_id);
				reportMissingVO.setMemb_id(memb_id);
				reportMissingVO.setReport_missing_cont(report_missing_cont);
				reportMissingVO.setReport_missing_time(report_missing_time);
				reportMissingVO.setReport_missing_sta(report_missing_sta);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("reportMissingVO", reportMissingVO); // 含有輸入格式錯誤的reportMissingVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(
							"http://localhost:8081/CA105G5/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id="
									+ missing_case_id);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingVO = reportMissingSvc.addReportMissing(missing_case_id, memb_id, report_missing_cont,
						report_missing_sta, report_missing_time);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = req.getContextPath()+"/front-end/missingCase/miss.do?action=getOne_For_Display&missing_case_id="
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
		if ("changeStatus".equals(action)) {

			try {
				String report_missing_sta = req.getParameter("report_missing_sta");
				String report_missing_id = req.getParameter("report_missing_id");
				String missing_case_id = req.getParameter("missing_case_id");
				System.out.println(missing_case_id);
				System.out.println(report_missing_id);
				System.out.println(report_missing_sta);
				reportMissingService reportMissingSvc = new reportMissingService();
				reportMissingSvc.updateStatus(report_missing_sta, report_missing_id, missing_case_id);

				String url = "/back-end/missingCase/back_MissingCaseReport.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/missingCase/back_MissingCaseReport.jsp");
				failureView.forward(req, res);
			}
		}
	}

}

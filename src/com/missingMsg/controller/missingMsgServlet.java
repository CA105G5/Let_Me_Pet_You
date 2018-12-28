package com.missingMsg.controller;

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

import com.missingCase.model.missingCaseService;
import com.missingCase.model.missingCaseVO;
import com.missingMsg.model.missingMsgService;
import com.missingMsg.model.missingMsgVO;

@WebServlet("/missingMsgServlet")
public class missingMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals("action")) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
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
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/missingCase/listOneMissingCase.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listOneMissingCase.jsp
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listOneMissingCase.jsp");
				failureView.forward(req, res);

			}

		}
		if ("update".equals(action)) { // 來自listAllMissingCase.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String missing_msg_id = req.getParameter("missing_msg_id");
				String missing_case_id = req.getParameter("missing_case_id");
				String memb_id = req.getParameter("memb_id");
				java.sql.Timestamp missing_msg_date = java.sql.Timestamp.valueOf(req.getParameter("missing_msg_date").trim());
				String missing_msg_cont = req.getParameter("missing_msg_cont");				
				
				
				
				
				/*************************** 2.開始查詢資料 ****************************************/
				missingMsgService missingMsgSvc = new missingMsgService();
				missingMsgVO missingMsgVO = missingMsgSvc.updateMissingMsg(missing_msg_id, missing_case_id, memb_id, missing_msg_date, missing_msg_cont);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("missingMsgVO", missingMsgVO);
				String url = "/front-end/missingCase/update_missing_msg.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/update_missing_msg.jsp");
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) { // 來自update_missing_msg.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String missing_msg_id = req.getParameter("missing_msg_id");
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
				missingMsgVO.setMissing_msg_id(missing_msg_id);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("missingMsgVO", missingMsgVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/missingCase/listOneMissingCase.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 *****************************************/
				missingMsgService missingMsgSvc = new missingMsgService();
				missingMsgVO = missingMsgSvc.updateMissingMsg(missing_msg_id, missing_case_id, memb_id,
						missing_msg_date, missing_msg_cont);

				List<missingMsgVO> MissingMsgList = missingMsgSvc.findByCase(missing_case_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("MissingMsgList", MissingMsgList);
				String url = "/front-end/missingCase/listOneMissingCase.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listOneMissingCase.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}

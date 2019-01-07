package com.AdoptMsg.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AdoptMsg.model.AdoptMsgService;
import com.AdoptMsg.model.AdoptMsgVO;

public class AdoptMsgServlet extends HttpServlet {
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
				String adopt_id = req.getParameter("adopt_id");
				String adopt_msg_sper = req.getParameter("adopt_msg_sper");
				String adopt_msg_comm = req.getParameter("adopt_msg_comm");
				
				if(adopt_msg_comm == null || adopt_msg_comm.trim().length() ==0) {
					errorMsgs.add("留言請勿空白");
				}
				
				AdoptMsgVO adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_id(adopt_id);
				adoptMsgVO.setAdopt_msg_sper(adopt_msg_sper);
				adoptMsgVO.setAdopt_msg_comm(adopt_msg_comm);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adoptMsgVO", adoptMsgVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/adopt/listOneAdopt.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				System.out.println(adopt_id);
				System.out.println(adopt_msg_sper);
				System.out.println(adopt_msg_comm);
				AdoptMsgService adoptMsgSvc = new AdoptMsgService();
				adoptMsgVO = adoptMsgSvc.addAdopMsg(adopt_id, adopt_msg_sper, adopt_msg_comm);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = req.getContextPath()+"/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="+adopt_id;
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listOneMissingCase.jsp
//				successView.forward(req, res);
				res.sendRedirect(url);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/adopt/listOneAdopt.jsp");
				failureView.forward(req, res);

			}
		}
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String adopt_id = req.getParameter("adopt_id");
				String adopt_msg_sper = req.getParameter("adopt_msg_sper");
				String adopt_msg_comm = req.getParameter("adopt_msg_comm");
				java.sql.Timestamp adopt_msg_time = java.sql.Timestamp.valueOf(req.getParameter("adopt_msg_time").trim());
				String adopt_msg_id = req.getParameter("adopt_msg_id");
				/*************************** 2.開始修改資料 ****************************************/
				AdoptMsgService adoptMsgSvc = new AdoptMsgService();
				AdoptMsgVO adoptMsgVO = adoptMsgSvc.updateAdoptMsg(adopt_id, adopt_msg_sper, adopt_msg_time, adopt_msg_comm, adopt_msg_id);
				/*************************** 3.修改完成,準備轉交(Send the Success view) ************/
				req.setAttribute("adoptMsgVO", adoptMsgVO);
				String url = "/front-end/adopt/listOneAdopt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/adopt/listOneAdopt.jsp");
				failureView.forward(req, res);
			}

		}
	
	
	
	
	
	
	
	}

}

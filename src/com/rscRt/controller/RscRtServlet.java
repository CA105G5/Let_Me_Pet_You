package com.rscRt.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rscRt.model.RscRtService;
import com.rscRt.model.RscRtVO;


public class RscRtServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		

		 if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				String requestURL = req.getParameter("requestURL");
				System.out.println("requestURL="+requestURL);
				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					//案例編號
					String rsc_id = req.getParameter("rsc_id");
					//會員編號
					String memb_id = req.getParameter("memb_id");
			        //時間取加入的當下
					java.sql.Timestamp rsc_rt_time = new Timestamp(new Date().getTime());
				    //狀態
					String rsc_rt_status = "未審核";
					//檢舉理由
					String rsc_rt_comm = req.getParameter("rsc_rt_comm").trim();
					if (rsc_rt_comm == null || rsc_rt_comm.trim().length() == 0) {
						errorMsgs.add("檢舉原因請勿空白");
					}
					
					       RscRtVO rscRtVO = new RscRtVO();
					
							rscRtVO.setRsc_id(rsc_id);
							rscRtVO.setMemb_id(memb_id);
							rscRtVO.setRsc_rt_time(rsc_rt_time);
							rscRtVO.setRsc_rt_comm(rsc_rt_comm);
							rscRtVO.setRsc_rt_status(rsc_rt_status);
							

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						
					
						RequestDispatcher failureView = req
								.getRequestDispatcher(requestURL);
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					RscRtService rscRtSvc = new RscRtService();
					rscRtSvc.addRscRt(rscRtVO);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
//					RescueService rescueSvc = new RescueService();
//					RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
//					req.setAttribute("rescueVO", rescueVO);
//					req.setAttribute("rescuingVO", rescuingVO); 
					
					RequestDispatcher successView = req.getRequestDispatcher(requestURL); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher(requestURL);
					failureView.forward(req, res);	
				}
			}
		
	}
}

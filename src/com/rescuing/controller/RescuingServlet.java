package com.rescuing.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingService;
import com.rescuing.model.RescuingVO;

public class RescuingServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
				System.out.println("1111111111111111111111111");

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					//案例編號
					String rsc_id = req.getParameter("rsc_id");
					//加入會員
					String rscing_ptcp = req.getParameter("rscing_ptcp");
			        //日期取加入的當下
					java.sql.Timestamp rscing_btime = new Timestamp(new Date().getTime());
				    //加入救援者狀態
					String rscing_sta = "救援中";
					//
					
					       RescuingVO rescuingVO = new RescuingVO();
					
							rescuingVO.setRsc_id(rsc_id);
							rescuingVO.setRscing_ptcp(rscing_ptcp);
							rescuingVO.setRscing_btime(rscing_btime);
							rescuingVO.setRscing_sta(rscing_sta);
							

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RescueService rescueSvc = new RescueService();
						RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
						req.setAttribute("rescueVO", rescueVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/rescue/listOneRescue.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					RescuingService rescuingSvc = new RescuingService();
					rescuingSvc.addRescuing(rescuingVO);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					RescueService rescueSvc = new RescueService();
					RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
					req.setAttribute("rescueVO", rescueVO);
					req.setAttribute("rescuingVO", rescuingVO); 
					String url = "/front-end/rescue/listOneRescue.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/rescue/listOneRescue.jsp");
					failureView.forward(req, res);	
				}
			}
			if ("rescueReport".equals(action)) {

				try {
					// Retrieve form parameters.
					String rsc_id = req.getParameter("rsc_id");
					String rscing_ptcp = req.getParameter("rscing_ptcp");
					RescuingService rescuingSvc = new RescuingService();
					RescuingVO rescuingVO = rescuingSvc.findself(rsc_id,rscing_ptcp);
					

					req.setAttribute("rescuingVO",rescuingVO ); // 資料庫取出的empVO物件,存入req
					
					//Bootstrap_modal
					boolean openModal=true;
					req.setAttribute("openModal",openModal );
					
					// 取出的empVO送給listOneEmp.jsp
					RequestDispatcher successView = req
							.getRequestDispatcher("/frond-end/rescue/listMemRescue.jsp");
					successView.forward(req, res);
					return;

					// Handle any unusual exceptions
				} catch (Exception e) {
					throw new ServletException(e);
				}
			}
			
		
		
		
		
		
		
	}
	
}

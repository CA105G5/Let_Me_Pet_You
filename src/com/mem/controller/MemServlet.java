package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;

public class MemServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("getOne".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************接收請求參數輸入格式錯誤處理*********************/
				String str = req.getParameter("memb_id"); 
				if(str == null || str.trim().length() == 0) {
						errorMsgs.add("請輸入會員編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				
				if(str.trim().length()!=10) {
					errorMsgs.add("會員編號長度不正確");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/****************************開始查詢資料***************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(str);
				if(memVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/****************************查詢完成準備轉交***************************/
				req.setAttribute("memVO", memVO);
				RequestDispatcher successView = 
						req.getRequestDispatcher("/back-end/members/listOneMember.jsp");
				successView.forward(req, res);
				
				
				/****************************其他可能錯誤處理***************************/
			}catch(Exception e) {
				errorMsgs.add("無法取得資料"+e.getMessage());
				RequestDispatcher failureView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				failureView.forward(req, res);
			}
			
			
			
		}
		if("getAll".equals(action)) {
			RequestDispatcher successView = 
					req.getRequestDispatcher("/back-end/members/listAllMembers.jsp");
			successView.forward(req, res);
		}
		if("updateFromManager".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.接收請求參數****************************************/
				String memb_id = req.getParameter("memb_id");
				
				/***************************2.開始查詢資料****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(memb_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("memVO", memVO);         // 資料庫取出的empVO物件,存入req
				String url = "/back-end/members/manager_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/members/listAllMembers.jsp");
				failureView.forward(req, res);
			}	
		}
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memb_id = req.getParameter("memb_id");
				String memb_sta= req.getParameter("memb_sta");
				Integer memb_vio_times=new Integer(req.getParameter("memb_vio_times"));
				MemVO memVO = new MemVO();
				memVO.setMemb_id(memb_id);
				memVO.setMemb_sta(memb_sta);
				memVO.setMemb_vio_times(memb_vio_times);
				
				/***************************2.開始修改資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.managerUpdateMem(memb_id, memb_sta, memb_vio_times);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO);
				String url = "/back-end/members/listAllMembers.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
				
				
				
				
			}catch(Exception e) {
				errorMsgs.add("無法修改資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/members/manager_update.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
	}
}

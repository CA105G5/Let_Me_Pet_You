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
		if("mamager_update".equals(action)) {
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
		if("updateFromClient".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.接收請求參數****************************************/
				String memb_acc = req.getParameter("memb_acc");
				
				/***************************2.開始查詢資料****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getMemSelf(memb_acc);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("memVO", memVO);         // 資料庫取出的empVO物件,存入req
				String url = "/front-end/members/client_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 client_update.jsp
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/members/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if("client_update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memb_id = req.getParameter("memb_id");
				String memb_acc = req.getParameter("memb_acc");
				String memb_psw = req.getParameter("memb_psw");
				String memb_name = req.getParameter("memb_name");
				String memb_nick = req.getParameter("memb_nick");
				String memb_email = req.getParameter("memb_email");
				String memb_cellphone = req.getParameter("memb_cellphone");
				String memb_gender = req.getParameter("memb_gender");
				String memb_cre_type = req.getParameter("memb_cre_type");
				String memb_cre_name = req.getParameter("memb_cre_name");
				String memb_cre_year = req.getParameter("memb_cre_year");
				String memb_cre_month = req.getParameter("memb_cre_month");
				byte[] memb_photo=null;
				
				MemVO memVO = new MemVO();
				memVO.setMemb_id(memb_id);
				memVO.setMemb_acc(memb_acc);
				
				/***************************2.開始修改資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc
						.clientUpdateMem(memb_id,memb_acc, memb_psw, memb_name, memb_nick, memb_email, 
								memb_cellphone, memb_gender, memb_cre_type, memb_cre_name, 
								memb_cre_year, memb_cre_month, memb_photo);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO);
				String url = "/front-end/members/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
				
				
				
				
			}catch(Exception e) {
				errorMsgs.add("無法修改資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/members/client_update.jsp");
				failureView.forward(req, res);
			}
			
		}
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memb_acc = req.getParameter("memb_acc");
				String memb_psw = req.getParameter("memb_psw");
				String memb_name = req.getParameter("memb_name");
				String memb_nick = req.getParameter("memb_nick");
				String memb_email = req.getParameter("memb_email");
				String memb_cellphone = req.getParameter("memb_cellphone");
				String memb_gender = req.getParameter("memb_gender");
				String memb_cre_type = req.getParameter("memb_cre_type");
				String memb_cre_name = req.getParameter("memb_cre_name");
				String memb_cre_year = req.getParameter("memb_cre_year");
				String memb_cre_month = req.getParameter("memb_cre_month");
				byte[] memb_photo=null;
				String memb_fb_login="";
				String memb_google_login="";
				MemVO memVO = new MemVO();
				
				/***************************2.開始新增資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.addMem(memb_acc, memb_psw, memb_name, memb_nick, 
						memb_email, memb_cellphone, memb_gender, 
						memb_cre_type, memb_cre_name, memb_cre_year, memb_cre_month, 
						memb_photo, memb_fb_login, memb_google_login);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO);
				String url = "/front-end/members/becomeNewMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
						
				
			}catch(Exception e) {
				errorMsgs.add("無法新增資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/members/addMembers.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
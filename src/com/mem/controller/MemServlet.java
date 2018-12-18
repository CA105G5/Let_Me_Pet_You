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
		if("getALL".equals("action")) {
			
			
			
			
		}
		if("insert".equals("action")) {
			
			
			
			
		}
		if("update".equals("action")) {
			
			
			
			
		}
		if("delete".equals("action")) {
			
			
			
			
		}
		
		
	}
}

package com.volunteer.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.volunteer.model.*;

public class VolunteerServlet extends HttpServlet{


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action =req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String volunteeridStr = req.getParameter("volunteer");
				if (volunteeridStr == null || (volunteeridStr.trim()).length() == 0) {
					errorMsgs.add("請輸入志工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/volunteer/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String checkid = "^[V]\\d{9}$";
				if(!volunteeridStr.matches(checkid)) {
					errorMsgs.add("志工編號格式不正確");
				}
					
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/volunteer/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				VolunteerVO volunteerVO = volunteerSvc.getOneVolunteer(volunteeridStr);
				if (volunteerVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/volunteer/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("volunteerVO", volunteerVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/volunteer/listOneVolunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		 
		
	}
	
	

}

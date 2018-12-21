package com.donate.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.donate.model.DonateService;
import com.donate.model.DonateVO;

public class DonateServlet extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
			doPost(req, res);
		}

		public void doPost(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			
			
			if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String str = req.getParameter("donate_id");
//					if (str == null || (str.trim()).length() == 0) {
//						errorMsgs.add("請輸入員工編號");
//					}
					// Send the use back to the form, if there were errors
//					if (!errorMsgs.isDonatety()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/emp/select_page.jsp");
//						failureView.forward(req, res);
//						return;//程式中斷
//					}
					
//					Integer empno = null;
//					try {
//						empno = new Integer(str);
//					} catch (Exception e) {
//						errorMsgs.add("員工編號格式不正確");
//					}
//					// Send the use back to the form, if there were errors
//					if (!errorMsgs.isDonatety()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/emp/select_page.jsp");
//						failureView.forward(req, res);
//						return;//程式中斷
//					}
					
					/***************************2.開始查詢資料*****************************************/
					DonateService donSvc = new DonateService();
					DonateVO donateVO = donSvc.getOneDonate(str);
					if (donateVO == null) {
						errorMsgs.add("查無資料");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/emp/select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					req.setAttribute("donateVO", donateVO); // 資料庫取出的donateVO物件,存入req
					String url = "/emp/listOneDonate.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneDonate.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/select_page.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
	        if ("insert_cre".equals(action)) { // 來自addDonate.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					String donate_amount = req.getParameter("donate_amount");
					//donate_amount錯誤驗證
					String donate_amount_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_amount);
					if (donate_amount == null || donate_amount.trim().length() == 0) {
						//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
						errorMsgs.add("捐贈金額請勿空白");
					} else if(donate_amount.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("捐贈金額請勿為零");
		            } else if(!donate_amount.trim().matches(donate_amount_Reg)) { //以下練習正則(規)表示式(regular-expression)
		            	errorMsgs.add("捐贈金額只能是數字, 且必須大於零");
		            }
					Integer donate_amount_int = null;
					try {
						donate_amount_int = new Integer(donate_amount);
					} catch (NumberFormatException e) {
//						donate_amount = 0;
						System.out.println("$$$$$$$$$$");
					}
					
					String donate_private_status;
					String donate_private = req.getParameter("donate_private");
					if (donate_private.equals("true")) {
						donate_private_status = "匿名";
					} else {
						donate_private_status = "不匿名";
					}
					
					String donate_src = req.getParameter("donate_src");
					String donate_src_cre = req.getParameter("donate_src_cre");
					String donate_src_cre1 = req.getParameter("donate_src_cre1");
					String donate_src_cre2 = req.getParameter("donate_src_cre2");
					String donate_src_cre3 = req.getParameter("donate_src_cre3");
					String donate_src_cre_month = req.getParameter("donate_src_cre_month");
					String donate_src_cre_year = req.getParameter("donate_src_cre_year");
					String donate_src_cre_last = req.getParameter("donate_src_cre_last");
					
					String donate_src_cre_Reg = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_src_cre_Reg);
					
					String donate_src_cre_Reg1 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_src_cre_Reg1);
					
					String donate_src_cre_Reg2 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_src_cre_Reg2);
					
					String donate_src_cre_Reg3 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_src_cre_Reg3);
					
					String donate_src_cre_last_Reg = "^[0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
					System.out.println(donate_src_cre_last_Reg);
					
						if (donate_src_cre == null || donate_src_cre.trim().length() == 0 
								|| donate_src_cre1 == null || donate_src_cre1.trim().length() == 0 
								|| donate_src_cre2 == null || donate_src_cre2.trim().length() == 0 
								|| donate_src_cre3 == null || donate_src_cre3.trim().length() == 0) {
							errorMsgs.add("信用卡號碼請勿空白");						
						}
						if(donate_src_cre_month == null || donate_src_cre_month.equals(0)
								|| donate_src_cre_year == null || donate_src_cre_year.equals(0)){
							errorMsgs.add("請選擇信用卡有效年月");	
						}
						if(donate_src_cre_last == null || donate_src_cre_last.trim().length() == 0){
							errorMsgs.add("信用卡驗證碼請勿空白");	
						}
						if(!donate_src_cre.trim().matches(donate_src_cre_Reg) 
									|| !donate_src_cre1.trim().matches(donate_src_cre_Reg1)
									|| !donate_src_cre2.trim().matches(donate_src_cre_Reg2)
									|| !donate_src_cre3.trim().matches(donate_src_cre_Reg3)) { //以下練習正則(規)表示式(regular-expression)
			            	errorMsgs.add("信用卡號碼請填入四位數字");
			            }
						if(!donate_src_cre_last.trim().matches(donate_src_cre_last_Reg)) { //以下練習正則(規)表示式(regular-expression)
							errorMsgs.add("信用卡驗證碼請填入三位數字");
						}
					
					String donate_name = req.getParameter("donate_name");
					String donate_phone = req.getParameter("donate_phone");
					String donate_mail = req.getParameter("donate_mail");
					
					
					DonateVO donateVO = new DonateVO();
					donateVO.setDonate_amount(donate_amount_int);
					donateVO.setDonate_private(donate_private_status);
					donateVO.setDonate_src(donate_src);
					donateVO.setDonate_src_cre(donate_src_cre);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("donateVO", donateVO); // 含有輸入格式錯誤的donateVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/emp/addDonate.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					DonateService donSvc = new DonateService();
					donSvc.addDonate(donateVO);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/emp/listAllDonate.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDonate.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/addDonate.jsp");
					failureView.forward(req, res);
				}
			}
			
	        if ("insert_trn".equals(action)) { // 來自addDonate.jsp的請求  
	        	
	        	List<String> errorMsgs = new LinkedList<String>();
	        	// Store this set in the request scope, in case we need to
	        	// send the ErrorPage view.
	        	req.setAttribute("errorMsgs", errorMsgs);
	        	
	        	try {
	        		/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
	        		String bank_id = req.getParameter("bank_id");
	        		
	        		String donate_amount = req.getParameter("donate_amount");
	        		//donate_amount錯誤驗證
	        		String donate_amount_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
	        		System.out.println(donate_amount);
	        		if (donate_amount == null || donate_amount.trim().length() == 0) {
	        			//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
	        			errorMsgs.add("捐贈金額請勿空白");
	        		} else if(donate_amount.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
	        			errorMsgs.add("捐贈金額請勿為零");
	        		} else if(!donate_amount.trim().matches(donate_amount_Reg)) { //以下練習正則(規)表示式(regular-expression)
	        			errorMsgs.add("捐贈金額只能是數字, 且必須大於零");
	        		}
	        		Integer donate_amount_int = null;
	        		try {
	        			donate_amount_int = new Integer(donate_amount);
	        		} catch (NumberFormatException e) {
//						donate_amount = 0;
	        			System.out.println("$$$$$$$$$$");
	        		}
	        		
	        		String donate_private_status;
	        		String donate_private = req.getParameter("donate_private");
	        		if (donate_private.equals("true")) {
	        			donate_private_status = "匿名";
	        		} else {
	        			donate_private_status = "不匿名";
	        		}
	        		
	        		String donate_src = req.getParameter("donate_src");
	        		String donate_src_trn = req.getParameter("donate_src_trn");
	        		
	        		String donate_name = req.getParameter("donate_name");
	        		String donate_phone = req.getParameter("donate_phone");
	        		String donate_mail = req.getParameter("donate_mail");
	        		String donate_date = req.getParameter("donate_date");
	        		
	        		
	        		if (bank_id == null || bank_id.equals(0)) {
	        			//donate_id其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上donate_id == null
	        			errorMsgs.add("請選擇銀行代碼");
	        		}
	        			
	        		if (donate_src_trn == null || donate_src_trn.trim().length() == 0) {
	        			errorMsgs.add("請輸入轉帳帳號後四碼");						
	        		} 
	        			
	        		if(donate_date == null || donate_date.trim().length() == 0) {
	        			errorMsgs.add("請輸入轉帳日期");
	        		}
	        		
	        		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String time = df.format(donate_date);
					Timestamp date = Timestamp.valueOf(time);
	        		
	        		DonateVO donateVO = new DonateVO();
	        		donateVO.setBank_id(bank_id);
	        		donateVO.setDonate_amount(donate_amount_int);
	        		donateVO.setDonate_date(date);
	        		donateVO.setDonate_private(donate_private_status);
	        		donateVO.setDonate_src(donate_src);
	        		donateVO.setDonate_src_trn(donate_src_trn);
	        		
	        		// Send the use back to the form, if there were errors
	        		if (!errorMsgs.isEmpty()) {
	        			req.setAttribute("donateVO", donateVO); // 含有輸入格式錯誤的donateVO物件,也存入req
	        			RequestDispatcher failureView = req
	        					.getRequestDispatcher("/emp/addDonate.jsp");
	        			failureView.forward(req, res);
	        			return;
	        		}
	        		
	        		/***************************2.開始新增資料***************************************/
	        		DonateService donSvc = new DonateService();
	        		donSvc.addDonate(donateVO);
	        		
	        		/***************************3.新增完成,準備轉交(Send the Success view)***********/
	        		String url = "/emp/listAllDonate.jsp";
	        		RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDonate.jsp
	        		successView.forward(req, res);				
	        		
	        		/***************************其他可能的錯誤處理**********************************/
	        	} catch (Exception e) {
	        		errorMsgs.add(e.getMessage());
	        		RequestDispatcher failureView = req
	        				.getRequestDispatcher("/emp/addDonate.jsp");
	        		failureView.forward(req, res);
	        	}
	        }
	        
			
	        
	        //不會有刪除捐贈 & 修改捐贈
//			if ("delete".equals(action)) { // 來自listAllDonate.jsp
//
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//		
//				try {
//					/***************************1.接收請求參數***************************************/
//					String donate_id = req.getParameter("donate_id");
//					
//					/***************************2.開始刪除資料***************************************/
//					DonateService donSvc = new DonateService();
//					donSvc.deleteDonate(donate_id);
//					
//					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//					String url = "/emp/listAllDonate.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//					successView.forward(req, res);
//					
//					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("刪除資料失敗:"+e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/listAllDonate.jsp");
//					failureView.forward(req, res);
//				}
//			}
		}
	}

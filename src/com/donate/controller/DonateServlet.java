package com.donate.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.CurrencyDetail.model.CurDtJDBCDAO;
import com.CurrencyDetail.model.CurDtVO;
import com.donate.model.DonateService;
import com.donate.model.DonateVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.ntf.model.NtfJDBCDAO;
import com.ntf.model.NtfVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;

public class DonateServlet extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
			doPost(req, res);
		}

		public void doPost(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			String action = req.getParameter("action");
			System.out.println("action=" + action);
			
			
			HttpSession session = req.getSession();
			
			//收款更新
			if ("receive_update".equals(action)) { // 來自select_page.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String donate_id = req.getParameter("donate_id");
					System.out.println("donate_id"+donate_id);
					String donate_status = req.getParameter("donate_status");
					System.out.println("donate_status"+donate_status);
					
					/***************************2.開始查詢資料*****************************************/
					DonateService donSvc = new DonateService();
					DonateVO donateVO = donSvc.getOneDonate(donate_id);
					Integer coin = donateVO.getDonate_amount()/100;
					String memb_id = donateVO.getMemb_id();
					
					//更新收款狀態&愛心幣發放金額
					donateVO.setDonate_status(donate_status);
					donateVO.setDonate_coin(coin);
					donSvc.updateDonate(donateVO);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					
//					req.setAttribute("donateVO", donateVO); // 資料庫取出的donateVO物件,存入req
//					String url = req.getContextPath()+"/back-end/product/back_Money_Don.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneDonate.jsp
//					successView.forward(req, res);
					
					
					out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
					System.out.println("!!!!!!!!!!!");
					


					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/select_page.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
	        if ("check_total_by_month".equals(action)) { // 來自addDonate.jsp的請求  
				
				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					String donate_year = req.getParameter("donate_year");
					System.out.println("donate_year"+donate_year);
					
					String donate_month = req.getParameter("donate_month");
					System.out.println("donate_month"+donate_month);
					
					
					/***************************2.開始新增資料***************************************/
					DonateService donSvc = new DonateService();
					int total = donSvc.getAllByDate(donate_year, donate_month);
					
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					
					out.println(total); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
					System.out.println("!!!!!!!!!!!");
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/addDonate.jsp");
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
	        		System.out.println("donate_amount"+donate_amount);
	        		//donate_amount錯誤驗證
//					String donate_amount_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_amount);
//					if (donate_amount == null || donate_amount.trim().length() == 0) {
//						//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
//						errorMsgs.add("捐贈金額請勿空白");
//					} else if(donate_amount.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
//						errorMsgs.add("捐贈金額請勿為零");
//		            } else if(!donate_amount.trim().matches(donate_amount_Reg)) { //以下練習正則(規)表示式(regular-expression)
//		            	errorMsgs.add("捐贈金額只能是數字, 且必須大於零");
//		            }
	        		Integer donate_amount_int = null;
	        		try {
	        			donate_amount_int = new Integer(donate_amount);
	        		} catch (NumberFormatException e) {
//						donate_amount = 0;
	        			System.out.println("$$$$$$$$$$");
	        		}
	        		System.out.println("donate_amount_int"+donate_amount_int);
	        		
//					String donate_private_status;
//					String donate_private = req.getParameter("donate_private");
//					if (donate_private.equals("true")) {
//						donate_private_status = "匿名";
//					} else {
//						donate_private_status = "不匿名";
//					}
	        		
	        		String donate_src = req.getParameter("donate_src");
	        		System.out.println("donate_src"+donate_src);
	        		String donate_src_cre = req.getParameter("donate_src_cre");
	        		System.out.println("donate_src_cre"+donate_src_cre);
//					String donate_src_cre1 = req.getParameter("donate_src_cre1");
//					String donate_src_cre2 = req.getParameter("donate_src_cre2");
//					String donate_src_cre3 = req.getParameter("donate_src_cre3");
//					String donate_src_cre_month = req.getParameter("donate_src_cre_month");
//					String donate_src_cre_year = req.getParameter("donate_src_cre_year");
//					String donate_src_cre_last = req.getParameter("donate_src_cre_last");
	        		
//					String donate_src_cre_Reg = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_src_cre_Reg);
//					
//					String donate_src_cre_Reg1 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_src_cre_Reg1);
//					
//					String donate_src_cre_Reg2 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_src_cre_Reg2);
//					
//					String donate_src_cre_Reg3 = "^[0-9][0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_src_cre_Reg3);
//					
//					String donate_src_cre_last_Reg = "^[0-9][0-9][0-9]$"; //練習用正規表達式來做錯誤驗證
//					System.out.println(donate_src_cre_last_Reg);
//					
//						if (donate_src_cre == null || donate_src_cre.trim().length() == 0 
//								|| donate_src_cre1 == null || donate_src_cre1.trim().length() == 0 
//								|| donate_src_cre2 == null || donate_src_cre2.trim().length() == 0 
//								|| donate_src_cre3 == null || donate_src_cre3.trim().length() == 0) {
//							errorMsgs.add("信用卡號碼請勿空白");						
//						}
//						if(donate_src_cre_month == null || donate_src_cre_month.equals(0)
//								|| donate_src_cre_year == null || donate_src_cre_year.equals(0)){
//							errorMsgs.add("請選擇信用卡有效年月");	
//						}
//						if(donate_src_cre_last == null || donate_src_cre_last.trim().length() == 0){
//							errorMsgs.add("信用卡驗證碼請勿空白");	
//						}
//						if(!donate_src_cre.trim().matches(donate_src_cre_Reg) 
//									|| !donate_src_cre1.trim().matches(donate_src_cre_Reg1)
//									|| !donate_src_cre2.trim().matches(donate_src_cre_Reg2)
//									|| !donate_src_cre3.trim().matches(donate_src_cre_Reg3)) { //以下練習正則(規)表示式(regular-expression)
//			            	errorMsgs.add("信用卡號碼請填入四位數字");
//			            }
//						if(!donate_src_cre_last.trim().matches(donate_src_cre_last_Reg)) { //以下練習正則(規)表示式(regular-expression)
//							errorMsgs.add("信用卡驗證碼請填入三位數字");
//						}
	        		
	        		String donate_name = req.getParameter("donate_name");
	        		String donate_phone = req.getParameter("donate_phone");
	        		String donate_mail = req.getParameter("donate_mail");
	        		System.out.println("donate_name"+donate_name);
	        		System.out.println("donate_phone"+donate_phone);
	        		System.out.println("donate_mail"+donate_mail);
	        		
	        		
	        		DonateVO donateVO = new DonateVO();
	        		donateVO.setDonate_amount(donate_amount_int);
//					donateVO.setDonate_private(donate_private_status);
	        		donateVO.setDonate_src(donate_src);
	        		donateVO.setDonate_src_cre(donate_src_cre);
	        		donateVO.setDonate_name(donate_name);
	        		donateVO.setDonate_phone(donate_phone);
	        		donateVO.setDonate_mail(donate_mail);
	        		
	        		MemVO memVO = (MemVO) session.getAttribute("memVO");
	        		MemService memSvc = new MemService();
	        		
	        		if (memVO!=null)
	        			donateVO.setMemb_id(memVO.getMemb_id());
	        		
	        		// Send the use back to the form, if there were errors
	        		if (!errorMsgs.isEmpty()) {
	        			req.setAttribute("donateVO", donateVO); // 含有輸入格式錯誤的donateVO物件,也存入req
	        			RequestDispatcher failureView = req
	        					.getRequestDispatcher("front-end/donate/addMoneyDon.jsp");
	        			failureView.forward(req, res);
	        			return;
	        		}
	        		
	        		/***************************2.開始新增資料***************************************/
	        		DonateService donSvc = new DonateService();
	        		donSvc.addDonate(donateVO);
	        		
	        		
	        		/***************************3.新增完成,準備轉交(Send the Success view)***********/
//					String url = "/donate/addMoneyDon.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDonate.jsp
//					successView.forward(req, res);			
	        		
	        		out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
	        		System.out.println("!!!!!!!!!!!");
	        		
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
	        	
//	        	try {
	        		/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
	        		String bank_id = req.getParameter("bank_id");
	        		
	        		String donate_amount = req.getParameter("donate_amount");
	        		//donate_amount錯誤驗證
//	        		String donate_amount_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
//	        		System.out.println(donate_amount);
//	        		if (donate_amount == null || donate_amount.trim().length() == 0) {
//	        			//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
//	        			errorMsgs.add("捐贈金額請勿空白");
//	        		} else if(donate_amount.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
//	        			errorMsgs.add("捐贈金額請勿為零");
//	        		} else if(!donate_amount.trim().matches(donate_amount_Reg)) { //以下練習正則(規)表示式(regular-expression)
//	        			errorMsgs.add("捐贈金額只能是數字, 且必須大於零");
//	        		}
	        		
	        		Integer donate_amount_int = null;
					try {
						donate_amount_int = new Integer(donate_amount);
					} catch (NumberFormatException e) {
//						donate_amount = 0;
						System.out.println("$$$$$$$$$$");
					}
					System.out.println("donate_amount_int"+donate_amount_int);
	        		
//	        		String donate_private_status;
//	        		String donate_private = req.getParameter("donate_private");
//	        		if (donate_private.equals("true")) {
//	        			donate_private_status = "匿名";
//	        		} else {
//	        			donate_private_status = "不匿名";
//	        		}
	        		
	        		String donate_src = req.getParameter("donate_src");
	        		String donate_src_trn = req.getParameter("donate_src_trn");
	        		
	        		String donate_name = req.getParameter("donate_name");
	        		String donate_phone = req.getParameter("donate_phone");
	        		String donate_mail = req.getParameter("donate_mail");
	        		String donate_date = req.getParameter("donate_date");
	        		
	        		
//	        		if (bank_id == null || bank_id.equals(0)) {
//	        			//donate_id其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上donate_id == null
//	        			errorMsgs.add("請選擇銀行代碼");
//	        		}
//	        			
//	        		if (donate_src_trn == null || donate_src_trn.trim().length() == 0) {
//	        			errorMsgs.add("請輸入轉帳帳號後四碼");						
//	        		} 
//	        			
//	        		if(donate_date == null || donate_date.trim().length() == 0) {
//	        			errorMsgs.add("請輸入轉帳日期");
//	        		}
	        		
	        		SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	        		Date time;
	        		Timestamp date=null;
					try {
						time = df.parse(donate_date);
						date = new java.sql.Timestamp(time.getTime());
						System.out.println("date="+date);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	        		
	        		DonateVO donateVO = new DonateVO();
	        		donateVO.setBank_id(bank_id);
	        		donateVO.setDonate_amount(donate_amount_int);
	        		donateVO.setDonate_date(date);
//	        		donateVO.setDonate_private(donate_private_status);
	        		donateVO.setDonate_src(donate_src);
	        		donateVO.setDonate_src_trn(donate_src_trn);
	        		donateVO.setDonate_name(donate_name);
	        		donateVO.setDonate_phone(donate_phone);
	        		donateVO.setDonate_mail(donate_mail);
	        		
	        		MemVO memVO = (MemVO) session.getAttribute("memVO");
					MemService memSvc = new MemService();
					
					if (memVO!=null)
						donateVO.setMemb_id(memVO.getMemb_id());

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("donateVO", donateVO); // 含有輸入格式錯誤的donateVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("front-end/donate/addMoneyDon.jsp");
						failureView.forward(req, res);
						return;
					}
	        		
	        		/***************************2.開始新增資料***************************************/
					DonateService donSvc = new DonateService();
					donSvc.addDonate(donateVO);
					
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
//					String url = "/donate/addMoneyDon.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDonate.jsp
//					successView.forward(req, res);			
					
					out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
					System.out.println("!!!!!!!!!!!");
	        		
	        		/***************************其他可能的錯誤處理**********************************/
//	        	} catch (Exception e) {
//	        		errorMsgs.add(e.getMessage());
//	        		RequestDispatcher failureView = req
//	        				.getRequestDispatcher("/emp/addDonate.jsp");
//	        		failureView.forward(req, res);
//	        	}
	        }
	        
			
	        
		}
	}

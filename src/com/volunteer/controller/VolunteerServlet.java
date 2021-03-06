package com.volunteer.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.rescue.model.RescueVO;
import com.volunteer.model.*;

import util.MailService;
@MultipartConfig
public class VolunteerServlet extends HttpServlet{


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
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
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String vlt_id = req.getParameter("vlt_id");
				
				/***************************2.開始查詢資料****************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				VolunteerVO volunteerVO = volunteerSvc.getOneVolunteer(vlt_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("volunteerVO", volunteerVO);         // 資料庫取出的empVO物件,存入req
				String url = "/back-end/volunteer/update_volunteer_byManager.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/listAllVolunteer.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("updatebymanager".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String vlt_id = req.getParameter("vlt_id").trim();
				
				String vlt_name = req.getParameter("vlt_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (vlt_name == null || vlt_name.trim().length() == 0) {
					errorMsgs.add("志工姓名: 請勿空白");
				} else if(!vlt_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("志工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String vlt_mail = req.getParameter("vlt_mail");
				String  mailReg = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
				if (vlt_mail == null || vlt_mail.trim().length() == 0) {
					errorMsgs.add("e-mail請勿空白");
				}else if(!vlt_mail.trim().matches(mailReg)) {
					errorMsgs.add("請輸入正確的e-mail");
				}
				
				String vlt_gender = req.getParameter("vlt_gender");
				System.out.print("----"+vlt_gender);
				if(vlt_gender == null|| vlt_gender.trim().length() == 0) {
					errorMsgs.add("請選擇性別");
				}
				
				String vlt_tel = req.getParameter("vlt_tel");
				String  telReg = "^09[0-9]{2}-[0-9]{6}$";
				if (vlt_tel == null || vlt_tel.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				}else if(!vlt_tel.trim().matches(telReg)) {
					errorMsgs.add("請輸入正確的手機號碼");
				}
				
				String vlt_duty_day = req.getParameter("vlt_duty_day").trim();
				String vlt_reg = req.getParameter("reg_id").trim();
				//密碼
			
				//志工狀態
				String vlt_sta = req.getParameter("vlt_sta").trim();
				java.sql.Date vlt_registerdate = java.sql.Date.valueOf(req.getParameter("vlt_registerdate").trim());
				System.out.println(vlt_registerdate);
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(vlt_id);
				volunteerVO.setVlt_name(vlt_name);
				volunteerVO.setVlt_mail(vlt_mail);
				volunteerVO.setVlt_gender(vlt_gender);
				volunteerVO.setVlt_tel(vlt_tel);
				volunteerVO.setVlt_duty_day(vlt_duty_day);
				volunteerVO.setVlt_sta(vlt_sta);
				volunteerVO.setVlt_reg(vlt_reg);
				volunteerVO.setVlt_registerdate(vlt_registerdate);
				
				

				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("volunteerVO", volunteerVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/volunteer/update_volunteer_byManager.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				volunteerSvc.updateForManager(volunteerVO);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("volunteerVO", volunteerVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/volunteer/listAllVolunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/update_volunteer_byManager.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Update_From_Volunteer".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String vlt_id = req.getParameter("vlt_id");
				
				/***************************2.開始查詢資料****************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				VolunteerVO volunteerVO = volunteerSvc.getOneVolunteer(vlt_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("volunteerVO", volunteerVO);         // 資料庫取出的empVO物件,存入req
				req.setAttribute("complete","yes");
				System.out.println("handsome");
				String url = "/front-end/volunteer/volunteer_info.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/volunteer/volunteer_info.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("updatebyvolunteer".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			   
			
			    
				String vlt_id = req.getParameter("vlt_id").trim();
				String vlt_name = req.getParameter("vlt_name");
				String vlt_mail = req.getParameter("vlt_mail");
				String vlt_gender = req.getParameter("vlt_gender");
				java.sql.Date vlt_registerdate = java.sql.Date.valueOf(req.getParameter("vlt_registerdate").trim());
				
				String vlt_reg = req.getParameter("vlt_reg").trim();
				//手機號碼
				String vlt_tel = req.getParameter("vlt_tel");
				String  telReg = "^09[0-9]{2}-[0-9]{6}$";
				if (vlt_tel == null || vlt_tel.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				}else if(!vlt_tel.trim().matches(telReg)) {
					errorMsgs.add("請輸入正確的手機號碼!ex.09XX-XXXXXX");
				}
				//可值勤日
				String vlt_duty_day = req.getParameter("vlt_duty_day").trim();
			
				//密碼
				String vlt_pw = req.getParameter("vlt_pw");
				String pwReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8}$";
				if (vlt_pw == null || vlt_pw.trim().length() == 0) {
					errorMsgs.add("志工密碼: 請勿空白");
				} else if(!vlt_pw.trim().matches(pwReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("志工密碼: 只能是中、英文字母、數字和_ , 且長度必需在2到8之間");
	            }
				//照片
				
				
				byte[] vlt_img = null;
				Part part = req.getPart("upfile");
				InputStream is = part.getInputStream();
				if(is.available()==0) {
					VolunteerService volunteerSvc = new VolunteerService();
					vlt_img = volunteerSvc.getOneVolunteer(vlt_id).getVlt_img();
				}else {
					vlt_img = getPictureByteArray(is);
				}
				System.out.println(vlt_id);
				System.out.println(vlt_name);
				System.out.println(vlt_mail);
				System.out.println(vlt_gender);
				System.out.println(vlt_pw);
				System.out.println(vlt_tel);
				System.out.println(vlt_img);
				System.out.println(vlt_duty_day);
				System.out.println(vlt_reg);
				System.out.println(vlt_registerdate);
				
				
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(vlt_id);
				volunteerVO.setVlt_name(vlt_name);
				volunteerVO.setVlt_mail(vlt_mail);
				volunteerVO.setVlt_gender(vlt_gender);
				volunteerVO.setVlt_pw(vlt_pw);
				volunteerVO.setVlt_tel(vlt_tel);
				volunteerVO.setVlt_img(vlt_img);
				volunteerVO.setVlt_duty_day(vlt_duty_day);
				volunteerVO.setVlt_reg(vlt_reg);
				volunteerVO.setVlt_registerdate(vlt_registerdate);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("volunteerVO", volunteerVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/volunteer/volunteer_info.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				volunteerSvc.updateForVolunteer(volunteerVO);
				VolunteerVO volunteerVO1 = volunteerSvc.getOneVolunteer(vlt_id);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("volunteerVO", volunteerVO1); // 資料庫update成功後,正確的的empVO物件,存入req
				req.setAttribute("complete","yes");
				System.out.println("handsome");
				String url = "/front-end/volunteer/volunteer_info.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/volunteer/volunteer_info.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String vlt_name = req.getParameter("vlt_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (vlt_name == null || vlt_name.trim().length() == 0) {
					errorMsgs.add("志工姓名: 請勿空白");
				} else if(!vlt_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("志工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String vlt_mail = req.getParameter("vlt_mail");
				String  mailReg = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
				if (vlt_mail == null || vlt_mail.trim().length() == 0) {
					errorMsgs.add("e-mail請勿空白");
				}else if(!vlt_mail.trim().matches(mailReg)) {
					errorMsgs.add("請輸入正確的e-mail");
				}
				
				String vlt_gender = req.getParameter("vlt_gender");
				System.out.print("----"+vlt_gender);
				if(vlt_gender == null|| vlt_gender.trim().length() == 0) {
					errorMsgs.add("請選擇性別");
				}
				
				String vlt_tel = req.getParameter("vlt_tel");
				String  telReg = "^09[0-9]{2}-[0-9]{6}$";
				if (vlt_tel == null || vlt_tel.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				}else if(!vlt_tel.trim().matches(telReg)) {
					errorMsgs.add("請輸入正確的手機號碼!ex.09XX-XXXXXX");
				}
				
				String vlt_duty_day = req.getParameter("vlt_duty_day").trim();
				String vlt_reg = req.getParameter("reg_id").trim();
				//亂數密碼
//				StringBuilder sb = new StringBuilder();
//				for(int i=1;i<=8;i++) {
//					int condition = (int)(Math.random()*3)+1;
//					switch(condition) {
//					case 1:
//						char c1 = (char)((int)(Math.random()*26)+65);
//						sb.append(c1);
//						break;
//					case 2:
//						char c2 = (char)((int)(Math.random()*26)+97);
//						sb.append(c2);
//						break;
//					case 3:
//						sb.append((int)(Math.random()*10));
//						break;
//					}
//				}
				String vlt_pw = genAuthCode();
				//新增的志工狀態
				String vlt_sta = "在職志工";
				//新增時還未有圖片
				ServletContext context = getServletContext();
				byte[] vlt_img = getPictureByteArray(context.getResourceAsStream("/back-end/volunteer/images/volunteerdefault1.jpg"));
		        //日期取加入的當下
				java.sql.Date vlt_registerdate = new java.sql.Date(new Date().getTime());
			
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_name(vlt_name);
				volunteerVO.setVlt_mail(vlt_mail);
				volunteerVO.setVlt_pw(vlt_pw);
				volunteerVO.setVlt_gender(vlt_gender);
				volunteerVO.setVlt_tel(vlt_tel);
				volunteerVO.setVlt_img(vlt_img);
				volunteerVO.setVlt_registerdate(vlt_registerdate);
				volunteerVO.setVlt_duty_day(vlt_duty_day);
				volunteerVO.setVlt_sta(vlt_sta);
				volunteerVO.setVlt_reg(vlt_reg);
				
				//寄密碼給志工
				String to = vlt_mail;
			      
//			    String subject = "新密碼通知";
			    String subject = "Password Notification";
			      
			    String ch_name = vlt_name;       

			    String passRandom = vlt_pw;
//			    String messageText = "Hello! " + ch_name + "，歡迎成為新志工，請謹記此密碼: " + passRandom + "\n" +" (已經啟用)";
			    String messageText = "Hello! New volunteer! Your account had been activated. Your password is: " + passRandom + "."; 
			       
			    MailService mailService = new MailService(); 
			    mailService.sendMail(to, subject, messageText);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("volunteerVO", volunteerVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/volunteer/addVolunteer.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				volunteerVO = volunteerSvc.addVolunteer(vlt_name, vlt_mail, vlt_pw, vlt_gender, vlt_tel, vlt_img, vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/volunteer/listAllVolunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/addVolunteer.jsp");
				failureView.forward(req, res);

				
			}
		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String vlt_id = req.getParameter("vlt_id");
				
				/***************************2.開始刪除資料***************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				volunteerSvc.deleteVolunteer(vlt_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/volunteer/listAllVolunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/listAllVolunteer.jsp");
				failureView.forward(req, res);
			}
		}
		 
		
		if("login".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String vlt_mail = req.getParameter("vlt_mail");
				if(vlt_mail == null || vlt_mail.trim().length() == 0) {
					errorMsgs.put("vlt_mail","請輸入正確的帳號");
				}
				String vlt_pw = req.getParameter("vlt_pw");
				if(vlt_pw == null || vlt_pw.trim().length() == 0) {
					errorMsgs.put("vlt_pw","請輸入正確的密碼");
				}
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_mail(vlt_mail);
				volunteerVO.setVlt_pw(vlt_pw);
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("volunteerVO", volunteerVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/volunteer/volunteer_login.jsp");
					failureView.forward(req, res);
					return;
				}
				
				try {
					VolunteerService volunteerSvc = new VolunteerService();
					volunteerVO = volunteerSvc.getVolunteerSelf(vlt_mail);
					if(vlt_pw.equals(volunteerVO.getVlt_pw())) {
						//登入成功
						HttpSession session = req.getSession();
						session.setAttribute("volunteerVO", volunteerVO);
						
						try {                                                        
					         String location3 = (String) session.getAttribute("location3");
					         if (location3 != null) {
					           session.removeAttribute("location3");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					           res.sendRedirect(location3);            
					           return;
					         }
					       }catch (Exception ignored) { 
					    	   
					       }
					      res.sendRedirect(req.getContextPath()+"/front-end/volunteer/volunteer_index.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
						return;
					}else {
						//登入失敗
						errorMsgs.put("vlt_pw","輸入的密碼錯誤");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/volunteer/volunteer_login.jsp");
						failureView.forward(req, res);
					}
					
				}catch(Exception e) {
					if(volunteerVO == null) {
						errorMsgs.put("vlt_mail","查無此帳號");
					}else {
						errorMsgs.put("vlt_mail","資料庫的例外");
					}
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/volunteer/volunteer_login.jsp");
					failureView.forward(req, res);
					
					
				}
			}catch(Exception e) {
				errorMsgs.put("發生其他例外:",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/volunteer/volunteer_login.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.setAttribute("volunteerVO", null);
			session.setAttribute("location3", null);
			res.sendRedirect(req.getContextPath()+"/front-end/volunteer/volunteer_login.jsp");
			return;
		}
		
		if ("listVolunteer_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				if (req.getParameter("whichPage") == null){
					HashMap<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				
				/***************************2.開始複合查詢***************************************/
				VolunteerService volunteerSvc = new VolunteerService();
				List<VolunteerVO> list  = volunteerSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				
				req.setAttribute("listVolunteerOnCall", list);
	
				// 資料庫取出的list物件,存入request
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/rescue/back_delayed_rescue.jsp"); // 成功後,轉交網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		if ("check_out_rescue".equals(action)) {
			/***************************1.取得資料**********************************/ 
			HttpSession session = req.getSession();
			VolunteerVO volunteerVO = (VolunteerVO) session.getAttribute("volunteerVO");
			String vlt_id = volunteerVO.getVlt_id();
			/***************************2.開始查詢***************************************/
			VolunteerService volunteerSvc = new VolunteerService();
			RescueVO rescueVO = volunteerSvc.volunteerCheckOut(vlt_id);
			/***************************3.查詢完成,準備轉交(Send the Success view)************/
			req.setAttribute("rescueVO", rescueVO);
			RequestDispatcher successView = 
					req.getRequestDispatcher("/front-end/volunteer/volunteer_rescue.jsp");
			successView.forward(req, res);
		}
		if ("rescue_done_by_volunteer".equals(action)) {
			System.out.println("bbbiiiggg");
			String rsc_id = req.getParameter("rsc_id");
			String vlt_id = req.getParameter("vlt_id");
			VolunteerService vltSvc = new VolunteerService();
			vltSvc.rescue_done_by_volunteer(rsc_id, vlt_id);
			req.setAttribute("flag", "yes");
			out.print("111");
//			RequestDispatcher successView = 
//					req.getRequestDispatcher("/front-end/volunteer/volunteer_rescue.jsp");
//			successView.forward(req, res);
		}
		
	}
	
	
	public static byte[] getPictureByteArray(InputStream is) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];	//設定每次讀取的大小
		int i;
		while ((i = is.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		is.close();

		return baos.toByteArray();	//將ByteArrayOutputStream轉成ByteArray
	}
	public static String genAuthCode() {
    	int number8_20 = (int)(Math.random()*13+8);
    	char[] pool=new char[62];
    	int count=0,index=0;
    	int [] lucky=new int[number8_20];
    	boolean bool1=false,bool2=false,bool3=false;
    	for(char i=48; i<=57; i++) {
    		pool[count]=i;
    		count++;
    	}
    	for(char j=65; j<=90; j++) {
    		pool[count]=j;
    		count++;
    	}
    	for(char k=97; k<=122; k++) {
    		pool[count]=k;
    		count++;
    	}
    	do {
    		bool1=true;
    		bool2=true;
    		bool3=true;
    		index=0;
    		for (int t=0;t<number8_20;t++) {
    			lucky[index]=(int)(Math.random()*count);
    			index++;
    	    }
    		for (int n=0;n<number8_20;n++) {
    			if(0<=lucky[n]&&lucky[n]<=9) {
    				bool1=false;
    			}
    			if(10<=lucky[n]&&lucky[n]<=35) {
    				bool2=false;
    			}
    			if(36<=lucky[n]&&lucky[n]<=61) {
    				bool3=false;
    			}
    		}
    	} while(bool1||bool2||bool3);
    	StringBuffer sb = new StringBuffer();
    	for (int m=0;m<number8_20;m++) {
    		sb = sb.append(pool[lucky[m]]);
    	}
    	return sb.toString();
    	
    }

}

package com.volunteer.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.volunteer.model.*;
@MultipartConfig
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
				String vlt_pw = req.getParameter("vlt_pw");
				String pwReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,8}$";
				if (vlt_pw == null || vlt_pw.trim().length() == 0) {
					errorMsgs.add("志工密碼: 請勿空白");
				} else if(!vlt_pw.trim().matches(pwReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("志工密碼: 只能是中、英文字母、數字和_ , 且長度必需在2到8之間");
	            }
				
				//志工狀態
				String vlt_sta = req.getParameter("vlt_sta").trim();
				
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(vlt_id);
				volunteerVO.setVlt_name(vlt_name);
				volunteerVO.setVlt_mail(vlt_mail);
				volunteerVO.setVlt_pw(vlt_pw);
				volunteerVO.setVlt_gender(vlt_gender);
				volunteerVO.setVlt_tel(vlt_tel);
				volunteerVO.setVlt_duty_day(vlt_duty_day);
				volunteerVO.setVlt_sta(vlt_sta);
				volunteerVO.setVlt_reg(vlt_reg);
				

				
				

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
				volunteerVO = volunteerSvc.updateForManager(vlt_id,vlt_name, vlt_mail, vlt_pw, vlt_gender, vlt_tel,vlt_duty_day,vlt_sta,vlt_reg);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("volunteerVO", volunteerVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/volunteer/listOneVolunteer.jsp";
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
				String url = "/back-end/volunteer/update_volunteer_byVolunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/index_Volunteer.jsp");
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
				
				
				//手機號碼
				String vlt_tel = req.getParameter("vlt_tel");
				String  telReg = "^09[0-9]{2}-[0-9]{6}$";
				if (vlt_tel == null || vlt_tel.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				}else if(!vlt_tel.trim().matches(telReg)) {
					errorMsgs.add("請輸入正確的手機號碼");
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
				Part part = req.getPart("upfile");
				byte[] vlt_img = null;
				if(part == null) {
					VolunteerService volunteerSvc = new VolunteerService();
					 vlt_img = volunteerSvc.getOneVolunteer(vlt_id).getVlt_img();
				}else {
					InputStream is = part.getInputStream();
					 vlt_img = getPictureByteArray(is);
				}
				
				
				VolunteerVO volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(vlt_id);
				volunteerVO.setVlt_pw(vlt_pw);
				volunteerVO.setVlt_tel(vlt_tel);
				volunteerVO.setVlt_img(vlt_img);
				volunteerVO.setVlt_duty_day(vlt_duty_day);



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
				volunteerVO = volunteerSvc.updateForVolunteer(vlt_id, vlt_pw, vlt_tel,vlt_img,vlt_duty_day);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("volunteerVO", volunteerVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/volunteer/index_Volunteer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/volunteer/update_volunteer_byVolunteer.jsp");
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
					errorMsgs.add("請輸入正確的手機號碼");
				}
				
				String vlt_duty_day = req.getParameter("vlt_duty_day").trim();
				String vlt_reg = req.getParameter("reg_id").trim();
				//亂數密碼
				StringBuilder sb = new StringBuilder();
				for(int i=1;i<=8;i++) {
					int condition = (int)(Math.random()*3)+1;
					switch(condition) {
					case 1:
						char c1 = (char)((int)(Math.random()*26)+65);
						sb.append(c1);
						break;
					case 2:
						char c2 = (char)((int)(Math.random()*26)+97);
						sb.append(c2);
						break;
					case 3:
						sb.append((int)(Math.random()*10));
						break;
					}
				}
				String vlt_pw = sb.toString();
				//新增的志工狀態
				String vlt_sta = "在職志工";
				//新增時還未有圖片
				ServletContext context = getServletContext();
				byte[] vlt_img = getPictureByteArray(context.getResourceAsStream("/back-end/volunteer/images/volunteerdefault.jpg"));
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
	

}

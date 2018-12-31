package com.mem.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mem.model.MemService;
import com.mem.model.MemVO;

@MultipartConfig
public class MemServlet extends HttpServlet {
	
	private static final long serialVersionUID = 3510764506563638117L;
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
		}	//媽媽ger是什麼職業呢?
		if("mamager_update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memb_id = req.getParameter("memb_id");
				
				String memb_sta= req.getParameter("memb_sta");
				Integer memb_vio_times=null;
				try {
					memb_vio_times=new Integer(req.getParameter("memb_vio_times"));
				}catch(Exception e) {
					memb_vio_times=0;
					errorMsgs.add("會員違規次數請填正整數");
				}
				
				MemVO memVO = new MemVO();
				memVO.setMemb_id(memb_id);
				memVO.setMemb_sta(memb_sta);
				memVO.setMemb_vio_times(memb_vio_times);
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/back-end/members/manager_update.jsp");
					failureView.forward(req, res);
					return;
				}
				
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
//		if("updateFromClient".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			try {
//				
//				/***************************1.接收請求參數****************************************/
//				String memb_acc = req.getParameter("memb_acc");
//				if(memb_acc == null || memb_acc.trim().length() == 0) {
//					errorMsgs.add("請輸入會員帳號");
//				}
//				
//				
//				/***************************2.開始查詢資料****************************************/
//				MemService memSvc = new MemService();
//				MemVO memVO = memSvc.getMemSelf(memb_acc);
//				if(memVO == null) {
//					errorMsgs.add("查無此帳號");
//				}
//				if(!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = 
//					req.getRequestDispatcher("/front-end/members/addMembers.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("memVO", memVO);         // 資料庫取出的empVO物件,存入req
//				String url = "/front-end/members/client_update.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 client_update.jsp
//				successView.forward(req, res);
//			}catch(Exception e) {
//				errorMsgs.add("有Exception");
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/members/addMembers.jsp");
//				failureView.forward(req, res);
//			}
//		}
		if("client_update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String memb_id = req.getParameter("memb_id");
				String memb_acc = req.getParameter("memb_acc");
				String memb_psw = req.getParameter("memb_psw");
				if(memb_psw == null || memb_psw.trim().length() == 0) {
					errorMsgs.add("密碼不得為空");
				}
				String memb_name = req.getParameter("memb_name");
				if(memb_name == null || memb_name.trim().length() == 0) {
					errorMsgs.add("姓名不得為空");
				}
				String memb_nick = req.getParameter("memb_nick");
				if(memb_nick == null || memb_nick.trim().length() == 0) {
					errorMsgs.add("暱稱不得為空");
				}
				String memb_email = req.getParameter("memb_email");
				if(memb_email == null || memb_email.trim().length() == 0) {
					errorMsgs.add("信箱不得為空");
				}
				String memb_cellphone = req.getParameter("memb_cellphone");
				String memb_gender = req.getParameter("memb_gender");
				String memb_cre_type = req.getParameter("memb_cre_type");
				String memb_cre_name = req.getParameter("memb_cre_name");
				String memb_cre_year = req.getParameter("memb_cre_year");
				String memb_cre_month = req.getParameter("memb_cre_month");
				Part part = req.getPart("upfile");
				InputStream is = part.getInputStream();
				
				byte[] memb_photo =null;
				if(is.available() == 0) {
					MemService memSvc = new MemService();
					memb_photo = memSvc.getMemSelf(memb_acc).getMemb_photo();
				}else {
					memb_photo = transbyte(is);
				}
				
				
				
				MemVO memVO = new MemVO();
				memVO.setMemb_id(memb_id);
				memVO.setMemb_acc(memb_acc);
				memVO.setMemb_psw(memb_psw);
				memVO.setMemb_name(memb_name);
				memVO.setMemb_nick(memb_nick);
				memVO.setMemb_email(memb_email);
				memVO.setMemb_cellphone(memb_cellphone);
				memVO.setMemb_gender(memb_gender);
				memVO.setMemb_cre_type(memb_cre_type);
				memVO.setMemb_cre_name(memb_cre_name);
				memVO.setMemb_cre_year(memb_cre_year);
				memVO.setMemb_cre_month(memb_cre_month);
				memVO.setMemb_photo(memb_photo);

				if(!errorMsgs.isEmpty()) {
					session.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/members/client_update.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始修改資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc
						.clientUpdateMem(memb_id,memb_acc, memb_psw, memb_name, memb_nick, memb_email, 
								memb_cellphone, memb_gender, memb_cre_type, memb_cre_name, 
								memb_cre_year, memb_cre_month, memb_photo);
				memVO= memSvc.getMemSelf(memb_acc);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				session.setAttribute("memVO", memVO);
				String url = "/front-end/members/after_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			}catch(Exception e) {
				errorMsgs.add("無法修改資料:" + e.getMessage());
				e.printStackTrace();
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
				if(memb_acc == null || memb_acc.trim().length() == 0) {
					errorMsgs.add("帳號不得為空");
				}
				String memb_psw = req.getParameter("memb_psw");
				if(memb_psw == null || memb_psw.trim().length() == 0) {
					errorMsgs.add("密碼不得為空");
				}
				String memb_name = req.getParameter("memb_name");
				if(memb_name == null || memb_name.trim().length() == 0) {
					errorMsgs.add("姓名不得為空");
				}
				String memb_nick = req.getParameter("memb_nick");
				if(memb_nick == null || memb_nick.trim().length() == 0) {
					errorMsgs.add("暱稱不得為空");
				}
				String memb_email = req.getParameter("memb_email");
				if(memb_email == null || memb_email.trim().length() == 0) {
					errorMsgs.add("信箱不得為空");
				}
				String memb_cellphone = req.getParameter("memb_cellphone");
				String memb_gender = req.getParameter("memb_gender");
				String memb_cre_type = req.getParameter("memb_cre_type");
				String memb_cre_name = req.getParameter("memb_cre_name");
				String memb_cre_year = req.getParameter("memb_cre_year");
				String memb_cre_month = req.getParameter("memb_cre_month");
				Part part = req.getPart("upfile");
				InputStream is = part.getInputStream();
				byte[] memb_photo = transbyte(is);
				String memb_fb_login="";
				String memb_google_login="";
				MemVO memVO = new MemVO();
				memVO.setMemb_acc(memb_acc);
				memVO.setMemb_psw(memb_psw);
				memVO.setMemb_name(memb_name);
				memVO.setMemb_nick(memb_nick);
				memVO.setMemb_email(memb_email);
				memVO.setMemb_cellphone(memb_cellphone);
				memVO.setMemb_gender(memb_gender);
				memVO.setMemb_cre_type(memb_cre_type);
				memVO.setMemb_cre_name(memb_cre_name);
				memVO.setMemb_cre_year(memb_cre_year);
				memVO.setMemb_cre_month(memb_cre_month);
				memVO.setMemb_photo(memb_photo);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/members/addMembers.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.addMem(memb_acc, memb_psw, memb_name, memb_nick, 
						memb_email, memb_cellphone, memb_gender, 
						memb_cre_type, memb_cre_name, memb_cre_year, memb_cre_month, 
						memb_photo, memb_fb_login, memb_google_login);
				memVO= memSvc.getMemSelf(memb_acc);
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
		if("login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String memb_acc = req.getParameter("memb_acc");
				if(memb_acc == null || memb_acc.trim().length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				String memb_psw = req.getParameter("memb_psw");
				if(memb_psw == null || memb_psw.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				MemVO memVO = new MemVO();
				memVO.setMemb_acc(memb_acc);
				memVO.setMemb_psw(memb_psw);
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/members/login.jsp");
					failureView.forward(req, res);
					return;
				}
				
				try {
					MemService memSvc = new MemService();
					memVO = memSvc.getMemSelf(memb_acc);
					if(memb_psw.equals(memVO.getMemb_psw())) {
						//登入成功
						HttpSession session = req.getSession();
						session.setAttribute("memVO", memVO);
						
						try {                                                        
					         String location = (String) session.getAttribute("location");
					         if (location != null) {
					           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					           res.sendRedirect(location);            
					           return;
					         }
					       }catch (Exception ignored) { 
					    	   
					       }
					      res.sendRedirect(req.getContextPath()+"/front-end/members/index.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
						return;
					}else {
						//登入失敗
						errorMsgs.add("輸入的密碼錯誤");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/members/login.jsp");
						failureView.forward(req, res);
					}
					
				}catch(Exception e) {
					if(memVO == null) {
						errorMsgs.add("查無此帳號");
					}else {
						errorMsgs.add("資料庫的例外");
					}
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/members/login.jsp");
					failureView.forward(req, res);
					
					
				}
			}catch(Exception e) {
				errorMsgs.add("發生其他例外:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/members/login.jsp");
				failureView.forward(req, res);
			}
		}
		if("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.setAttribute("memVO", null);
			res.sendRedirect(req.getContextPath()+"/front-end/members/index.jsp");
			return;
		}
	}
	public static final byte[] transbyte(InputStream inStream) throws IOException {
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[100];
		int rc = 0;
		while ((rc = inStream.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		byte[] in2b = swapStream.toByteArray();
		return in2b;
	}
}

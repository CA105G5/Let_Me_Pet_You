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

import util.MailService;

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
				
				errorMsgs.add("帳號有人使用");
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
				
				HttpSession session = req.getSession();
				
				System.out.println("location=" + (String) session.getAttribute("location"));
				
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
						session.setAttribute("memVO", memVO);
						
						try {                                                        
					         String location1 = (String) session.getAttribute("location1");
					         String adopt = (String) session.getAttribute("adopt");
					         if (location1 != null) {
					           session.removeAttribute("location1");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					           if ("/CA105G5/front-end/ord/cart_Receiver.jsp".equals(location1)) {
					        	   res.sendRedirect("/CA105G5_Jen/prodcart.do?action=check_Cart");
					        	   return;
					           }
					           res.sendRedirect(location1);            
					           return;
					         }
					         if (adopt != null) {
					        	 session.removeAttribute("adopt");   //*工作3: 看看周伯 (-->如有來源網頁:則重導至來源網頁)
					        		 res.sendRedirect(adopt);
					        		 return;
					        	
					         }
					       }catch (Exception ignored) { 
					    	   
					       }
					      res.sendRedirect(req.getContextPath()+"/index.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
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
			session.setAttribute("location1", null);
			res.sendRedirect(req.getContextPath()+"/index.jsp");
			return;
		}
		if("forget_psw".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String memb_acc = req.getParameter("memb_acc");
				if(memb_acc == null || memb_acc.trim().length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				String memb_email = req.getParameter("memb_email");
				if(memb_email == null || memb_email.trim().length() == 0) {
					errorMsgs.add("請輸入信箱");
				}
				MemVO memVO = new MemVO();
				memVO.setMemb_acc(memb_acc);
				memVO.setMemb_email(memb_email);
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/members/forget_psw.jsp");
					failureView.forward(req, res);
					return;
				}
				
				try {
					MemService memSvc = new MemService();
					memVO = memSvc.getMemSelf(memb_acc);
					if(memb_email.equals(memVO.getMemb_email())) {
						//帳號信箱驗證成功
						
						//設定新密碼
						String new_psw = genAuthCode();
						memVO.setMemb_psw(new_psw);
						
						//存入資料庫
						memVO=memSvc.updateMem(memVO);
						
						//將新密碼用電子郵件寄給使用者
						String to = memb_email;
					      
					    String subject = "新密碼通知";
					      
					    String ch_name = memVO.getMemb_name();      

					    String passRandom = new_psw;
					    String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用)";
					    MailService mailService = new MailService();
					    mailService.sendMail(to, subject, messageText);
					   
					    req.setAttribute("mail", "yes");
					    
						RequestDispatcher successView = req
								.getRequestDispatcher("/front-end/members/forget_psw.jsp");
						successView.forward(req, res);
					}else {
						//帳號信箱驗證失敗
						errorMsgs.add("輸入的信箱錯誤");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/members/forget_psw.jsp");
						failureView.forward(req, res);
					}
					
				}catch(Exception e) {
					if(memVO == null) {
						errorMsgs.add("查無此帳號");
					}else {
						errorMsgs.add("資料庫的例外");
					}
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/members/forget_psw.jsp");
					failureView.forward(req, res);
					
					 
				}
			}catch(Exception e) {
				errorMsgs.add("發生其他例外:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/members/forget_psw.jsp");
				failureView.forward(req, res);
			}
			
			
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

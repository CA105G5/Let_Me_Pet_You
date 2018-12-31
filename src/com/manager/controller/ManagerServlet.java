package com.manager.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.manager.model.ManagerService;
import com.manager.model.ManagerVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;

public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 6651550554506602544L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String ma_acc = req.getParameter("ma_acc");
				if(ma_acc == null || ma_acc.trim().length() == 0) {
					errorMsgs.add("請輸入帳號");
				}
				String ma_psw = req.getParameter("ma_psw");
				if(ma_psw == null || ma_psw.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				ManagerVO managerVO = new ManagerVO();
				managerVO.setMa_acc(ma_acc);
				managerVO.setMa_psw(ma_psw);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("managerVO", managerVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/back-end/manager/login.jsp");
					failureView.forward(req, res);
					return;
				}
				
				try {
					ManagerService managerSvc = new ManagerService();
					managerVO = managerSvc.getManagerSelf(ma_acc);
					if(ma_psw.equals(managerVO.getMa_psw())) {
						//登入成功
						HttpSession session = req.getSession();
						session.setAttribute("managerVO", managerVO);
						
						try {                                                        
					         String location = (String) session.getAttribute("location");
					         if (location != null) {
					           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					           res.sendRedirect(location);            
					           return;
					         }
					       }catch (Exception ignored) { 
					    	   
					       }
					      res.sendRedirect(req.getContextPath()+"/back-end/manager/back_end_index.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
						return;
					}else {
						//登入失敗
						errorMsgs.add("輸入的密碼錯誤");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back-end/manager/login.jsp");
						failureView.forward(req, res);
					}
					
				}catch(Exception e) {
					if(managerVO == null) {
						errorMsgs.add("查無此帳號");
					}else {
						errorMsgs.add("資料庫的例外");
					}
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/manager/login.jsp");
					failureView.forward(req, res);
					
					
				}
			}catch(Exception e) {
				errorMsgs.add("發生其他例外:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/manager/login.jsp");
				failureView.forward(req, res);
			}
		}
		if("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.setAttribute("managerVO", null);
			res.sendRedirect(req.getContextPath()+"/back-end/manager/login.jsp");
			return;
		}
	}
}

package com.rescue.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import com.rescue.model.*;


@MultipartConfig
public class RescueServlet extends HttpServlet{
	
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
				String str = req.getParameter("rsc_id");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入員工編號");
//				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isDonatety()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
//				Integer empno = null;
//				try {
//					empno = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("員工編號格式不正確");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isDonatety()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				/***************************2.開始查詢資料*****************************************/
				RescueService rscSvc = new RescueService();
				RescueVO rescueVO = rscSvc.getOneRescue(str);
				if (rescueVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/rescue/listAllRescue.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("rescueVO", rescueVO); // 資料庫取出的donateVO物件,存入req
				String url = "/front-end/rescue/listOneRescue.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneDonate.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/rescue/listAllRescue.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOneRescue_For_Display".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String rsc_id = req.getParameter("rsc_id");
				
				/***************************2.開始查詢資料*****************************************/
				RescueService rescueSvc = new RescueService();
				RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("rescueVO", rescueVO); // 資料庫取出的prodVO物件,存入req
				String url = "/front-end/rescue/listOneRescue.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/rescue/listAllRescue.jsp");
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
					//名稱
					String rsc_name = req.getParameter("rsc_name");
					String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
					if (rsc_name == null || rsc_name.trim().length() == 0) {
						errorMsgs.add("案例名稱: 請勿空白");
					} else if(!rsc_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("案例名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
		            }
					//地區
					String rsc_reg = req.getParameter("reg_id").trim();
					//地點(利用map取到經緯度)
					String rsc_add = req.getParameter("rsc_add");
					if (rsc_add == null || rsc_add.trim().length() == 0) {
						errorMsgs.add("地點請勿空白");
//					}else if(!rsc_add.trim().matches(mailReg)) {
//						errorMsgs.add("請輸入正確的地址");
					}

					
					//圖片
						byte[] rsc_img = null;
						Part part = req.getPart("rsc_img");
						InputStream is = part.getInputStream();
						if(is.available()==0) {
							errorMsgs.add("請選擇照片");
						}else {
							rsc_img = getPictureByteArray(is);
						}
			        //日期取加入的當下
					java.sql.Timestamp rsc_btime = new Timestamp(new Date().getTime());
				    //發起者
					String rsc_sponsor = req.getParameter("rsc_sponsor");
					System.out.println(rsc_sponsor);
					//描述
					String rsc_des = req.getParameter("rsc_des");
					if (rsc_des == null || rsc_des.trim().length() == 0) {
						errorMsgs.add("描述請勿空白");
					}
					
					System.out.println("000");
					       RescueVO rescueVO = new RescueVO();
					
							rescueVO.setRsc_name(rsc_name);
							rescueVO.setRsc_add(rsc_add);
							rescueVO.setRsc_sponsor(rsc_sponsor);
							rescueVO.setRsc_lat(new Double(24.9460628));
							rescueVO.setRsc_lon(new Double(121.1992745));
							rescueVO.setRsc_btime(rsc_btime);
							rescueVO.setRsc_coin(new Integer(500));
							rescueVO.setRsc_reg(rsc_reg);
							rescueVO.setRsc_img(rsc_img);
							rescueVO.setRsc_des(rsc_des);
							rescueVO.setRsc_sta("待救援");

					

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("rescueVO", rescueVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/rescue/addRescue.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					RescueService rescueSvc = new RescueService();
					rescueSvc.addRescue(rescueVO);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					List<RescueVO> list = rescueSvc.getAll();
					HttpSession session = req.getSession();
					session.setAttribute("listAllRescue_ByCompositeQuery", list);
					String url = "/front-end/rescue/listAllRescue.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/rescue/addRescue.jsp");
					failureView.forward(req, res);	
				}
			}
			
			
			if ("listRescue_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

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
					RescueService rescueSvc = new RescueService();
					List<RescueVO> list  = rescueSvc.getAll(map);
					
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("listRescue_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
					RequestDispatcher successView = req.getRequestDispatcher("back-end/rescue/listRescue_ByCompositeQuery.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/rescue/listAllRescue.jsp");
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

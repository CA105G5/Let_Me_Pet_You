package com.prod.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.prodimg.model.ProdImgService;
import com.prodimg.model.ProdImgVO;

public class ProdServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String prod_id = req.getParameter("prod_id");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入產品編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				String prod_id = null;
//				try {
//					prod_id = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("員工編號格式不正確");
//				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				/***************************2.開始查詢資料*****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				
				ProdImgService prodImgSvc = new ProdImgService();
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
				
				
//				if (prodVO == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // 資料庫取出的prodVO物件,存入req
				req.setAttribute("prodImgList", prodImgList);
				String url = "/front-end/product/listOneProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getAll_For_Display".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入產品編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				String prod_id = null;
//				try {
//					prod_id = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("員工編號格式不正確");
//				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				/***************************2.開始查詢資料*****************************************/
				ProdService prodSvc = new ProdService(); //用介面ProdService來宣告，降低與DAO的相依性
				List<ProdVO> list = prodSvc.getAll();
				if (req.getParameter("type")!=null) {
					Integer type = new Integer(req.getParameter("type"));
					System.out.println(type);
					Iterator<ProdVO> iter = list.iterator();
					switch(type){
						case 1:
					        while (iter.hasNext()) {
					        	ProdVO prodVO = iter.next();
					        	if(! "貓".equals(prodVO.getProd_ani_type_id())) {
					        		System.out.println(prodVO.getProd_ani_type_id());
					        		System.out.println(prodVO.getProd_id());
					                iter.remove();
					            }
					        }
							break;
						case 2:
					        while (iter.hasNext()) {
					        	ProdVO prodVO = iter.next();
					        	if(! "狗".equals(prodVO.getProd_ani_type_id())) {
					                iter.remove();
					            }
					        }
							break;
						case 3:
							while (iter.hasNext()) {
								ProdVO prodVO = iter.next();
								if(! "飛禽".equals(prodVO.getProd_ani_type_id())) {
									iter.remove();
								}
							}
							break;
						case 4:
							while (iter.hasNext()) {
								ProdVO prodVO = iter.next();
								if(! "兔".equals(prodVO.getProd_ani_type_id())) {
									iter.remove();
								}
							}
							break;
						case 5:
							while (iter.hasNext()) {
								ProdVO prodVO = iter.next();
								if(! "其他".equals(prodVO.getProd_ani_type_id())) {
									iter.remove();
								}
							}
							break;
					}
				}
//				if (prodVO == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/prod/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("list", list); // 資料庫取出的prodVO物件,存入req
				String url = "/front-end/product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("prodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
				String url = "/prod/update_prod_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("prodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
				String url = "/prod/update_prod_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_prod_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				String prod_id = req.getParameter("prod_id");
				String memb_id = req.getParameter("memb_id");
				String prod_type_id = req.getParameter("prod_type_id");
				String prod_ani_type_id = req.getParameter("prod_ani_type_id");
				String prod_name = req.getParameter("prod_name");
				String prod_des = req.getParameter("prod_des");
				String prod_info = req.getParameter("prod_info");
				String prod_review = req.getParameter("prod_review");
				String prod_review_des = req.getParameter("prod_review_des");
				String prod_status = req.getParameter("prod_status");
				Integer prod_stock = new Integer(req.getParameter("prod_stock"));
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Timestamp prod_date = new java.sql.Timestamp(df.parse(req.getParameter("prod_date")).getTime()); 
				
				Integer prod_qty = null;
				try {
					prod_qty = new Integer(req.getParameter("prod_qty").trim());
				} catch (NumberFormatException e) {
					prod_qty = 0;
					errorMsgs.add("數量請填數字");
				}
				if(prod_qty<=0)
					errorMsgs.add("數量請填大於零的數字");
				
				Integer prod_price = null;
				try {
					prod_price = new Integer(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0;
					errorMsgs.add("價格請填數字");
				}
				if(prod_price<=0)
					errorMsgs.add("價格請填大於零的數字");

				ProdVO prodVO = new ProdVO();
				prodVO.setProd_id(prod_id);
				prodVO.setMemb_id(memb_id);
				prodVO.setProd_type_id(prod_type_id);
				prodVO.setProd_ani_type_id(prod_ani_type_id);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_des(prod_des);
				prodVO.setProd_info(prod_info);
				prodVO.setProd_qty(prod_qty);
				prodVO.setProd_stock(prod_stock);
				prodVO.setProd_date(prod_date);
				prodVO.setProd_review(prod_review);
				prodVO.setProd_review_des(prod_review_des);
				prodVO.setProd_status(prod_status);
				prodVO.setProd_price(prod_price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/prod/update_prod_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.updateProd(prod_id, memb_id, prod_type_id, prod_ani_type_id, prod_name, prod_des, prod_info, prod_qty, prod_stock, prod_date, prod_review, prod_review_des, prod_status, prod_price);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // 資料庫update成功後,正確的的prodVO物件,存入req
				String url = "/prod/listOneProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/update_prod_input.jsp");
				failureView.forward(req, res);
//				注意若發生NullPointerException(Runtime Exception)會直接跳到catch這邊，
//				因為沒有做到req.setAttribute("prodVO", prodVO); 就跳轉到update_prod_input.jsp，
//				所以錯誤訊息是會顯示jsp轉成的java程式碼，在很深的路徑裡面(桌面捷徑)，所以會不好除錯
//				這時要將try catch拿掉，讓他直接500較好除錯
			}
		}

        if ("insert".equals(action)) { // 來自addProd.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String prod_id = req.getParameter("prod_id");
				String memb_id = req.getParameter("memb_id");
				String prod_type_id = req.getParameter("prod_type_id");
				String prod_ani_type_id = req.getParameter("prod_ani_type_id");
				String prod_name = req.getParameter("prod_name");
				String prod_des = req.getParameter("prod_des");
				String prod_info = req.getParameter("prod_info");
				String prod_review = req.getParameter("prod_review");
				String prod_review_des = req.getParameter("prod_review_des");
				String prod_status = req.getParameter("prod_status");
				Integer prod_stock = new Integer(req.getParameter("prod_stock"));
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Timestamp prod_date = new java.sql.Timestamp(df.parse(req.getParameter("prod_date")).getTime()); 
				
				Integer prod_qty = null;
				try {
					prod_qty = new Integer(req.getParameter("prod_qty").trim());
				} catch (NumberFormatException e) {
					prod_qty = 0;
					errorMsgs.add("數量請填數字");
				}
				if(prod_qty<=0)
					errorMsgs.add("數量請填大於零的數字");
				
				Integer prod_price = null;
				try {
					prod_price = new Integer(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0;
					errorMsgs.add("價格請填數字");
				}
				if(prod_price<=0)
					errorMsgs.add("價格請填大於零的數字");

				ProdVO prodVO = new ProdVO();
				prodVO.setProd_id(prod_id);
				prodVO.setMemb_id(memb_id);
				prodVO.setProd_type_id(prod_type_id);
				prodVO.setProd_ani_type_id(prod_ani_type_id);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_des(prod_des);
				prodVO.setProd_info(prod_info);
				prodVO.setProd_qty(prod_qty);
				prodVO.setProd_stock(prod_stock);
				prodVO.setProd_date(prod_date);
				prodVO.setProd_review(prod_review);
				prodVO.setProd_review_des(prod_review_des);
				prodVO.setProd_status(prod_status);
				prodVO.setProd_price(prod_price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/prod/addProd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.addProd(memb_id, prod_type_id, prod_ani_type_id, prod_name, prod_des, prod_info, prod_qty, prod_stock, prod_date, prod_review, prod_review_des, prod_status, prod_price);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/prod/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/prod/addProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllProd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始刪除資料***************************************/
				ProdService prodSvc = new ProdService();
				prodSvc.deleteProd(prod_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/front-end/product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
	}
}

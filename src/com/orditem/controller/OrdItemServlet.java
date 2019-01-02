package com.orditem.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.CurrencyDetail.model.CurDtJDBCDAO;
import com.CurrencyDetail.model.CurDtVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.orditem.model.OrdItemService;
import com.orditem.model.OrdItemVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgService;
import com.prodimg.model.ProdImgVO;

public class OrdItemServlet extends HttpServlet {

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
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		//訂單檢舉跳窗
		if ("getOneModal_For_Report".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				
				/***************************2.開始查詢資料*****************************************/

				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				//原本畫面跳轉
//				String url = "/front-end/product/listOneProdModal.jsp";
				
				//Bootstrap_modal
				boolean ReportModal=true;
				req.setAttribute("ReportModal", ReportModal);
				req.setAttribute("prod_id", prod_id);
				req.setAttribute("ord_id", ord_id);
				
				//改成modal
				String url = "/front-end/ord/listAllOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		//訂單檢舉資料存入
				if ("getOne_For_Report_Update".equals(action)) { // 來自listAllProd.jsp的請求
					
					System.out.println("=======getOne_For_Report_Update======");
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);
					
					try {
						/***************************1.接收請求參數****************************************/
						
						String prod_id = req.getParameter("prod_id");
						String ord_id = req.getParameter("ord_id");
						String reason = req.getParameter("reason");
						String img = req.getParameter("img");
						System.out.println("prod_id="+prod_id);
						System.out.println("ord_id="+ord_id);
						System.out.println("reason="+reason);
						System.out.println("img="+img);
						
						/***************************2.開始查詢資料****************************************/
						OrdItemService ordItemSvc = new OrdItemService();
						OrdItemVO ordItemVO = ordItemSvc.getOneOrdItem(prod_id, ord_id);
						
						//設定ordItemVO
						ordItemVO.setOrd_item_rt_status("已檢舉");
						ordItemVO.setOrd_item_rt_date(new Timestamp(new Date().getTime()));
						ordItemVO.setOrd_item_rt_comm(reason);
						ordItemVO.setOrd_item_rt_pic(img);
						
						/***************************3.查詢完成,準備轉交(Send the Success view)************/
						ordItemSvc.updateOrdItem(ordItemVO);
						
						String tab = req.getParameter("tab");
						System.out.println("tab=" + tab);
						req.setAttribute("tab", tab);
						
//						String url = "/front-end/ord/listAllOrd.jsp";
//						RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
//						successView.forward(req, res);
						out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
						System.out.println("!!!!!!!!!!!");
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						System.out.println("???????????");
						errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
						failureView.forward(req, res);
					}
				}		
		
		
		//訂單檢舉審核跳窗
		if ("getOneModal_For_Review".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				
				/***************************2.開始查詢資料*****************************************/
				
				
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				
				
				//Bootstrap_modal
				boolean ReviewModal=true;
				req.setAttribute("ReviewModal", ReviewModal);
				req.setAttribute("prod_id", prod_id);
				req.setAttribute("ord_id", ord_id);
				
				//改成modal
//				String url = "/back-end/ord/back_listAllOrd.jsp";
				
				//原本畫面跳轉
				String url = "/front-end/ord/listOneReviewModal.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		//訂單檢舉審核資料存入
		if ("getOne_For_Review_Update".equals(action)) { // 來自listAllProd.jsp的請求
			
			System.out.println("=======getOne_For_Review_Update======");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				String ord_item_review = req.getParameter("ord_item_review");
				String ord_item_rv_des = req.getParameter("ord_item_rv_des");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				System.out.println("ord_item_review="+ord_item_review);
				System.out.println("ord_item_rv_des="+ord_item_rv_des);
				
				/***************************2.開始查詢資料****************************************/
				OrdItemService ordItemSvc = new OrdItemService();
				OrdItemVO ordItemVO = ordItemSvc.getOneOrdItem(prod_id, ord_id);
				
				//設定ordItemVO
				ordItemVO.setOrd_item_review(ord_item_review);
				ordItemVO.setOrd_item_rv_des(ord_item_rv_des);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				ordItemSvc.updateOrdItem(ordItemVO);
				
				String tab = req.getParameter("tab");
				System.out.println("tab=" + tab);
				req.setAttribute("tab", tab);
				
//				String url = "/front-end/ord/listAllOrd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
//				successView.forward(req, res);
				out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
				System.out.println("!!!!!!!!!!!");
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("???????????");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
				failureView.forward(req, res);
			}
		}
		

		
		//訂單確認收貨跳窗
		if ("getOne_For_Receive_Update".equals(action)) { // 來自listAllProd.jsp的請求

			System.out.println("=======getOne_For_Receive_Update======");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				
				/***************************2.開始查詢資料****************************************/
				OrdItemService ordItemSvc = new OrdItemService();
				OrdItemVO ordItemVO = ordItemSvc.getOneOrdItem(prod_id, ord_id);
				
				//設定ordItemVO
				ordItemVO.setOrd_item_rc_status("已收貨");
				ordItemVO.setOrd_item_rc_date(new Timestamp(new Date().getTime()));
				ordItemVO.setOrd_item_rt_status("未檢舉");
				
				//查詢prod_price以發放愛心幣，更新明細中的愛心幣發放狀態欄位
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				String memb_id = prodVO.getMemb_id();
				Integer prod_price = prodVO.getProd_price();
				Integer ord_item_coin_st = Math.round(prod_price*0.8f);
				ordItemVO.setOrd_item_coin_st(Integer.toString(ord_item_coin_st));
				
				//查詢會員VO，以更新會員愛心幣餘額
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(memb_id);
				Integer memb_balance = memVO.getMemb_balance();
				memVO.setMemb_balance(memb_balance+ord_item_coin_st);
				
				//更新愛心幣明細表格
				CurDtVO curDtVO = new CurDtVO();
				curDtVO.setMemb_id(memb_id);
				curDtVO.setCur_src_id(ord_id);
				curDtVO.setCur_dt(Integer.toString(ord_item_coin_st));
				
				

				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				ordItemSvc.updateOrdItemWithMem(ordItemVO, memVO, curDtVO);
				
				String tab = req.getParameter("tab");
				System.out.println("tab=" + tab);
				req.setAttribute("tab", tab);
				
//				String url = "/front-end/ord/listAllOrd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
//				successView.forward(req, res);
				out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
				System.out.println("!!!!!!!!!!!");
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("???????????");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		//訂單確認出貨跳窗
		if ("getOne_For_Ship_Update".equals(action)) { // 來自listAllProd.jsp的請求
			
			System.out.println("=======getOne_For_Ship_Update======");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				
				/***************************2.開始查詢資料****************************************/
				OrdItemService ordItemSvc = new OrdItemService();
				OrdItemVO ordItemVO = ordItemSvc.getOneOrdItem(prod_id, ord_id);
				
				//設定ordItemVO
				ordItemVO.setOrd_item_sp_status("已出貨");
				ordItemVO.setOrd_item_sp_date(new Timestamp(new Date().getTime()));
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				ordItemSvc.updateOrdItem(ordItemVO);
				
				String tab = req.getParameter("tab");
				System.out.println("tab=" + tab);
				req.setAttribute("tab", tab);
				
//				String url = "/front-end/ord/listAllOrd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
//				successView.forward(req, res);
				out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
				System.out.println("!!!!!!!!!!!");
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("???????????");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		//訂單明細跳窗
		if ("getOneModal_For_Detail".equals(action)) { // 來自listAllProd.jsp的請求
			
			System.out.println("=======getOneModal_For_Detail======");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String prod_id = req.getParameter("prod_id");
				String ord_id = req.getParameter("ord_id");
				System.out.println("prod_id="+prod_id);
				System.out.println("ord_id="+ord_id);
				
				/***************************2.開始查詢資料****************************************/
				OrdItemService ordItemSvc = new OrdItemService();
				OrdItemVO ordItemVO = ordItemSvc.getOneOrdItem(prod_id, ord_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("ordItemVO_Modal", ordItemVO);         // 資料庫取出的prodVO物件,存入req
				
				//原本畫面跳轉
//				String url = "/front-end/ord/listAllOrd.jsp";
				
				//Bootstrap_modal
				boolean openModal=true;
				req.setAttribute("openModal",openModal );
				
				String url = "/front-end/ord/listOneOrdDetailModal.jsp";
//				//改成modal
//				String url = "/front-end/ord/listAllOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}

package com.prod.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mem.model.MemVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgService;
import com.prodimg.model.ProdImgVO;

@WebServlet("/product/product_upload.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 8 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProdServlet extends HttpServlet {

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
		
		MemVO memVO = (MemVO) session.getAttribute("memVO");
		String memb_id = null;
		if(memVO!=null)
			memb_id = memVO.getMemb_id();
		
		
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
		
		if ("getOneModal_For_Display".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始查詢資料*****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				
				ProdImgService prodImgSvc = new ProdImgService();
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				session.setAttribute("reviewprodVO", prodVO); // 資料庫取出的prodVO物件,存入req
				session.setAttribute("reviewprodImgList", prodImgList);
				//原本畫面跳轉
//				String url = "/front-end/product/listOneProdModal.jsp";
				
				//Bootstrap_modal
				boolean openModal=true;
				req.setAttribute("openModal",openModal );
				
				//改成modal
				String url = "/back-end/product/back_shop.jsp";
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
		
//		if ("getAll_For_Display".equals(action)) { // 來自select_page.jsp的請求
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				
////				if (str == null || (str.trim()).length() == 0) {
////					errorMsgs.add("請輸入產品編號");
////				}
////				// Send the use back to the form, if there were errors
////				if (!errorMsgs.isEmpty()) {
////					RequestDispatcher failureView = req
////							.getRequestDispatcher("/prod/select_page.jsp");
////					failureView.forward(req, res);
////					return;//程式中斷
////				}
////				
////				String prod_id = null;
////				try {
////					prod_id = new Integer(str);
////				} catch (Exception e) {
////					errorMsgs.add("員工編號格式不正確");
////				}
//				// Send the use back to the form, if there were errors
////				if (!errorMsgs.isEmpty()) {
////					RequestDispatcher failureView = req
////							.getRequestDispatcher("/prod/select_page.jsp");
////					failureView.forward(req, res);
////					return;//程式中斷
////				}
//				
//				/***************************2.開始查詢資料*****************************************/
//				ProdService prodSvc = new ProdService(); //用介面ProdService來宣告，降低與DAO的相依性
//				List<ProdVO> list = prodSvc.getAll();
//				
//				System.out.println(req.getParameter("type"));
//				Iterator<ProdVO> iter = list.iterator();
//				switch(req.getParameter("type")){
//					case "貓":
//						while (iter.hasNext()) {
//					    	ProdVO prodVO = iter.next();
//					        if(! "貓".equals(prodVO.getProd_ani_type_id())) {
//						        System.out.println(prodVO.getProd_ani_type_id());
//						        System.out.println(prodVO.getProd_id());
//						        iter.remove();
//					        }
//					    }
//						break;
//					case "狗":
//						while (iter.hasNext()) {
//					    	ProdVO prodVO = iter.next();
//					        if(! "狗".equals(prodVO.getProd_ani_type_id())) {
//					        	 iter.remove();
//					        }
//					    }
//						break;
//					case "飛禽":
//						while (iter.hasNext()) {
//							ProdVO prodVO = iter.next();
//							if(! "飛禽".equals(prodVO.getProd_ani_type_id())) {
//								iter.remove();
//							}
//						}
//						break;
//					case "兔":
//						while (iter.hasNext()) {
//							ProdVO prodVO = iter.next();
//							if(! "兔".equals(prodVO.getProd_ani_type_id())) {
//								iter.remove();
//							}
//						}
//						break;
//					case "其他":
//						while (iter.hasNext()) {
//							ProdVO prodVO = iter.next();
//							if(! "其他".equals(prodVO.getProd_ani_type_id())) {
//								iter.remove();
//							}
//						}
//						break;
//				}
////				if (prodVO == null) {
////					errorMsgs.add("查無資料");
////				}
////				// Send the use back to the form, if there were errors
////				if (!errorMsgs.isEmpty()) {
////					RequestDispatcher failureView = req
////							.getRequestDispatcher("/prod/select_page.jsp");
////					failureView.forward(req, res);
////					return;//程式中斷
////				}
//				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("list", list); // 資料庫取出的prodVO物件,存入req
//				System.out.println("list長度= "+list.size());
//				String url = "/front-end/product/listAllProd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
//				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
//				failureView.forward(req, res);
//			}
//		}
		
		
		if ("listAll_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				Map<String, String[]> map = req.getParameterMap();
				System.out.println("map size=" + map.size());
				System.out.println("map.keySet()=" + map.keySet());
				System.out.println("map.get('prod_ani_type_id')=" + Arrays.toString(map.get("prod_ani_type_id")));
				req.setAttribute("map", map);
				
				/***************************2.開始複合查詢***************************************/
				ProdService prodSvc = new ProdService(); //用介面ProdService來宣告，降低與DAO的相依性
				List<ProdVO> list = prodSvc.getAll(map);
				System.out.println("list=" + list);
				System.out.println("=======list==null=======" + (list==null));
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("listAllProd_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/product/listAllProd_ByCompositeQuery.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
//				failureView.forward(req, res);
//			}
		}	
		
		
		if ("getOne_For_Review_Update".equals(action)) { // 來自listAllProd.jsp的請求

			System.out.println("=======getOne_For_Review_Update======");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				String prod_id = req.getParameter("prod_id");
				String prod_review = req.getParameter("prod_review");
				String prod_review_des = req.getParameter("prod_review_des");
				System.out.println("prod_id="+prod_id);
				System.out.println("prod_review="+prod_review);
				System.out.println("prod_review_des="+prod_review_des);
				
				
//				if (prod_review==null || "0".equals(prod_review)) {
//					errorMsgs.add("請選擇審核結果");
//					System.out.println("請選擇審核結果");
//				}
//				if (prod_review_des==null || prod_review_des.trim().length()==0) {
//					errorMsgs.add("請填寫審核結果說明");
//					System.out.println("請填寫審核結果說明");
//				}
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				
				prodVO.setProd_review(prod_review);
				prodVO.setProd_review_des(prod_review_des);
				if ("通過".equals(prod_review)) {
					prodVO.setProd_status("上架");
				} 
				System.out.println("prodVO.getProd_name()"+prodVO.getProd_name());
				System.out.println("prodVO.getProd_price()"+prodVO.getProd_price());
				
				ProdImgService prodImgSvc = new ProdImgService();
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					session.setAttribute("reviewprodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
					session.setAttribute("reviewprodImgList", prodImgList); 
					//原本的跳窗
					//RequestDispatcher failureView = req.getRequestDispatcher("/front-end/product/listOneProdModal.jsp");
					
					//Bootstrap_modal
//					boolean openModal=true;
//					req.setAttribute("openModal",openModal );
					
					//改成modal
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/product/back_shop.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				prodSvc.updateProd(prodVO);
				session.setAttribute("reviewprodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
				session.setAttribute("reviewprodImgList", prodImgList);         // 資料庫取出的prodVO物件,存入req
//				String url = "/back-end/product/back_shop.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
//				successView.forward(req, res);
				
				out.println(1); //送回ajax一定要是json格式，不然會錯誤，因為ajax有設定dataType: 'json',也可不設定
				System.out.println("OKOKOKOKOK");

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/donate/listAllProdDon.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("ProdServlet.java得到從listAllProdDon.jsp設定的屬性"+req.getAttribute("Test"));
			System.out.println("ProdServlet.java得到從listAllProdDon.jsp傳過來的請求參數值"+req.getParameter("whichPage"));
			System.out.println("ProdServlet.java得到從listAllProdDon.jsp傳過來的請求參數值"+req.getParameter("prod_id"));
			
			try {
				/***************************1.接收請求參數****************************************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				
				ProdImgService prodImgSvc = new ProdImgService();
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("updateprodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
				session.setAttribute("updateprodImgList", prodImgList);         // 資料庫取出的prodVO物件,存入req
				String url = "/front-end/donate/updateProdDon.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/donate/listAllProdDon.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_prod_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			ProdVO prodVO = (ProdVO) session.getAttribute("updateprodVO");
			System.out.println("prodId= "+prodVO.getProd_id());
			System.out.println(prodVO);
			System.out.println("ProdServlet.java得到從updateProdDon.jsp傳過來的屬性"+req.getAttribute("Test"));
			System.out.println("ProdServlet.java得到從updateProdDon.jsp傳過來的請求參數值"+req.getParameter("whichPage"));
			System.out.println("ProdServlet.java得到從updateProdDon.jsp傳過來的請求參數值"+req.getParameter("prod_id"));
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
//				String prod_id = req.getParameter("prod_id");
//				String memb_id = req.getParameter("memb_id");
				String prod_type_id = req.getParameter("prod_type_id");
				System.out.println(prod_type_id);
				String prod_ani_type_id = req.getParameter("prod_ani_type_id");
				String prod_name = req.getParameter("prod_name");
				System.out.println(prod_name);
				String prod_des = req.getParameter("prod_des");
				String prod_info = req.getParameter("prod_info");
				String prod_qty = req.getParameter("prod_qty");
				String prod_price = req.getParameter("prod_price");
				String prod_review = null;
				System.out.println(prod_review);
				String prod_review_des = null;
				String prod_status = null;
//				Integer prod_stock = new Integer(req.getParameter("prod_stock"));
//				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Timestamp prod_date = new java.sql.Timestamp(new java.util.Date().getTime()); 
				
//				if (memb_id == null || memb_id.trim().length() == 0) {
//					errorMsgs.add("會員編號請勿空白");
//					System.out.println("111");
//				}
				
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
					System.out.println("222");
				}
				
				//prod_qty錯誤驗證
				String prod_qty_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
				System.out.println(prod_qty);
				if (prod_qty == null || prod_qty.trim().length() == 0) {
					//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
					errorMsgs.add("捐贈數量請勿空白");
				} else if(prod_qty.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("捐贈數量不能為零");
				} else if(!prod_qty.trim().matches(prod_qty_Reg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("捐贈數量只能是數字, 且必須大於零，且小於99999");
	            }
				Integer prod_qty_int = null;
				try {
					prod_qty_int = new Integer(prod_qty);
				} catch (NumberFormatException e) {
//					prod_price = 0;
					System.out.println("888");
				}
				
				//prod_price錯誤驗證
				String prod_price_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
				System.out.println(prod_price);
				if (prod_price == null || prod_price.trim().length() == 0) {
					//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
					errorMsgs.add("商品價格請勿空白");
				} else if(prod_price.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品價格不能為零");
	            } else if(!prod_price.trim().matches(prod_price_Reg)) { //以下練習正則(規)表示式(regular-expression)
	            	errorMsgs.add("商品價格只能是數字, 且必須大於零，且小於99999");
	            }
				Integer prod_price_int = null;
				try {
					prod_price_int = new Integer(prod_price);
				} catch (NumberFormatException e) {
//					prod_price = 0;
					System.out.println("888");
				}
				
//				Integer prod_price = null;
//				try {
//					prod_price = new Integer(req.getParameter("prod_price").trim());
//				} catch (NumberFormatException e) {
////					prod_price = 0;
//					errorMsgs.add("價格請填數字");
//					System.out.println("888");
//				}
//				if(prod_price<=0) {
//					errorMsgs.add("價格請填大於零的數字");
////					prod_price = 0;
//					System.out.println("999");
//				}
				
				if (prod_info == null || prod_info.trim().length() == 0) {
					errorMsgs.add("商品資訊請勿空白");
					System.out.println("444");
				}
				if (prod_des == null || prod_des.trim().length() == 0) {
					errorMsgs.add("商品描述請勿空白");
					System.out.println("333");
				}

//				ProdVO prodVO = new ProdVO();
				prodVO.setProd_type_id(prod_type_id);
				prodVO.setProd_ani_type_id(prod_ani_type_id);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_des(prod_des);
				prodVO.setProd_info(prod_info);
				prodVO.setProd_qty(prod_qty_int);
				prodVO.setProd_stock(prod_qty_int); //庫存量為後端系統作業，不能被修改，先預設而已(not null >=0)
				prodVO.setProd_date(prod_date);
				prodVO.setProd_review(prod_review);
				prodVO.setProd_review_des(prod_review_des);
				prodVO.setProd_status(prod_status);
				prodVO.setProd_price(prod_price_int);
				
				
				//確認照片至少要留一張，上傳照片數量減刪除數量必須大於零
				String imgList[] = req.getParameterValues("delete");
				System.out.println("imgList= "+imgList);
				ProdImgService prodImgSvc = new ProdImgService();
				
				Collection<Part> parts = req.getParts();
				System.out.println("parts list size=:"+parts.size());
				
				int i =0; 
				for (Part part : parts) { 
					System.out.println("part name="+part.getSubmittedFileName());
					if (part.getSubmittedFileName() != null && req.getPart("prod_img").getSubmittedFileName().length()!=0 && part.getContentType() != null) {
						i++;
					}
				}
				System.out.println("新上傳照片= "+i+" 張");
				System.out.println("--------------------------------------------");

				
				if(imgList != null && -imgList.length+prodImgSvc.getOneProdImg(prodVO.getProd_id()).size()+ i <= 0) {
					System.out.println(imgList.length);
					errorMsgs.add("至少需有一張照片");
				}
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/donate/updateProdDon.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ProdService prodSvc = new ProdService();
				System.out.println("??????????");
				prodSvc.updateProd(prodVO);
				
				
				//刪除照片
				int j =0;
				if(imgList != null){
					for (String prod_img_id: imgList) {
						System.out.println("prod_img_id="+prod_img_id);
						prodImgSvc.deleteProdImg(prod_img_id);
						System.out.println(prod_img_id+"已刪除");
						j++;
					}
				}
				System.out.println("刪除照片= "+j+" 張");
				
				
				
//				接著要將照片送到照片表格中				

				for (Part part : parts) {
					System.out.println("part name="+part.getSubmittedFileName());

					if (part.getSubmittedFileName() != null && req.getPart("prod_img").getSubmittedFileName().length()!=0 && part.getContentType() != null) {

						// 將圖片存到資料庫
						// 存到本地目錄或存到資料庫只能二擇一?
						ProdImgVO prodImgVO1 = new ProdImgVO();

						byte[] byteArr = getPictureByteArray(part);

						
						prodImgVO1.setProd_img(byteArr);
						prodImgVO1.setProd_id(prodVO.getProd_id());
						prodImgSvc.addProdImg(prodImgVO1);
						
					}
				}
					
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prodVO.getProd_id());
				System.out.println("prodImgList length="+ prodImgList.size());
					
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				
				req.setAttribute("prodVO", prodVO); // 資料庫update成功後,正確的的prodVO物件,存入req
				req.setAttribute("prodImgList", prodImgList);
				System.out.println("size of prodImgList= " + prodImgList.size());
				String url = "/front-end/donate/listAllProdDon.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneProd.jsp
				System.out.println("$$$$$$$$$$");
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				req.setAttribute("prodVO", prodVO);
				System.out.println("@@@@@@@@@@");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/donate/updateProdDon.jsp");
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
			System.out.println("000");
			ProdVO prodVO = new ProdVO();
			System.out.println("得到從addProdDon.jsp設定的屬性"+req.getAttribute("Test"));

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//				String memb_id = req.getParameter("memb_id");
				String prod_type_id = req.getParameter("prod_type_id");
				String prod_ani_type_id = req.getParameter("prod_ani_type_id");
				String prod_name = req.getParameter("prod_name");
				String prod_des = req.getParameter("prod_des");
				String prod_info = req.getParameter("prod_info");
				String prod_qty = req.getParameter("prod_qty");
				String prod_price = req.getParameter("prod_price");
//				String prod_review = req.getParameter("prod_review");
//				String prod_review_des = req.getParameter("prod_review_des");
//				String prod_status = req.getParameter("prod_status");
//				Integer prod_stock = new Integer(req.getParameter("prod_stock"));
//				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Timestamp prod_date = new java.sql.Timestamp(new java.util.Date().getTime());  
				
				
//				if (memb_id == null || memb_id.trim().length() == 0) {
//					errorMsgs.add("會員編號請勿空白");
//					System.out.println("111");
//				}
				
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
					System.out.println("222");
				}
				
				//prod_qty錯誤驗證
				String prod_qty_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
				System.out.println(prod_qty);
				if (prod_qty == null || prod_qty.trim().length() == 0) {
					//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
					errorMsgs.add("捐贈數量請勿空白");
				} else if(prod_qty.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("捐贈數量不能為零");
				} else if(!prod_qty.trim().matches(prod_qty_Reg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("捐贈數量只能是數字, 且必須大於零，且小於99999");
	            }
				Integer prod_qty_int = null;
				try {
					prod_qty_int = new Integer(prod_qty);
				} catch (NumberFormatException e) {
//					prod_price = 0;
					System.out.println("888");
				}
				
				//prod_price錯誤驗證
				String prod_price_Reg = "^[0-9]?[0-9]?[0-9]?[0-9]?[0-9]?$"; //練習用正規表達式來做錯誤驗證
				System.out.println(prod_price);
				if (prod_price == null || prod_price.trim().length() == 0) {
					//prod_qty其實不會是null，就算沒輸入也是空字串，但是若setParameter打錯就會是null(500)，所以才加上ename == null
					errorMsgs.add("商品價格請勿空白");
				} else if(prod_price.trim().equals("0")) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品價格不能為零");
	            } else if(!prod_price.trim().matches(prod_price_Reg)) { //以下練習正則(規)表示式(regular-expression)
	            	errorMsgs.add("商品價格只能是數字, 且必須大於零，且小於99999");
	            }
				Integer prod_price_int = null;
				try {
					prod_price_int = new Integer(prod_price);
				} catch (NumberFormatException e) {
//					prod_price = 0;
					System.out.println("888");
				}
				
//				Integer prod_price = null;
//				try {
//					prod_price = new Integer(req.getParameter("prod_price").trim());
//				} catch (NumberFormatException e) {
////					prod_price = 0;
//					errorMsgs.add("價格請填數字");
//					System.out.println("888");
//				}
//				if(prod_price<=0) {
//					errorMsgs.add("價格請填大於零的數字");
////					prod_price = 0;
//					System.out.println("999");
//				}
				
				if (prod_info == null || prod_info.trim().length() == 0) {
					errorMsgs.add("商品資訊請勿空白");
					System.out.println("444");
				}
				if (prod_des == null || prod_des.trim().length() == 0) {
					errorMsgs.add("商品描述請勿空白");
					System.out.println("333");
				}
				
				
				prodVO.setMemb_id(memVO.getMemb_id());
				prodVO.setProd_type_id(prod_type_id);
				prodVO.setProd_ani_type_id(prod_ani_type_id);
				prodVO.setProd_name(prod_name);
				prodVO.setProd_des(prod_des);
				prodVO.setProd_info(prod_info);
				prodVO.setProd_qty(prod_qty_int);
				prodVO.setProd_stock(prod_qty_int);
				prodVO.setProd_date(prod_date);
//				prodVO.setProd_review(prod_review);
//				prodVO.setProd_review_des(prod_review_des);
//				prodVO.setProd_status(prod_status);
				prodVO.setProd_price(prod_price_int);
				
//				System.out.println("part= "+req.getPart("prod_img"));
//				System.out.println("part= "+req.getPart("prod_img").getSubmittedFileName());
//				System.out.println("part= "+req.getPart("prod_img").getContentType());
				
				//確認是否有上傳照片
				if (req.getPart("prod_img").getSubmittedFileName()==null || req.getPart("prod_img").getSubmittedFileName().length()==0 ||  req.getPart("prod_img").getContentType() == null) {
					System.out.println("pppppppppp");
					errorMsgs.add("請上傳商品照片");
				} 

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
//					req.setAttribute("prod_type_id", prod_type_id); // 含有輸入格式錯誤的prodVO物件,也存入req
//					req.setAttribute("prod_ani_type_id", prod_ani_type_id); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/donate/addProdDon.jsp");
					System.out.println("9999999999");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ProdService prodSvc = new ProdService();
				System.out.println("??????????");
				
//				prodVO = prodSvc.addProd("M000000008", prod_type_id, prod_ani_type_id, prod_name, prod_des, prod_info, prod_qty_int, 0, prod_date, "", "", "", prod_price_int);
				String prod_id = prodSvc.addProd(prodVO); //得到回傳的自增主鍵值
				
				
				
//				接著要將照片送到照片表格中			
				Collection<Part> parts = req.getParts();
	//			Part part = req.getPart("prod_img");
				System.out.println("size=:"+parts.size());
				
				for (Part part1 : parts) { 
					System.out.println("part name="+part1.getSubmittedFileName());
				}
					
				System.out.println("--------------------------------------------");
	
				ProdImgService prodImgSvc = new ProdImgService();
				for (Part part : parts) {
					System.out.println("part name="+part.getSubmittedFileName());
	
					if (part.getSubmittedFileName() != null && req.getPart("prod_img").getSubmittedFileName().length()!=0 && part.getContentType() != null) {
	
	
						// 將圖片存到資料庫
						// 存到本地目錄或存到資料庫只能二擇一?
						ProdImgVO prodImgVO1 = new ProdImgVO();
						prodImgVO1.setProd_id(prod_id);
	
						byte[] byteArr = getPictureByteArray(part);
	
						prodImgVO1.setProd_img(byteArr);
						prodImgSvc.addProdImg(prodImgVO1);
	
					}
				}
				
			
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/donate/listAllProdDon.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
				System.out.println("$$$$$$$$$$");
				successView.forward(req, res);		
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				req.setAttribute("prodVO", prodVO);
				System.out.println("@@@@@@@@@@");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/donate/addProdDon.jsp");
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
				
				ProdImgService prodImgSvc = new ProdImgService();
				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
				for (ProdImgVO prodImgVO:prodImgList) {
					prodImgSvc.deleteProdImg(prodImgVO.getProd_img_id());
				}
				
				ProdService prodSvc = new ProdService();
				prodSvc.deleteProd(prod_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/	
				Integer whichPage = new Integer(req.getParameter("whichPage"));
				String url = "/front-end/donate/listAllProdDon.jsp?whichPage="+whichPage;
				req.setAttribute("msg", "已刪除一筆資料");
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/donate/listAllProdDon.jsp");
				failureView.forward(req, res);
			}
		}
	
		//下架商品
		if ("off".equals(action)) { // 來自listAllProd.jsp
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("ProdServlet.java得到從listAllProdDon.jsp設定的屬性"+req.getAttribute("Test"));
			
//			try {
				/***************************1.接收請求參數****************************************/
				String prod_id = req.getParameter("prod_id");
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_id);
				prodVO.setProd_status("下架");
				prodSvc.updateProd(prodVO);
				
//				ProdImgService prodImgSvc = new ProdImgService();
//				List<ProdImgVO> prodImgList = prodImgSvc.getOneProdImg(prod_id);
	
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				String tab = req.getParameter("tab");
				System.out.println("tab=" + tab);
				req.setAttribute("tab", tab);
				
				String location = req.getParameter("location");
				String url;
				if ("back".equals(location)) {
					url = "/back-end/product/back_shop.jsp";
				} else {
					url = "/front-end/donate/listAllProdDon.jsp";
				}
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_prod_input.jsp
				successView.forward(req, res);
		
					/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/donate/listAllProdDon.jsp");
//				failureView.forward(req, res);
//			}
		}
	}

	public static byte[] getPictureByteArray(Part part) throws IOException {
		InputStream in = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[in.available()]; // 設定每次讀取的大小
		int i;
		while ((i = in.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		in.close();

		return baos.toByteArray();	//將ByteArrayOutputStream轉成ByteArray
	}
}

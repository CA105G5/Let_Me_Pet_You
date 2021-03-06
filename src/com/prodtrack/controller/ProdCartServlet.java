package com.prodtrack.controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONException;
import org.json.JSONObject;

import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgService;
import com.prodimg.model.ProdImgVO;
import com.mem.model.MemVO;

import redis.clients.jedis.Jedis;

public class ProdCartServlet extends HttpServlet {

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
		
		String session_id = session.getId();
		System.out.println("session_id="+session_id);
		
		String prod_qty = req.getParameter("prod_qty");
		System.out.println("prod_qty="+prod_qty);
		String prod_id = req.getParameter("prod_id");
		System.out.println("prod_id="+prod_id);
		
		ProdService prodSvc = new ProdService();
		Integer prod_stock = 0;
		if (prod_id!=null)
			prod_stock = prodSvc.getOneProd(prod_id).getProd_stock();
		System.out.println("prod_stock=" + prod_stock); 
		
		//建立Redis連線
		Jedis jedis=null;
		try {
			jedis = new Jedis("localhost", 6379);
			jedis.auth("123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		//當會員登入時，將session裡的購物車商品放到會員購物車，刪除session的購物車
		if (memVO!=null) {
			memb_id = memVO.getMemb_id();
			System.out.println("memb_id="+memb_id);
			Map<String, String> map = jedis.hgetAll("Cart:" + session_id);
			System.out.println("Cart:" + session_id + "=" + map);
			if (map!=null) {
				for (String key : map.keySet()) {
					int cartQty_int = new Integer(map.get(key));
					String mem_cartQty = jedis.hgetAll("Cart:" + memb_id).get(key);
					int mem_cartQty_int = 0;
					if (mem_cartQty!=null)
						mem_cartQty_int = new Integer(mem_cartQty);
					String qty;
					if (cartQty_int + mem_cartQty_int > prodSvc.getOneProd(key).getProd_stock() ) {
						qty = Integer.toString(prodSvc.getOneProd(key).getProd_stock());
					} else {
						qty = Integer.toString(cartQty_int + mem_cartQty_int);
					}
					
					jedis.hset("Cart:" + memb_id, key, qty);
					jedis.hdel("Cart:"+ session_id , key);
				}
			}
		} 
		
		
		if("addCart".equals(action)){
			
			if (memb_id==null) {
				if(prod_id!=null && prod_qty!=null) {
					String cartQty = jedis.hgetAll("Cart:" + session_id).get(prod_id);
					if (cartQty==null)
						jedis.hset("Cart:"+ session_id , prod_id, prod_qty);	
					else {
						int cartQty_int = new Integer(cartQty);
						int prod_qty_int = new Integer(prod_qty);
						System.out.println(cartQty_int + prod_qty_int); 
						String qty;
						if (cartQty_int + prod_qty_int > prod_stock ) {
							qty = Integer.toString(prod_stock);
						} else {
							qty = Integer.toString(cartQty_int + prod_qty_int);
						}
						jedis.hset("Cart:" + session_id, prod_id, qty);
					}  
				}
				System.out.println("Cart:" + session_id + " = " + jedis.hgetAll("Cart:" + session_id));
				System.out.println("Cart:" + session_id + " 購物車商品數量=" + jedis.hlen("Cart:" + session_id));
				out.println(jedis.hlen("Cart:" + session_id).intValue());
				
			} else {
				if(prod_id!=null && prod_qty!=null) {
					String cartQty = jedis.hgetAll("Cart:" + memb_id).get(prod_id);
					if (cartQty==null)
						jedis.hset("Cart:"+ memb_id , prod_id, prod_qty);	
					else {
						int cartQty_int = new Integer(cartQty);
						int prod_qty_int = new Integer(prod_qty);
						String qty;
						if (cartQty_int + prod_qty_int > prod_stock ) {
							qty = Integer.toString(prod_stock);
						} else {
							qty = Integer.toString(cartQty_int + prod_qty_int);
						}
						jedis.hset("Cart:" + memb_id, prod_id, qty);
					}
				}
				System.out.println("Cart:" + memb_id + " = " + jedis.hgetAll("Cart:" + memb_id));
				System.out.println("Cart:" + memb_id + " 購物車商品數量=" + jedis.hlen("Cart:" + memb_id));
				out.println(jedis.hlen("Cart:" + memb_id).intValue());
			}
		}
		
		if("changeCart".equals(action)){
			
			JSONObject obj = new JSONObject();
			if (Integer.valueOf(prod_qty) > prod_stock) {
				try {
					obj.accumulate("success", 0);
					obj.accumulate("prod_stock", prod_stock); 
					prod_qty = String.valueOf(prod_stock);
				} catch (JSONException e) {
					e.printStackTrace();
				} 
//				out.println(obj.toString());
			} 
				Map<String, String> cartMap = null;
				
				if (memb_id==null) {
					if(prod_id!=null && prod_qty!=null) {
						jedis.hset("Cart:"+ session_id , prod_id, prod_qty);	
						cartMap = jedis.hgetAll("Cart:"+session_id);
					}
					System.out.println("Cart:" + session_id + " = " + jedis.hgetAll("Cart:" + session_id));
					System.out.println("Cart:" + session_id + " 購物車商品數量=" + jedis.hlen("Cart:" + session_id));
					
				} else {
					if(prod_id!=null && prod_qty!=null) {
						jedis.hset("Cart:"+ memb_id , prod_id, prod_qty);	
						cartMap = jedis.hgetAll("Cart:" + memb_id);
					}
					System.out.println("Cart:" + memb_id + " = " + jedis.hgetAll("Cart:" + memb_id));
					System.out.println("Cart:" + memb_id + " 購物車商品數量=" + jedis.hlen("Cart:" + memb_id));
				}
				
				session.setAttribute("cartMap", cartMap); // 資料庫取出的prodVO物件,存入req
				Integer amount = 0;
				for (String prod : cartMap.keySet()) {
					System.out.println("111");
					Integer price = prodSvc.getOneProd(prod).getProd_price();
					System.out.println("222");
					Integer qty = new Integer(cartMap.get(prod));
					amount = amount + price*qty;
				}
				System.out.println("amount=" + amount);
				try {
					obj.accumulate("amount", amount);
				} catch (JSONException e) {
					e.printStackTrace();
				}
				
				out.println(obj.toString());
		}
		
		if("remove".equals(action)){
			System.out.println("移除商品prod_id="+prod_id);
			Map<String, String> cartMap = null;
			if (memb_id==null) {
				jedis.hdel("Cart:"+ session_id, prod_id);	
				cartMap = jedis.hgetAll("Cart:"+session_id);
				
			} else {
				jedis.hdel("Cart:"+ memb_id , prod_id);	
				cartMap = jedis.hgetAll("Cart:" + memb_id);
			}
			session.setAttribute("cartMap", cartMap); // 資料庫取出的prodVO物件,存入req
			Integer amount = 0;
			for (String prod : cartMap.keySet()) {
				System.out.println("111");
				Integer price = prodSvc.getOneProd(prod).getProd_price();
				System.out.println("222");
				Integer qty = new Integer(cartMap.get(prod));
				amount = amount + price*qty;
			}
			System.out.println("amount=" + amount);
			out.println(amount);
		}
		
		if ("check_Cart".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			Map<String, String> cartMap = null;

			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				/***************************2.開始查詢資料*****************************************/
				if (memb_id==null) {
					
					cartMap = jedis.hgetAll("Cart:"+session_id);
					System.out.println("Cart:" + session_id + " = " + cartMap);
					System.out.println("Cart:" + session_id + " 購物車商品數量=" + cartMap.size());
			
				} else {
					
					cartMap = jedis.hgetAll("Cart:" + memb_id);
					System.out.println("Cart:" + memb_id + " = " + cartMap);
					System.out.println("Cart:" + memb_id + " 購物車商品數量=" + cartMap.size());
					
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				Integer amount = 0;
				
				Iterator it = cartMap.entrySet().iterator();
				while (it.hasNext()) {
					System.out.println("111");
			        Map.Entry pair = (Map.Entry)it.next();
			        System.out.println(pair.getKey() + " = " + pair.getValue());
			        if (prodSvc.getOneProd((String)pair.getKey()).getProd_stock()==0 || "下架".equals(prodSvc.getOneProd((String)pair.getKey()).getProd_status())) {
			        	it.remove(); 
			        	jedis.hdel("Cart:"+ memb_id , (String)pair.getKey());
					}
			        else {
						Integer prod_price = prodSvc.getOneProd((String)pair.getKey()).getProd_price();
						System.out.println("222");
						Integer qty = new Integer(cartMap.get((String)pair.getKey()));
						
						amount = amount + prod_price*qty;
					}
			    }
//				for (String key : cartMap.keySet()) {
//					System.out.println("111");
//					System.out.println("key="+key);
//					if (prodSvc.getOneProd(key).getProd_stock()==0) {
//						cartMap.remove(key);
////						qty=0;
//					}
//					
////					直接讓redis購物車數量變0
////					if (prodSvc.getOneProd(key).getProd_stock()==0) {
////						cartMap.put(key,"0");
////						if (memb_id==null) 
////							jedis.hset("Cart:" + session_id, key, "0");
////						else
////							jedis.hset("Cart:" + memb_id, key, "0");
////					}
////					直接讓redis購物車數量變0
//					else {
//						Integer prod_price = prodSvc.getOneProd(key).getProd_price();
//						System.out.println("222");
//						Integer qty = new Integer(cartMap.get(key));
//						
//						amount = amount + prod_price*qty;
//					}
//				}
				session.setAttribute("cartMap", cartMap); // 資料庫取出的prodVO物件,存入req
				System.out.println("amount=" + amount);
				session.setAttribute("amount", amount);
				
				String url = "/front-end/ord/cart_Main.jsp";
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
		
		if ("receiver".equals(action)) { // 來自select_page.jsp的請求
			
			String[] qtyArr = req.getParameterValues("quantity");
			System.out.println("quantity="+qtyArr);
			String[] prodArr = req.getParameterValues("prod_id");
			System.out.println("prod_id="+prodArr);
			String amount = req.getParameter("amount").trim();
			System.out.println("amount="+amount);
			
			Map<String, String> cartMap = new HashMap<String,String>();
			Integer total_qty = 0;
			
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				/***************************2.開始查詢資料*****************************************/
				
				for (int i = 0; i< prodArr.length ; i++) {
						cartMap.put(prodArr[i], qtyArr[i]);
						total_qty += Integer.valueOf(qtyArr[i]);
				}
				System.out.println("cartMap:" + cartMap);
				System.out.println("cartMap 購物車商品數量=" + cartMap.size());
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				session.setAttribute("cartMap", cartMap); // 資料庫取出的prodVO物件,存入req
				System.out.println("amount=" + amount);
				session.setAttribute("amount", amount);
				session.setAttribute("total_qty", total_qty);
				
				String url = req.getContextPath()+"/front-end/ord/cart_Receiver.jsp";
				res.sendRedirect(url);
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
//				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		
		if(action==null){
			if (memb_id==null) {
				out.println(jedis.hlen("Cart:" + session_id).intValue());
			} else {
				out.println(jedis.hlen("Cart:" + memb_id).intValue());
			}
		}
		out.flush();
		jedis.close();
		out.close();
	}
}

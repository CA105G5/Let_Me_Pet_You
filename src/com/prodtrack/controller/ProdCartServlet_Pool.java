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
import redis.clients.jedis.JedisPool;
import util.JedisUtil;

public class ProdCartServlet_Pool extends HttpServlet {

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
		String session_id = null;
		if (memVO!=null) {
			memb_id = memVO.getMemb_id();
			System.out.println("memb_id="+memb_id);
		} else {
			session_id = session.getId();
			System.out.println("session_id="+session_id);
		}
		
		//建立Redis連線
		Jedis jedis = null;
		JedisPool pool = null;

		try {
			pool = JedisUtil.getJedisPool();
			jedis = pool.getResource();
			jedis.auth("123456");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if("addCart".equals(action)){
			String prod_qty = req.getParameter("prod_qty");
			System.out.println("prod_qty="+prod_qty);
			String prod_id = req.getParameter("prod_id");
			System.out.println("prod_id="+prod_id);
			
			if (memb_id==null) {
				if(prod_id!=null && prod_qty!=null) {
					String cartQty = jedis.hgetAll("Cart:" + session_id).get(prod_id);
					if (cartQty==null)
						jedis.hset("Cart:"+ session_id , prod_id, prod_qty);	
					else {
						int cartQty_int = new Integer(cartQty);
						int prod_qty_int = new Integer(prod_qty);
						String qty = Integer.toString(cartQty_int + prod_qty_int);
						jedis.hset("Cart:" + session_id, prod_id, qty);
					}
				}
				System.out.println("Cart:" + session_id + " = " + jedis.hgetAll("Cart:" + session_id));
				System.out.println("Cart:" + session_id + " 購物車商品數量=" + jedis.hlen("Cart:" + session_id));
		
			} else {
				if(prod_id!=null && prod_qty!=null) {
					String cartQty = jedis.hgetAll("Cart:" + memb_id).get(prod_id);
					if (cartQty==null)
						jedis.hset("Cart:"+ memb_id , prod_id, prod_qty);	
					else {
						int cartQty_int = new Integer(cartQty);
						int prod_qty_int = new Integer(prod_qty);
						String qty = Integer.toString(cartQty_int + prod_qty_int);
						jedis.hset("Cart:" + memb_id, prod_id, qty);
					}
				}
				System.out.println("Cart:" + memb_id + " = " + jedis.hgetAll("Cart:" + memb_id));
				System.out.println("Cart:" + memb_id + " 購物車商品數量=" + jedis.hlen("Cart:" + memb_id));
			}
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
				session.setAttribute("cartMap", cartMap); // 資料庫取出的prodVO物件,存入req
				
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
		
		
		
		if (memb_id==null) {
			out.println(jedis.hlen("Cart:" + session_id).intValue());
		} else {
			out.println(jedis.hlen("Cart:" + memb_id).intValue());
		}
		
		out.flush();
		out.close();
		jedis.close();
		JedisUtil.shutdownJedisPool();
	}
}

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

import com.mem.model.MemVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgService;
import com.prodimg.model.ProdImgVO;

import redis.clients.jedis.Jedis;

public class ProdTrackServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		System.out.println("action=" + action);
		
		HttpSession session = req.getSession();
		MemVO memVO = (MemVO) session.getAttribute("memVO");
		String memb_id = null;
		if (memVO!=null) {
			memb_id = memVO.getMemb_id();
		}
		
		String session_id = session.getId();
		System.out.println("session_id="+session_id);
		
		String prod_id = req.getParameter("prod_id");
		System.out.println("prod_id="+prod_id);
		
		
		//建立Redis連線
		Jedis jedis=null;
		try {
			jedis = new Jedis("localhost", 6379);
			jedis.auth("123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		if (memVO!=null) {
			memb_id = memVO.getMemb_id();
			System.out.println("memb_id="+memb_id);
			Set<String> set = jedis.smembers("Fav:" + session_id);
			System.out.println("Fav:" + session_id + "=" + set);
			if (set!=null) {
				for (String key : set) {
					jedis.sadd("Fav:" + memb_id, key);
					jedis.srem("Fav:"+ session_id , key);
				}
			}
			
			if("addFav".equals(action)){
				jedis.sadd("Fav:"+ memb_id, prod_id);
	
				System.out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id) );
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id) );
				out.println(1);
			}
			
			else if("cancelFav".equals(action)){
				jedis.srem("Fav:"+ memb_id, prod_id);
				
				System.out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id) );
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id));
				out.println(1);
			}
			
			else if("checkFav".equals(action)){
				Boolean fav = jedis.sismember("Fav:"+ memb_id, prod_id);
				
				System.out.println("Fav:" + memb_id + "目前是否有追蹤此商品=" + jedis.sismember("Fav:" + memb_id, prod_id));
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id));
				out.println(fav);
			}
		} else {
			if("addFav".equals(action)){
				jedis.sadd("Fav:"+ session_id, prod_id);
	
				System.out.println("Fav:" + session_id + "目前追蹤商品=" + jedis.smembers("Fav:" + session_id) );
				System.out.println("Fav:" + session_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + session_id) );
				out.println(1);
			}
			
			else if("cancelFav".equals(action)){
				jedis.srem("Fav:"+ session_id, prod_id);
				
				System.out.println("Fav:" + session_id + "目前追蹤商品=" + jedis.smembers("Fav:" + session_id) );
				System.out.println("Fav:" + session_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + session_id));
				out.println(1);
			}
			
			else if("checkFav".equals(action)){
				Boolean fav = jedis.sismember("Fav:"+ session_id, prod_id);
				
				System.out.println("Fav:" + session_id + "目前是否有追蹤此商品=" + jedis.sismember("Fav:" + session_id, prod_id));
				System.out.println("Fav:" + session_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + session_id));
				out.println(fav);
			}
			
//			out.println(0);
		}
		
		
		if ("check_Fav".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			Set<String> favSet = null;

			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				/***************************2.開始查詢資料*****************************************/
				if (memb_id==null) {
					
					favSet = jedis.smembers("Fav:"+session_id);
					System.out.println("Fav:" + session_id + " = " + favSet);
					System.out.println("Fav:" + session_id + " 追蹤商品數量=" + favSet.size());
			
				} else {
					
					favSet = jedis.smembers("Fav:"+memb_id);
					System.out.println("Fav:" + memb_id + " = " + favSet);
					System.out.println("Fav:" + memb_id + " 追蹤商品數量=" + favSet.size());
					
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				System.out.println("favSet="+favSet);
				session.setAttribute("favSet", favSet); // 資料庫取出的prodVO物件,存入req
				
				String url = "/front-end/prodtrack/listAllProdTrack.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);
				
			/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println("eeeeeeeeeee");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		if(action==null){
			if (memb_id==null) {
				out.println(jedis.smembers("Fav:"+session_id).size());
			} else {
				out.println(jedis.smembers("Fav:"+memb_id).size());
			}
		}
		out.flush();
		jedis.close();
		out.close();
		
	}
}
	

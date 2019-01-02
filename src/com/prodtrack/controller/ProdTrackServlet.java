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
		};
		
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
		
		if (memb_id!=null) {
			if("addFav".equals(action)){
				jedis.sadd("Fav:"+ memb_id, prod_id);
	
				System.out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id) );
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id) );
				out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id)  );
			}
			
			else if("cancelFav".equals(action)){
				jedis.srem("Fav:"+ memb_id, prod_id);
				
				System.out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id) );
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id));
				out.println("Fav:" + memb_id + "目前追蹤商品=" + jedis.smembers("Fav:" + memb_id) );
			}
			
			else if("checkFav".equals(action)){
				Boolean fav = jedis.sismember("Fav:"+ memb_id, prod_id);
				
				System.out.println("Fav:" + memb_id + "目前是否有追蹤此商品=" + jedis.sismember("Fav:" + memb_id, prod_id));
				System.out.println("Fav:" + memb_id + "目前追蹤商品數量=" + jedis.scard("Fav:" + memb_id));
				out.println(fav);
			}
		} else {
			out.println(0);
		}
		
		
		jedis.close();
		
		out.flush();
		out.close();
	}
}

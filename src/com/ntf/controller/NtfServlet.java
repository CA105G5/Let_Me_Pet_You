package com.ntf.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.donate.model.DonateService;
import com.donate.model.DonateVO;
import com.mem.model.MemVO;
import com.ntf.model.NtfService;
import com.ntf.model.NtfVO;
import com.ord.model.OrdService;
import com.ord.model.OrdVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;

public class NtfServlet extends HttpServlet {
	private static final long serialVersionUID = -2296611789021251086L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("11");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		MemVO memVO= (MemVO) session.getAttribute("memVO");
		String memb_id = memVO.getMemb_id();
		if("sort_type".equals(action)) {
			System.out.println("22");
			String ntf_id = req.getParameter("ntf_id");
			//檢查該使用者是否能看此通知，並查詢案例
			NtfService ntfSvc = new NtfService();
			List<NtfVO> list_ntf = ntfSvc.checkMemberNtf(memb_id,ntf_id);
			
			if(list_ntf.size()>0) {//可以查看通知
				System.out.println("33");
				NtfVO ntfVO = list_ntf.get(0);//從list取出
				
				String ntf_src_id = ntfVO.getNtf_src_id();
				String ntf_dt = ntfVO.getNtf_dt();
				//判斷通知來源
				String type_rescue = "[R]\\d{9,14}";
				String type_adopt = "[A]\\d{9,14}";
				String type_donate = "[D]\\d{9,14}";
				String type_product = "[P]\\d{9,14}";
				String type_order = "[O]\\d{8}[-]\\d{3}";
				//標示從未讀轉已讀
				ntfSvc.updateNtf_sta(ntf_id);
				
				if(ntf_src_id.matches(type_rescue)) {
					System.out.println("rescue");
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
							if(ntf_dt.contains("未通過!")
							 ||ntf_dt.contains("已派志工前往")) {
								System.out.println("3");
								//轉交
								req.setAttribute("ntf_src_id", ntf_src_id);
								RequestDispatcher orderView = 
										req.getRequestDispatcher("/front-end/members/listAllRescue.jsp");
								orderView.forward(req, res);
								return;
										
							}
							if(ntf_dt.contains("已發送愛心幣")) {
							   System.out.println("4");
								//轉交
							   req.setAttribute("ntf_src_id", ntf_src_id);
								RequestDispatcher checkView = 
										req.getRequestDispatcher("/front-end/members/cur_dt.jsp");
								checkView.forward(req, res);
								return;
												
							}					
				}else if(ntf_src_id.matches(type_adopt)) {
					System.out.println("adopt");
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher adoptView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					adoptView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_donate)) {
					System.out.println("donate");
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					DonateService donateSvc = new DonateService();
					DonateVO donateVO = donateSvc.getOneDonate(ntf_src_id);
					List<DonateVO> list = new ArrayList<DonateVO>();
					list.add(donateVO);
					req.setAttribute("list", list);
					//轉交
					RequestDispatcher donateView = 
							req.getRequestDispatcher("/front-end/donate/listAllMoneyDon.jsp");
					donateView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_product)) {
					System.out.println("product");
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					ProdService prodSvc = new ProdService();
					ProdVO prodVO = prodSvc.getOneProd(ntf_src_id);
					List<ProdVO> list = new ArrayList<ProdVO>();
					list.add(prodVO);
					req.setAttribute("list", list);
					//轉交
					RequestDispatcher productView = 
							req.getRequestDispatcher("/front-end/donate/listAllProdDon.jsp");
					productView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_order)){
					System.out.println("order");
					System.out.println("1");
					//將ord_id(ntf_src_id)以及prod_name(自己抓ntf_dt)設定在req裡面
					req.setAttribute("ord_id", ntf_src_id);
					req.setAttribute("prod_name", ntf_dt.split("\\[|\\]")[1]);//須從ntf_dt抓商品名
					req.setAttribute("ntf_dt", ntf_dt);//須從ntf_dt抓商品名
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					if(ntf_dt.contains("請盡快出貨")
					 ||ntf_dt.contains("已被檢舉")
					 ||ntf_dt.contains("您被檢舉的出貨商品")) {
						System.out.println("2");
						//轉交
						RequestDispatcher order_ShipView = 
								req.getRequestDispatcher("/front-end/ord/listAllOrd_Ship.jsp");
						order_ShipView.forward(req, res);
						return;
						
					}
					if(ntf_dt.contains("請注意查收")
					 ||ntf_dt.contains("您的檢舉訂單編號")) {
						System.out.println("3");
						//轉交
						RequestDispatcher orderView = 
								req.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
						orderView.forward(req, res);
						return;
								
					}
					if(ntf_dt.contains("已確認收貨囉")) {
					   System.out.println("4");
						//轉交
						RequestDispatcher checkView = 
								req.getRequestDispatcher("/front-end/members/cur_dt.jsp");
						checkView.forward(req, res);
						return;
										
					}
				}
			}
			
			
			
			
		}
	}
}

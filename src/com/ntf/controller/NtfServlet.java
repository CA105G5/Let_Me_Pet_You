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
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		MemVO memVO= (MemVO) session.getAttribute("memVO");
		String memb_id = memVO.getMemb_id();
		if("sort_type".equals(action)) {
			String ntf_id = req.getParameter("ntf_id");
			//檢查該使用者是否能看此通知，並查詢案例
			NtfService ntfSvc = new NtfService();
			List<NtfVO> list_ntf = ntfSvc.checkMemberNtf(memb_id,ntf_id);
			
			if(list_ntf.size()>0) {//可以查看通知
				NtfVO ntfVO = list_ntf.get(0);//從list取出
				
				String ntf_src_id = ntfVO.getNtf_src_id();
				//判斷通知來源
				String type_rescue = "[R]\\d{9,14}";
				String type_adopt = "[A]\\d{9,14}";
				String type_donate = "[D]\\d{9,14}";
				String type_product = "[P]\\d{9,14}";
				String type_order = "[O]\\d{9,14}";
				//標示從未讀轉已讀
				ntfSvc.updateNtf_sta(ntf_id);
				
				if(ntf_src_id.matches(type_rescue)) {
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher rescueView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					rescueView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_adopt)) {
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher adoptView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					adoptView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_donate)) {
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
				}else if(ntf_src_id.matches(type_order)) {
					//由ntf_src_id查詢出對應VO，並設定在req裡面
					
					
//					OrdService ordSvc = new OrdService();
//					OrdVO ordVO = ordSvc.getOneOrd(ntf_src_id);
//					req.setAttribute("ordVO", ordVO);
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher order_ShipView = 
							req.getRequestDispatcher("/front-end/ord/listAllOrd_Ship.jsp");
					order_ShipView.forward(req, res);
					return;
//					RequestDispatcher orderView = 
//							req.getRequestDispatcher("/front-end/ord/listAllOrd.jsp");
//					orderView.forward(req, res);
//					return;
				}
			}
			
			
			
			
		}
	}
}

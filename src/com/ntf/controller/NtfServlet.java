package com.ntf.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemVO;
import com.ntf.model.NtfService;
import com.ntf.model.NtfVO;

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
			List<NtfVO> list = ntfSvc.checkMemberNtf(memb_id,ntf_id);
			
			if(list.size()>0) {//可以查看通知
				NtfVO ntfVO = list.get(0);//從list取出
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
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher rescueView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					rescueView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_adopt)) {
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher adoptView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					adoptView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_donate)) {
					
					//轉交
					RequestDispatcher donateView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					donateView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_product)) {
					
					//轉交
					RequestDispatcher productView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					productView.forward(req, res);
					return;
				}else if(ntf_src_id.matches(type_order)) {
					
					//依照關鍵字找尋要轉交哪個畫面，用String中的contains來判斷
					
					//轉交
					RequestDispatcher orderView = 
							req.getRequestDispatcher("/back-end/members/select_page.jsp");
					orderView.forward(req, res);
					return;
				}
			}
			
			
			
			
		}
	}
}

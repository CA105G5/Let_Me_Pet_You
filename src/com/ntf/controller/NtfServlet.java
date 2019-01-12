package com.ntf.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		if("sort_type".equals(action)) {
			String ntf_src_id = req.getParameter("ntf_src_id");
			//判斷通知來源
			String type_rescue = "[R]\\d{9,14}";
			String type_adopt = "[A]\\d{9,14}";
			String type_donate = "[D]\\d{9,14}";
			String type_product = "[P]\\d{9,14}";
			String type_order = "[O]\\d{9,14}";
			
			if(ntf_src_id.matches(type_rescue)) {
				//
				RequestDispatcher rescueView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				rescueView.forward(req, res);
				return;
			}else if(ntf_src_id.matches(type_adopt)) {
				RequestDispatcher adoptView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				adoptView.forward(req, res);
				return;
			}else if(ntf_src_id.matches(type_donate)) {
				RequestDispatcher donateView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				donateView.forward(req, res);
				return;
			}else if(ntf_src_id.matches(type_product)) {
				RequestDispatcher productView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				productView.forward(req, res);
				return;
			}else if(ntf_src_id.matches(type_order)) {
				RequestDispatcher orderView = 
						req.getRequestDispatcher("/back-end/members/select_page.jsp");
				orderView.forward(req, res);
				return;
			}
			
			
		}
	}
}

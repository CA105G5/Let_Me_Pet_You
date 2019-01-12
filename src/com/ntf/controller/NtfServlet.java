package com.ntf.controller;

import java.io.IOException;

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
			
			String type_rescue = "[R]\\d{9,14}";
			if(ntf_src_id.matches(type_rescue)) {
				System.out.println("rescue");
			}
			
			
		}
	}
}

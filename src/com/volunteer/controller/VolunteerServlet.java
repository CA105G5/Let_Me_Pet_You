package com.volunteer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class VolunteerServlet extends HttpServlet{


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action =req.getParameter("action");
		
		
		
		 
		
	}
	
	

}

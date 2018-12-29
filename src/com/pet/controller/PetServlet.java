package com.pet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemVO;

public class PetServlet extends HttpServlet{ 
	private static final long serialVersionUID = -1115382316914923109L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		MemVO memVO = (MemVO)session.getAttribute("memVO");
		if("select_pet".equals(action)) {
			RequestDispatcher successView = 
					req.getRequestDispatcher("/front-end/pet/listAllPets.jsp");
			successView.forward(req, res);	
		}
		
	}
}

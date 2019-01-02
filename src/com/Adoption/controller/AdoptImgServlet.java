package com.Adoption.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Adoption.model.AdoptionService;
import com.missingCase.model.missingCaseService;

public class AdoptImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
	
		String adopt_id = req.getParameter("adopt_id");
		AdoptionService AdoptionSvc = new AdoptionService();
		byte[] pic = AdoptionSvc.getOneAdopt(adopt_id).getAdopt_img();
//		if(pic != null) {
//			pic = ImageUtil.shrink(pic, 200);
//			res.setContentType("image/gif");
//			res.setContentLength(pic.length);
//		}
		
		out.write(pic);
		out.close();
	}

}

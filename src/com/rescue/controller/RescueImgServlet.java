package com.rescue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rescue.model.RescueService;

public class RescueImgServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
		String rsc_id = req.getParameter("rsc_id");
		RescueService rescueSvc = new RescueService();
		byte[] pic = rescueSvc.getOneRescue(rsc_id).getRsc_img();
		if(pic != null) {
//			pic = ImageUtil.shrink(pic,200);	
			res.setContentType("image/jpeg");
			res.setContentLength(pic.length);
		}
		out.write(pic);
		out.close();
		
	}
}

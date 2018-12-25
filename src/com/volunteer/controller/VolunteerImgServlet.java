package com.volunteer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.volunteer.model.VolunteerService;

import util.ImageUtil;
 
public class VolunteerImgServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
		String vlt_id = req.getParameter("vlt_id");
		VolunteerService volunteerSvc = new VolunteerService();
		byte[] pic = volunteerSvc.getOneVolunteer(vlt_id).getVlt_img();
		if(pic != null) {
//			pic = ImageUtil.shrink(pic,200);	
			res.setContentType("image/jpeg");
			res.setContentLength(pic.length);
		}
		out.write(pic);
		out.close();
		
	}
	
}

package com.volunteer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.volunteer.model.VolunteerService;

public class VolunteerImgServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String vlt_id = req.getParameter("vlt_id");
		VolunteerService volunteerSvc = new VolunteerService();
		byte[] pic = volunteerSvc.getOneVolunteer(vlt_id).getVlt_img();
		
		ServletOutputStream out = res.getOutputStream();
		res.setContentLength(pic.length);
		res.setContentType("image/*");
		out.write(pic);
		out.close();
		
	}
	
}

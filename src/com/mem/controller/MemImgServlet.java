package com.mem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;

import util.ImageUtil;
@WebServlet("/MemImgServlet")
public class MemImgServlet extends HttpServlet {
	private static final long serialVersionUID = -7556418336636447483L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
		String memb_id = req.getParameter("memb_id");
		MemService memsvc = new MemService();
		byte[] pic = memsvc.getOneMem(memb_id).getMemb_photo();
		if(pic != null) {
			pic = ImageUtil.shrink(pic,200);	
			res.setContentType("image/gif");
			res.setContentLength(pic.length);
		}
		out.write(pic);
		out.close();
		
	}
}

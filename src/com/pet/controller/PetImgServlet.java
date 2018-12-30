package com.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.model.PetService;

import util.ImageUtil;

public class PetImgServlet extends HttpServlet {
	private static final long serialVersionUID = 8796416148021671346L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
		String pet_id = req.getParameter("pet_id");
		PetService petSvc = new PetService();
		byte[] pic = petSvc.getOnePet(pet_id).getPet_photo();
		if(pic != null) {
			pic = ImageUtil.shrink(pic,200);	
			res.setContentType("image/gif");
			res.setContentLength(pic.length);
		}
		out.write(pic);
		out.close();
	
	}
	
}

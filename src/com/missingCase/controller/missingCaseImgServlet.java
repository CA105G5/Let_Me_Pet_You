package com.missingCase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.missingCase.model.missingCaseService;

import util.ImageUtil;

@WebServlet("/missingCaseImgServlet")
public class missingCaseImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletOutputStream out = res.getOutputStream();
	
		String missingcaseno = req.getParameter("missingcaseno");
		missingCaseService missingCaseSvc = new missingCaseService();
		byte[] pic = missingCaseSvc.getOneMissingCase(missingcaseno).getMissing_photo();
		if(pic != null) {
			pic = ImageUtil.shrink(pic, 200);
			res.setContentType("image/gif");
			res.setContentLength(pic.length);
		}
		
		out.write(pic);
		out.close();
	}

}

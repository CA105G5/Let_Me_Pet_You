package com.volunteer.android.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.volunteer.model.VolunteerDAO_interface;
import com.volunteer.model.VolunteerJDBCDAO;
import com.volunteer.model.VolunteerVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class VolunteerServlet extends HttpServlet {
	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		System.out.println("input: " + jsonIn);
		VolunteerDAO_interface vltDao = new VolunteerJDBCDAO();
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString(); 

		
		if ("isVltMail".equals(action)) {  
			String vlt_mail = jsonObject.get("vlt_mail").getAsString();
			String vlt_psw = jsonObject.get("vlt_psw").getAsString();
			writeText(res,	String.valueOf(vltDao.isVltMail(vlt_mail, vlt_psw)));
		} else if ("isVltExist".equals(action)) {
			String vlt_mail = jsonObject.get("vlt_mail").getAsString();
			writeText(res, String.valueOf(vltDao.isVltExist(vlt_mail)));
		}else if ("rescueByVlt".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			String vlt_id = jsonObject.get("vlt_id").getAsString();
			writeText(res, String.valueOf(vltDao.rescueByVlt(rsc_id, vlt_id)));
//		} else if (action.equals("insert")) {
//			MemVO memVO = gson.fromJson(jsonObject.get("memVO").getAsString(), MemVO.class);
//			writeText(res, String.valueOf(MemDao.insert(memVO)));
//
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	private void writeText(HttpServletResponse res, String outText) throws IOException {
		res.setContentType(CONTENT_TYPE);
		PrintWriter out = res.getWriter();
		out.print(outText);
		out.close();
		System.out.println("outText: " + outText);

	}
}

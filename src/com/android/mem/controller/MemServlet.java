package com.android.mem.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemDAO_interface;
import com.mem.model.MemJDBCDAO;
import com.mem.model.MemVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class MemServlet extends HttpServlet {
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
		MemDAO_interface MemDao = new MemJDBCDAO();
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();

		
		if ("isMemACC".equals(action)) { 
			String memb_acc = jsonObject.get("memb_acc").getAsString();
			String memb_psw = jsonObject.get("memb_psw").getAsString();
			writeText(res,	String.valueOf(MemDao.isMemAcc(memb_acc, memb_psw)));
		} else if ("isMembExist".equals(action)) {
			String memb_acc = jsonObject.get("memb_acc").getAsString();
			writeText(res, String.valueOf(MemDao.isMembExist(memb_acc)));
//		}else if ("isMembAccExist".equals(action)) {
//			String memb_acc = jsonObject.get("memb_acc").getAsString();
//			writeText(res, String.valueOf(MemDao.isMembAccExist(memb_acc)));
//		} else if (action.equals("insert")) {
//			MemVO memVO = gson.fromJson(jsonObject.get("memVO").getAsString(), MemVO.class);
//			writeText(res, String.valueOf(MemDao.insert(memVO)));
//		} else if (action.equals("findByPrimaryKey")) {
//			String memb_id = jsonObject.get("memb_id").getAsString();
//			MemVO memVO = MemDao.findByPrimaryKey(memb_id);
//			writeText(res, memVO == null ? "" : gson.toJson(memVO));
//		} else if (action.equals("updateFromClient")) {
//			MemVO memVO = gson.fromJson(jsonObject.get("memVO").getAsString(), MemVO.class);
//			writeText(res, String.valueOf(MemDao.updateFromClient(memVO)));
//		} else if (action.equals("delete")) {
//			String memb_id = jsonObject.get("memb_id").getAsString();
//			writeText(res, String.valueOf(MemDao.delete(memb_id)));
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

package com.region.android.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.region.model.RegionDAO_interface;
import com.region.model.RegionJDBCDAO;
import com.rescue.model.RescueDAO_interface;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;

import util.ImageUtil;



public class RegionServlet extends HttpServlet {
	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ServletContext context = getServletContext();
		RegionDAO_interface regionDao = new RegionJDBCDAO();
		Gson gson = new Gson();

		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		System.out.println("input: " + jsonIn);
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		
		System.out.println(jsonObject.toString());
		String action = jsonObject.get("action").getAsString();
		
		if("getAll".equals(action)) {
			writeText(res, gson.toJson(regionDao.getAll()));
		}

		
	}

	private void writeText(HttpServletResponse res, String outText) throws IOException {
		res.setContentType(CONTENT_TYPE);
		PrintWriter out = res.getWriter();
		out.print(outText);
		out.close();
		System.out.println("outText: " + outText);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RescueDAO_interface rescueDao = new RescueJDBCDAO();
		List<RescueVO> rescueList = rescueDao.getAll();
		writeText(res, new Gson().toJson(rescueList));
	} 
}

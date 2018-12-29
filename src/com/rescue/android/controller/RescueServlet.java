package com.rescue.android.controller;

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
import com.rescue.model.RescueDAO_interface;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;

import util.ImageUtil;



public class RescueServlet extends HttpServlet {
	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ServletContext context = getServletContext();
		RescueDAO_interface rescueDao = new RescueJDBCDAO();
		Gson gson = new Gson();

		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		System.out.println("input: " + jsonIn);
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();

		if ("getAll".equals(action)) {
			List<RescueVO> rescuecase = rescueDao.getAll();
			writeText(res, gson.toJson(rescuecase));
		} else if ("findByPrimaryKey".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			writeText(res, gson.toJson(rescueDao.findByPrimaryKey(rsc_id)));
		}else if ("addcase".equals(action)) {
			RescueVO rescueVO = gson.fromJson(jsonObject.get("Rescue").getAsString(), RescueVO.class);
			writeText(res, String.valueOf(rescueDao.addCase(rescueVO)));
		}else if ("updatecase".equals(action)) {
			RescueVO rescueVO = gson.fromJson(jsonObject.get("rescueVO").getAsString(), RescueVO.class);
			writeText(res, String.valueOf(rescueDao.updateCase(rescueVO)));
			// 圖片請求
		} else if ("getImage".equals(action)) {
			OutputStream os = res.getOutputStream();
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt();
			byte[] image = rescueDao.getImage(rsc_id);
			if (image != null) {
				// 縮圖 in server side
				image = ImageUtil.shrink(image, imageSize);
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
			}
			os.write(image);

		} else {
			writeText(res, "");
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
		List<RescueVO> rescuecase = rescueDao.getAll();
		writeText(res, new Gson().toJson(rescuecase));
	} 
}

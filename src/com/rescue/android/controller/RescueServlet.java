package com.rescue.android.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.buf.Utf8Encoder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.rescue.model.RescueAndroid;
import com.rescue.model.RescueDAO_interface;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;
import com.sun.javafx.scene.layout.region.Margins.Converter;
import com.sun.media.jfxmedia.track.Track.Encoding;

import util.ImageUtil;



public class RescueServlet extends HttpServlet {
	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ServletContext context = getServletContext();
		RescueDAO_interface rescueDao = new RescueJDBCDAO();
		Gson gson = new Gson();

		BufferedReader br = req.getReader();
		StringBuilder jsonIn = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		
		String action =null;
		JsonObject jsonObject= null;
		try {
			System.out.println("input: " + jsonIn);
			jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
			System.out.println(jsonObject.toString());
			action = jsonObject.get("action").getAsString();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		RescueAndroid rescueAndroid = null;
		try {
			rescueAndroid = gson.fromJson(jsonIn.toString(), RescueAndroid.class);
			action = rescueAndroid.getAction();
			System.out.println(action);
			System.out.println("cross here");
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		if ("getAllRescue".equals(action)) {
			List<RescueVO> rescueList = rescueDao.getAllRescue();
			writeText(res,gson.toJson(rescueList));
		} else if ("findByPrimaryKey".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			RescueVO rescueVO = rescueDao.findByPrimaryKey(rsc_id);
			rescueVO.setRsc_img(null);
			writeText(res, gson.toJson(rescueVO));
		}else if ("addCase".equals(action)) { 
			RescueVO rescueVO = rescueAndroid.getRescue();
			String base64 = rescueAndroid.getRsc_img();
			byte[] byte2 = Base64.getMimeDecoder().decode(base64);	
			rescueVO.setRsc_img(byte2);
			System.out.println("Cross 2");
			writeText(res, String.valueOf(rescueDao.addCase(rescueVO)));
		}else if ("updateCase".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			String rscing_ptcp = jsonObject.get("rscing_ptcp").getAsString();
			System.out.println(rscing_ptcp);
			writeText(res, String.valueOf(rescueDao.updateCase(rsc_id,rscing_ptcp)));
		}else if ("updatCaseVolunteer".equals(action)) {
			
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
		}
			
//		}else if ("sendImage".equals(action)) {
//			byte[] rsc_img = Base64.getDecoder().decode(jsonObject.get("rsc_img").getAsString().getBytes())));
//			System.out.println(rsc_img);
//			
//
//		} 
		else {
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
		List<RescueVO> rescueList = rescueDao.getAll();
		writeText(res, new Gson().toJson(rescueList));
	} 
}

package com.Adoption.android.controller;

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

import com.Adoption.model.AdoptionDAO_Interface;
import com.Adoption.model.AdoptionJDBCDAO;
import com.Adoption.model.AdoptionVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mem.model.MemDAO_interface;
import com.mem.model.MemJDBCDAO;
import com.mem.model.MemVO;
import com.rescue.model.RescueAndroid;
import com.rescue.model.RescueDAO_interface;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;
import com.sun.javafx.scene.layout.region.Margins.Converter;
import com.sun.media.jfxmedia.track.Track.Encoding;

import util.ImageUtil;



public class AdoptionServlet extends HttpServlet { 
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
		AdoptionDAO_Interface adoptionDAO = new AdoptionJDBCDAO();
		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);
		String action = jsonObject.get("action").getAsString();

		
		if ("getAllAdoption".equals(action)) {  
			List<AdoptionVO> adoptionList = adoptionDAO.getAllAdoption();
			writeText(res,gson.toJson(adoptionList));
		}else if ("getImage".equals(action)) {
			OutputStream os = res.getOutputStream();
			String adoptphoto = jsonObject.get("adopt_id").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt();
			byte[] image = adoptionDAO.getImage(adoptphoto);
			if (image != null) {
				// 縮圖 in server side 
				image = ImageUtil.shrink(image, imageSize);
				res.setContentType("image/jpeg");
				res.setContentLength(image.length);
			}
			os.write(image);
		} else {
			writeText(res,"");
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
		AdoptionDAO_Interface adoptionDAO = new AdoptionJDBCDAO();
		List<AdoptionVO> adoptionList = adoptionDAO.getAll();
		writeText(res, new Gson().toJson(adoptionList));
	} 
}

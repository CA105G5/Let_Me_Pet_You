package com.rescuing.android.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.parser.Token;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.rescue.model.RescueDAO_interface;
import com.rescue.model.RescueJDBCDAO;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingDAO_interface;
import com.rescuing.model.RescuingJDBCDAO;
import com.rescuing.model.RescuingVO;

import util.ImageUtil;


 
public class RescuingServlet extends HttpServlet {
	private final static String CONTENT_TYPE = "text/html; charset=UTF-8";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ServletContext context = getServletContext();
		RescuingDAO_interface rescuingDao = new RescuingJDBCDAO();
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

		if ("getRescuingMember".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			writeText(res, new Gson().toJson(rescuingDao.getRescuingMember(rsc_id)));
		} else if ("joinRescuing".equals(action)) {
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			String rscing_ptcp = jsonObject.get("rscing_ptcp").getAsString();
			writeText(res, String.valueOf(rescuingDao.joinRescuing(rsc_id, rscing_ptcp)));
		}else if ("updateDoneReport".equals(action)) { 
			String rsc_id = jsonObject.get("rsc_id").getAsString();
			String rscing_ptcp = jsonObject.get("rscing_ptcp").getAsString();
			String rscing_cdes = jsonObject.get("rscing_cdes").getAsString();
			String doneRescueMemslist = jsonObject.get("doneRescueMemslist").getAsString();
			Type type = new TypeToken<List<String>>() {}.getType();
			List<String> Memblist = gson.fromJson(doneRescueMemslist, type);
			writeText(res, String.valueOf(rescuingDao.updateDoneReport(rsc_id, rscing_ptcp, rscing_cdes, Memblist)));
//		}else if ("updateCase".equals(action)) {
//			String rsc_id = jsonObject.get("rsc_id").getAsString();
//			writeText(res, String.valueOf(rescueDao.updateCase(rsc_id)));
			// 圖片請求
//		} else if ("getImage".equals(action)) {
//			OutputStream os = res.getOutputStream();
//			String rsc_id = jsonObject.get("rsc_id").getAsString();
//			int imageSize = jsonObject.get("imageSize").getAsInt();
//			byte[] image = rescuingDao.getImage(rsc_id);
//			if (image != null) {
//				// 縮圖 in server side
//				image = ImageUtil.shrink(image, imageSize);
//				res.setContentType("image/jpeg");
//				res.setContentLength(image.length);
//		}
//			os.write(image);

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
		List<RescueVO> rescueList = rescueDao.getAll();
		writeText(res, new Gson().toJson(rescueList));
	} 
}

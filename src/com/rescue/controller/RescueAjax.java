package com.rescue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.volunteer.model.VolunteerService;
import com.volunteer.model.VolunteerVO;

import util.Send;




public class RescueAjax extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		String action = req.getParameter("action");
		System.out.println(action);
		
		if ("getChange".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				String rsc_id = req.getParameter("rsc_id");
				String vlt_id = req.getParameter("vlt_id");
				
				VolunteerService vltSvc = new VolunteerService();
				VolunteerVO vltVO = vltSvc.getOneVolunteer(vlt_id);
				
				
				RescueVO rescueVO = new RescueVO();
				rescueVO.setRsc_id(rsc_id);
				rescueVO.setVlt_id(vlt_id);
				rescueVO.setRsc_sta("分派給志工");
				rescueVO.setNtf_vlt_dt("你有一份救援任務，請盡速完成!!!");
				rescueVO.setNtf_vlt_sta("未讀");
				rescueVO.setNtf_vlt_time(new Timestamp(new Date().getTime()));
				Send se = new Send();
				System.out.println(cellMinusDash(vltVO.getVlt_tel()));
			 	String[] tel ={cellMinusDash(vltVO.getVlt_tel())};
			 	String message = "You have a rescue mission, complete it as soon as possible!";
			 	
			 	se.sendMessage(tel , message);
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RescueService rescueSvc = new RescueService();
				rescueSvc.updateByManager(rescueVO);


			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
				failureView.forward(req, res);

			}

		}
	
	
	}
	public static String cellMinusDash(String a) {
		String[] b = a.split("-");
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i<b.length;i++) {
			sb.append(b[i]);
		}
		return sb.toString();
	}
}

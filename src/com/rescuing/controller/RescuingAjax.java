package com.rescuing.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingService;

public class RescuingAjax extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println(action);
		
	
		if ("doneRscPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {

				String rsc_id = req.getParameter("rsc_id");
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/rescue/back_done_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
			   RescueService rescueSvc = new RescueService();
			   RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
			   
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/rescue/back_done_rescue.jsp");
				failureView.forward(req, res);

			}

		}
		
		if ("doneRscNoPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			JSONArray array = new JSONArray();
			try {

				String rsc_id = req.getParameter("rsc_id");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				

			
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/rescue/back_delayed_rescue.jsp");
				failureView.forward(req, res);

			}

		}
	
	
	}
}

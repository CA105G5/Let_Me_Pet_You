package com.rescuing.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.rescuing.model.RescuingVO;

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
							.getRequestDispatcher("/back-end/rescue/back_done_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
			   RescueService rescueSvc = new RescueService();
			   RescueVO rescueVO = rescueSvc.getOneRescue(rsc_id);
			   RescuingService rescuingSvc = new RescuingService();
			   rescuingSvc.updateByManagerPass(rescueVO);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/rescue/back_done_rescue.jsp");
				failureView.forward(req, res);

			}

		}
		
		if ("doneRscNoPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {

				String rsc_id = req.getParameter("rsc_id");
				String rscing_rv_des = req.getParameter("rscing_rv_des");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/rescue/back_done_rescue.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				 RescuingService rescuingSvc = new RescuingService();
				 rescuingSvc.updateByManagerNoPass(rsc_id,rscing_rv_des);

			
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/rescue/back_done_rescue.jsp");
				failureView.forward(req, res);

			}

		}
		if ("doneReport".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("111"+req.getParameter("rsc_id"));
			System.out.println("222"+req.getParameter("rscing_cdes"));
			System.out.println("333"+req.getParameterValues("rscing_ptcp[]"));
			System.out.println("444"+req.getParameter("reporter"));
			

			try {
				String rsc_id = req.getParameter("rsc_id");
				String rscing_cdes = req.getParameter("rscing_cdes");
				
				ArrayList<String>  doneRescueMemslist = new ArrayList<String>();
				if(req.getParameterValues("rscing_ptcp[]")!=null) {
				String[] rscing_ptcps = req.getParameterValues("rscing_ptcp[]");
				System.out.println("length"+rscing_ptcps.length);
					for (int i = 0; i <rscing_ptcps.length; i++){
						doneRescueMemslist.add(rscing_ptcps[i]);
					}
				}
				System.out.println("list"+doneRescueMemslist);
				System.out.println("cdes"+rscing_cdes);
				String reporter = req.getParameter("reporter");
			
				RescuingVO rescuingVO = new RescuingVO();
				rescuingVO.setRsc_id(rsc_id);
				rescuingVO.setRscing_ptcp(reporter);
				rescuingVO.setRscing_ctime(new Timestamp(new Date().getTime()));
				rescuingVO.setRscing_sta("完成案例送審中");
				rescuingVO.setRscing_cdes(rscing_cdes);
				
				
				
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/rescue/rescueReport.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				 RescuingService rescuingSvc = new RescuingService();
				 rescuingSvc.updateDoneReport(rescuingVO, doneRescueMemslist);

			
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/rescue/rescueReport.jsp");
				failureView.forward(req, res);

			}

		}
	
	}
}

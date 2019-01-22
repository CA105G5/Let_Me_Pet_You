package com.rscRt.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rescue.model.RescueService;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingService;
import com.rscRt.model.RscRtService;

public class RscRtAjax extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		System.out.println(action);
		
	
		if ("rscRtPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {

				String rsc_rt_id = req.getParameter("rsc_rt_id");
				
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/rescue/back_rescueRt.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
			   RscRtService rscrtSvc = new RscRtService();
			   String rsc_id = rscrtSvc.getOneRscRt(rsc_rt_id).getRsc_id();
			   rscrtSvc.updateByPassRt(rsc_rt_id, rsc_id);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/rescue/back_rescueRt.jsp");
				failureView.forward(req, res);

			}

		}
		
		if ("RscRtNoPass".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {

				String rsc_rt_id = req.getParameter("rsc_rt_id");
				String rsc_rv_des = req.getParameter("rsc_rv_des");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/rescue/back_rescueRt.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RscRtService rscrtSvc = new RscRtService();
				String rsc_id = rscrtSvc.getOneRscRt(rsc_rt_id).getRsc_id();
				String memb_id = rscrtSvc.getOneRscRt(rsc_rt_id).getMemb_id();
				rscrtSvc.updateByNoPassRt(rsc_rt_id, rsc_rv_des, rsc_id, memb_id);
			
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/rescue/back_rescueRt.jsp");
				failureView.forward(req, res);

			}

		}
	}
}
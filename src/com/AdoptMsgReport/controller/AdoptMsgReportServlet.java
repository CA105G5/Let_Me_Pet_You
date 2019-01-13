package com.AdoptMsgReport.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AdoptMsgReport.moedl.AdoptMsgReportService;
import com.AdoptMsgReport.moedl.AdoptMsgReportVO;

public class AdoptMsgReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String adopt_msg_id = req.getParameter("adopt_msg_id");
				String memb_id = req.getParameter("memb_id");
				String adopt_msg_rt_comm = req.getParameter("adopt_msg_rt_comm");
				String adopt_id = req.getParameter("adopt_id");

				if (adopt_msg_rt_comm == null || adopt_msg_rt_comm.trim().length() == 0) {
					errorMsgs.add("請輸入檢舉理由");
				}

				AdoptMsgReportVO adoptMsgReportVO = new AdoptMsgReportVO();
				adoptMsgReportVO.setAdopt_msg_id(adopt_msg_id);
				adoptMsgReportVO.setMemb_id(memb_id);
				adoptMsgReportVO.setAdopt_msg_rt_comm(adopt_msg_rt_comm);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adoptMsgReportVO", adoptMsgReportVO); // 含有輸入格式錯誤的reportMissingVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(
							"http://localhost:8081/CA105G5/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="
									+ adopt_id);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				AdoptMsgReportService AdoptMsgSvc = new AdoptMsgReportService();
				adoptMsgReportVO = AdoptMsgSvc.addAdoptMsgReport(adopt_msg_id, memb_id, adopt_msg_rt_comm);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "http://localhost:8081/CA105G5/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="
						+ adopt_id;
				res.sendRedirect(url);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listOneAdopt.jsp");
				failureView.forward(req, res);

			}

		}
		if ("changeStatus".equals(action)) {
			try {
				String adopt_msg_rt_status = req.getParameter("adopt_msg_rt_status");
				String adopt_msg_rt_id = req.getParameter("adopt_msg_rt_id");
				System.out.println(adopt_msg_rt_status);
				System.out.println(adopt_msg_rt_id);
				AdoptMsgReportService adoptMsgSvc = new AdoptMsgReportService();
				adoptMsgSvc.updateStatus(adopt_msg_rt_status, adopt_msg_rt_id);
				System.out.println("??????????????????????");

				String url = "/back-end/Adopt/AdoptMsgReport.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/Adopt/AdoptMsgReport.jsp");
				failureView.forward(req, res);
			}

		}

	}

}

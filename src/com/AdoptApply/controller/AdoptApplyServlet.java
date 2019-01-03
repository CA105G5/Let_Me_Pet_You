package com.AdoptApply.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AdoptApply.model.AdoptApplyService;
import com.AdoptApply.model.AdoptApplyVO;

public class AdoptApplyServlet extends HttpServlet {
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
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String memb_id = req.getParameter("memb_id");
				String adopt_id = req.getParameter("adopt_id");

				String adopt_des = req.getParameter("adopt_des");

				System.out.println(memb_id);
				System.out.println(adopt_id);
				System.out.println(adopt_des);
				if (adopt_des == null || adopt_des.trim().length() == 0) {
					errorMsgs.add("申請理由請勿空白");
				}

				AdoptApplyVO adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setAdopt_des(adopt_des);
				adoptApplyVO.setAdopt_id(adopt_id);
				adoptApplyVO.setMemb_id(memb_id);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adoptApplyVO", adoptApplyVO); // 含有輸入格式錯誤的missingCaseVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher(
							"http://localhost:8081/CA105G5/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="
									+ adopt_id);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				System.out.println("988889898898989898");
				AdoptApplyService adoptApplySvc = new AdoptApplyService();
				adoptApplyVO = adoptApplySvc.addApply(memb_id, adopt_id, adopt_des);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "http://localhost:8081/CA105G5/front-end/adopt/adoptionServlet.do?action=getOne_For_Display&adopt_id="
						+ adopt_id;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listOneAdopt
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listAllAdopt.jsp");
				failureView.forward(req, res);
			}

		}
		if ("getChange".equals(action)) {
			String adopt_id = req.getParameter("adopt_id");
			String adopt_id_status = req.getParameter("adopt_id_status");
			String memb_id = req.getParameter("memb_id");

			if ("通過".equals(adopt_id_status)) {
				AdoptApplyVO adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setAdopt_id_status(adopt_id_status);

				AdoptApplyService adoptApplySvc = new AdoptApplyService();
				adoptApplyVO = adoptApplySvc.changetStatus(adopt_id, adopt_id_status, memb_id);

			} else if ("不通過".equals(adopt_id_status)) {
				AdoptApplyVO adoptApplyVO = new AdoptApplyVO();
				adoptApplyVO.setAdopt_id_status(adopt_id_status);

				AdoptApplyService adoptApplySvc = new AdoptApplyService();
				adoptApplyVO = adoptApplySvc.changetStatus(adopt_id, adopt_id_status, memb_id);

			}
		}

	}

}

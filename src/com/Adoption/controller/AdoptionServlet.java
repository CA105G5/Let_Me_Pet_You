package com.Adoption.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.Adoption.model.AdoptionService;
import com.Adoption.model.AdoptionVO;

@MultipartConfig
public class AdoptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String adopt_id = req.getParameter("adopt_id");
				if (adopt_id == null || (adopt_id.trim()).length() == 0) {
					errorMsgs.add("請輸入案例編號~");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listAllAdopt.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				try {
					adopt_id = new String(adopt_id);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listAllAdopt.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/

				AdoptionService adoptionSvc = new AdoptionService();
				AdoptionVO adoptionVO = adoptionSvc.getOneAdopt(adopt_id);
				if (adoptionVO == null) {
					errorMsgs.add("查無資料!");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listAllAdopt.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("adoptionVO", adoptionVO);
				String url = "/front-end/adopt/listOneAdopt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/adopt/listAllAdopt.jsp");
				failureView.forward(req, res);
				return;
			}

		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String adopt_sponsor = req.getParameter("adopt_sponsor");
				String adopt_des = req.getParameter("adopt_des");
				String adopt_species = req.getParameter("adopt_species");
				if (adopt_des == null || adopt_des.trim().length() == 0) {
					errorMsgs.add("失蹤內容請勿空白");
				}

				System.out.println(adopt_sponsor);
				System.out.println(adopt_des);
				System.out.println(adopt_species);
				Part part = req.getPart("adopt_img");
				if (req.getPart("adopt_img").getSubmittedFileName() == null
						|| req.getPart("adopt_img").getSubmittedFileName().length() == 0
						|| req.getPart("adopt_img").getContentType() == null) {
					errorMsgs.add("請上傳照片");
				}
				InputStream is = part.getInputStream();
				byte[] adopt_img = transbyte(is);
				System.out.println(adopt_img);

				AdoptionVO adoptionVO = new AdoptionVO();
				adoptionVO.setAdopt_sponsor(adopt_sponsor);
				adoptionVO.setAdopt_des(adopt_des);
				adoptionVO.setAdopt_img(adopt_img);
				adoptionVO.setAdopt_des(adopt_des);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adoptionVO", adoptionVO); // 含有輸入格式錯誤的missingCaseVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/addAdopt.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				System.out.println("22222222222222222222");
				AdoptionService adoptionSvc = new AdoptionService();
				adoptionVO = adoptionSvc.addAdoption(adopt_species, adopt_sponsor, adopt_des, adopt_img);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/adopt/listAllAdopt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllMissingCase.jsp
				successView.forward(req, res);
				return;

			} catch (Exception e) {
				System.out.println(req.getPart("adopt_img"));
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/adopt/listAllAdopt.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { 
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String adopt_id = req.getParameter("adopt_id");
				/*************************** 2.開始查詢資料 ****************************************/
				AdoptionService adoptionSvc = new AdoptionService();
				AdoptionVO adoptionVO = adoptionSvc.getOneAdopt(adopt_id);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("adoptionVO",adoptionVO);
				String url = "/front-end/adopt/update_adopt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/

			}catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listAllAdopt.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("changeStatus".equals(action)) { 
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String adopt_id = req.getParameter("adopt_id");
				String adopt_apply_status = req.getParameter("adopt_apply_status");
				String adopt_status = req.getParameter("adopt_status");
				System.out.println(adopt_apply_status);
				/*************************** 2.開始查詢資料 ****************************************/
				AdoptionService adoptionSvc = new AdoptionService();
				adoptionSvc.changeStatus(adopt_id, adopt_apply_status, adopt_status);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				String url = "back-end/Adopt/listAllAdopt.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				res.sendRedirect(url);
				/*************************** 其他可能的錯誤處理 **********************************/
				
			}catch (Exception e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/Adopt/listAllAdopt.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

	public static final byte[] transbyte(InputStream inStream) throws IOException {
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[8192];
		int rc = 0;
		while ((rc = inStream.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		byte[] in2b = swapStream.toByteArray();
		return in2b;
	}

}

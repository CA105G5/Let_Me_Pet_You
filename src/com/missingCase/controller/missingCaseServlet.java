package com.missingCase.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.missingCase.model.*;
import com.missingMsg.model.*;

@MultipartConfig
public class missingCaseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
//			 Store this set in the request scope, in case we need to
//			 send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String missing_case_id = req.getParameter("missing_case_id");
				if (missing_case_id == null || (missing_case_id.trim()).length() == 0) {
					errorMsgs.add("請輸入案例編號~");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/missingCase/select_missing_case.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				try {
					missing_case_id = new String(missing_case_id);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/missingCase/select_missing_case.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO missingCaseVO = missingCaseSvc.getOneMissingCase(missing_case_id);
				if (missingCaseVO == null) {
					errorMsgs.add("查無資料");
				}
//				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/missingCase/select_missing_case.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				missingMsgService missingMsgSvc = new missingMsgService();
				List<missingMsgVO> MissingMsgList = missingMsgSvc.findByCase(missing_case_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("missingCaseVO", missingCaseVO); // 資料庫取出的empVO物件,存入req
				String url = "/front-end/missingCase/listOneMissingCase.jsp";
				req.setAttribute("MissingMsgList", MissingMsgList);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/missingCase/select_missing_case.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String membno = req.getParameter("membno");

				String membnoReg = "^[M][0-9]{9}$";
				if (membno == null || membno.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} else if (!membno.trim().matches(membnoReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號只能是M開頭,其餘皆為數字,且長度必須為10");
				}

				String missingName = req.getParameter("missingName").trim();
				String missingNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (missingName == null || missingName.trim().length() == 0) {
					errorMsgs.add("失蹤寵物名稱請勿空白");
				} else if (!missingName.trim().matches(missingNameReg)) { // 以下正則(規)表示式(regular-expression)
					errorMsgs.add("寵物名稱只能是中文或英文");
				}

				java.sql.Timestamp hiredate = null;
				try {
					hiredate = java.sql.Timestamp.valueOf(req.getParameter("hiredate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("請輸入日期!");
				}

				String missingDes = req.getParameter("missingDes");
				if (missingDes == null || missingDes.trim().length() == 0) {
					errorMsgs.add("失蹤內容請勿空白");
				}

				String loc = req.getParameter("loc");
				String loceReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if (loc == null || missingName.trim().length() == 0) {
					errorMsgs.add("失蹤地點請勿空白");
				} else if (!loc.trim().matches(loceReg)) { // 以下正則(規)表示式(regular-expression)
					errorMsgs.add("請輸入正確的地點");
				}
				String missing_status_shelve = null;

				Part part = req.getPart("upfile");
				if (part.getSubmittedFileName().equals(null) && part.getSubmittedFileName().trim().length() == 0) {
					errorMsgs.add("請上傳寵物照片");
				}
				InputStream is = part.getInputStream();
				byte[] missing_photo = transbyte(is);

				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMemb_id(membno);
				missingCaseVO.setMissing_name(missingName);
				missingCaseVO.setMissing_date(hiredate);
				missingCaseVO.setMissing_des(missingDes);
				missingCaseVO.setMissing_loc(loc);
				missingCaseVO.setMissing_status_shelve(missing_status_shelve);
				missingCaseVO.setMissing_photo(missing_photo);

				String missing_type = req.getParameter("missing_type");
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("missingCaseVO", missingCaseVO); // 含有輸入格式錯誤的missingCaseVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/missingCase/addMissing.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.addMissingCase(membno, hiredate, missingDes, missingName, loc, null,
						missing_photo, missing_type);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/missingCase/listAllMissingCase.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllMissingCase.jsp
				successView.forward(req, res);
				return;
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listAllMissingCase.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // 來自listAllMissingCase.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String missing_case_id = req.getParameter("missing_case_id");

				/*************************** 2.開始查詢資料 ****************************************/
				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO missingCaseVO = missingCaseSvc.getOneMissingCase(missing_case_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("missingCaseVO", missingCaseVO);
				String url = "/front-end/missingCase/update_missing_case.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/listAllMissingCase.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_missing_case.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String missing_case_id = req.getParameter("missing_case_id");
				System.out.println(missing_case_id);
				String membno = req.getParameter("membno");

				String membnoReg = "^[M][0-9]{9}$";
				if (membno == null || membno.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} else if (!membno.trim().matches(membnoReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號只能是M開頭,其餘皆為數字,且長度必須為10");
				}

				String missingName = req.getParameter("missingName").trim();
				if (missingName == null || missingName.trim().length() == 0) {
					errorMsgs.add("失蹤寵物名稱請勿空白");
				}

				java.sql.Timestamp hiredate = null;
				try {
					hiredate = java.sql.Timestamp.valueOf(req.getParameter("hiredate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("請輸入日期!");
				}

				String missingDes = req.getParameter("missingDes");
				if (missingDes == null || missingDes.trim().length() == 0) {
					errorMsgs.add("失蹤內容名稱請勿空白");
				}

				String loc = req.getParameter("loc");
				if (loc == null || missingName.trim().length() == 0) {
					errorMsgs.add("失蹤地點請勿空白");
				}
				String missing_status_shelve = null;
				String missing_type = null;
				//照片
				byte[] missing_photo = null;
				Part part = req.getPart("upfile");
				InputStream is = part.getInputStream();
				if (is.available() == 0) {
					missingCaseService missingCaseSvc = new missingCaseService();
					missing_photo = missingCaseSvc.getOneMissingCase(missing_case_id).getMissing_photo();
				} else {
					missing_photo = transbyte(is);
				}
				
				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_case_id(missing_case_id);
				missingCaseVO.setMemb_id(membno);
				missingCaseVO.setMissing_name(missingName);
				missingCaseVO.setMissing_date(hiredate);
				missingCaseVO.setMissing_des(missingDes);
				missingCaseVO.setMissing_loc(loc);
				missingCaseVO.setMissing_status_shelve(missing_status_shelve);
				missingCaseVO.setMissing_photo(missing_photo);
				missingCaseVO.setMissing_type(missing_type);

//					// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("missingCaseVO", missingCaseVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/missingCase/select_missing_case.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 *****************************************/
				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.updateMissingCase(missing_case_id, membno, hiredate, missingDes,
						missingName, loc, missing_status_shelve, missing_photo, missing_type);
				
				
				missingCaseVO = missingCaseSvc.getOneMissingCase(missing_case_id);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("missingCaseVO", missingCaseVO);
				String url = "/front-end/missingCase/listOneMissingCase.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/missingCase/update_missing_case.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String missing_case_id = req.getParameter("missing_case_id");

			/*************************** 2.開始刪除資料 *****************************************/
			missingCaseService missingCaseSvc = new missingCaseService();
			missingCaseSvc.deleteMissingCase(missing_case_id);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/front-end/missingCase/listAllMissingCase.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功轉交回送出刪除的來源網頁
			successView.forward(req, res);
			/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/missingCase/listAllMissingCase.jsp");
//				failureView.forward(req, res);
//			}
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

package com.missingCase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.missingCase.model.*;

public class missingCaseAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		String missing_case_id = req.getParameter("missing_case_id");
		String status = req.getParameter("status");
		if ("getChange".equals(action)) {
			JSONArray array = new JSONArray();

			if ("上架".equals(status)) {
				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_status_shelve(status);

				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.updateStatus(missing_case_id, status);

			} else if ("下架".equals(status)) {
				missingCaseVO missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_status_shelve(status);

				missingCaseService missingCaseSvc = new missingCaseService();
				missingCaseVO = missingCaseSvc.updateStatus(missing_case_id, status);

			}
		}

	}

}

package com.missingCase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.missingCase.model.*;


@WebServlet("/missingCaseAjax")
public class missingCaseAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		String missing_case_id = req.getParameter("missing_case_id");
		
		if("getChange".equals(action)) {
			JSONArray array = new JSONArray();
			
//				missingCaseVO missingCaseVO = new missingCaseVO();
//				missingCaseVO.setMissing_status_shelve(status);
//				
//				missingCaseService missingCaseSvc = new missingCaseService();
//				missingCaseVO = missingCaseSvc.updateStatus(missing_case_id, status);	
//				
			
		}
		
		
	}

}

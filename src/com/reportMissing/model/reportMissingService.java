package com.reportMissing.model;

import java.sql.Timestamp;
import java.util.List;

public class reportMissingService {
	private reportMissingDAO_interface dao;

	public reportMissingService() {
		dao = new reportMissingJNDIDAO();
	}

	public reportMissingVO addReportMissing(String missing_case_id, String memb_id, String report_missing_cont,
			String report_missing_sta, Timestamp report_missing_time) {
		reportMissingVO reportMissingVO = new reportMissingVO();
		reportMissingVO.setMissing_case_id(missing_case_id);
		reportMissingVO.setMemb_id(memb_id);
		reportMissingVO.setReport_missing_cont(report_missing_cont);
		reportMissingVO.setReport_missing_sta(report_missing_sta);
		reportMissingVO.setReport_missing_time(report_missing_time);
		dao.insert(reportMissingVO);
		
		return reportMissingVO;
		
	}
	//全部檢舉
	public List<reportMissingVO> listAllReport(){
		return dao.getAll();
	}
	
	//改檢舉狀態
	public reportMissingVO updateStatus(String report_missing_sta, String report_missing_id) {
		reportMissingVO reportMissingVO = new reportMissingVO();
		reportMissingVO.setReport_missing_sta(report_missing_sta);
		reportMissingVO.setReport_missing_id(report_missing_id);
		dao.updateStatus(reportMissingVO);
		
		return reportMissingVO;
		
	}
}

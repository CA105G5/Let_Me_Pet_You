package com.reportMissing.model;

import java.sql.Timestamp;

public class ReportMissingVO {
	private String report_missing_id;
	private String missing_case_id;
	private String memb_id;
	private String report_missing_cont;
	private String report_missing_sta;
	private Timestamp report_missing_time;

	public String getReport_missing_id() {
		return report_missing_id;
	}

	public void setReport_missing_id(String report_missing_id) {
		this.report_missing_id = report_missing_id;
	}

	public String getMissing_case_id() {
		return missing_case_id;
	}

	public void setMissing_case_id(String missing_case_id) {
		this.missing_case_id = missing_case_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getReport_missing_cont() {
		return report_missing_cont;
	}

	public void setReport_missing_cont(String report_missing_cont) {
		this.report_missing_cont = report_missing_cont;
	}

	public String getReport_missing_sta() {
		return report_missing_sta;
	}

	public void setReport_missing_sta(String report_missing_sta) {
		this.report_missing_sta = report_missing_sta;
	}

	public Timestamp getReport_missing_time() {
		return report_missing_time;
	}

	public void setReport_missing_time(Timestamp report_missing_time) {
		this.report_missing_time = report_missing_time;
	}

}

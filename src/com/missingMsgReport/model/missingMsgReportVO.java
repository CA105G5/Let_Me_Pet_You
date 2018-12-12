package com.missingMsgReport.model;

import java.sql.Timestamp;

public class missingMsgReportVO {
	private String missing_msg_rt_id;
	private String missing_msg_id;
	private String memb_id;
	private String missing_msg_rt_cont;
	private String missing_msg_rt_sta;
	private Timestamp missing_msg_rt_time;

	public String getMissing_msg_rt_id() {
		return missing_msg_rt_id;
	}

	public void setMissing_msg_rt_id(String missing_msg_rt_id) {
		this.missing_msg_rt_id = missing_msg_rt_id;
	}

	public String getMissing_msg_id() {
		return missing_msg_id;
	}

	public void setMissing_msg_id(String missing_msg_id) {
		this.missing_msg_id = missing_msg_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getMissing_msg_rt_cont() {
		return missing_msg_rt_cont;
	}

	public void setMissing_msg_rt_cont(String missing_msg_rt_cont) {
		this.missing_msg_rt_cont = missing_msg_rt_cont;
	}

	public String getMissing_msg_rt_sta() {
		return missing_msg_rt_sta;
	}

	public void setMissing_msg_rt_sta(String missing_msg_rt_sta) {
		this.missing_msg_rt_sta = missing_msg_rt_sta;
	}

	public Timestamp getMissing_msg_rt_time() {
		return missing_msg_rt_time;
	}

	public void setMissing_msg_rt_time(Timestamp missing_msg_rt_time) {
		this.missing_msg_rt_time = missing_msg_rt_time;
	}

}

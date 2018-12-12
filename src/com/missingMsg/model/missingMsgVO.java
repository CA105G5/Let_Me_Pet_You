package com.missingMsg.model;

import java.sql.Timestamp;

public class missingMsgVO {
	private String missing_msg_id;
	private String missing_case_id;
	private String memb_id;
	private Timestamp missing_msg_date;
	private String missing_msg_cont;

	public String getMissing_msg_id() {
		return missing_msg_id;
	}

	public void setMissing_msg_id(String missing_msg_id) {
		this.missing_msg_id = missing_msg_id;
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

	public Timestamp getMissing_msg_date() {
		return missing_msg_date;
	}

	public void setMissing_msg_date(Timestamp missing_msg_date) {
		this.missing_msg_date = missing_msg_date;
	}

	public String getMissing_msg_cont() {
		return missing_msg_cont;
	}

	public void setMissing_msg_cont(String missing_msg_cont) {
		this.missing_msg_cont = missing_msg_cont;
	}

}

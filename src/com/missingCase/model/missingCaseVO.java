package com.missingCase.model;


import java.sql.Timestamp;

public class missingCaseVO {
	private String missing_case_id;
	private String memb_id;
	private Timestamp missing_date;
	private String missing_name;
	private String missing_des;
	private String missing_loc;
	private String missing_status_shelve;
	private byte[] missing_photo;

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

	public Timestamp getMissing_date() {
		return missing_date;
	}

	public void setMissing_date(Timestamp missing_date) {
		this.missing_date = missing_date;
	}

	public String getMissing_name() {
		return missing_name;
	}

	public void setMissing_name(String missing_name) {
		this.missing_name = missing_name;
	}

	public String getMissing_des() {
		return missing_des;
	}

	public void setMissing_des(String missing_des) {
		this.missing_des = missing_des;
	}

	public String getMissing_loc() {
		return missing_loc;
	}

	public void setMissing_loc(String missing_loc) {
		this.missing_loc = missing_loc;
	}

	public String getMissing_status_shelve() {
		return missing_status_shelve;
	}

	public void setMissing_status_shelve(String missing_status_shelve) {
		this.missing_status_shelve = missing_status_shelve;
	}

	public byte[] getMissing_photo() {
		return missing_photo;
	}

	public void setMissing_photo(byte[] missing_photo) {
		this.missing_photo = missing_photo;
	}

}

package com.foundCase.model;

import java.sql.Timestamp;

public class foundCaseVO {
	private String fd_case_id;
	private String memb_id;
	private Timestamp fd_date;
	private String fd_name;
	private String fd_des;
	private String fd_status;
	private String fd_status_rv_des;
	private String fd_loc;
	private String fd_status_shelve;
	private Timestamp fd_etime;
	private byte[] fd_photo;

	public byte[] getFd_photo() {
		return fd_photo;
	}

	public void setFd_case_photo(byte[] fd_photo) {
		this.fd_photo = fd_photo;
	}

	public String getFd_case_id() {
		return fd_case_id;
	}

	public void setFd_case_id(String fd_case_id) {
		this.fd_case_id = fd_case_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public Timestamp getFd_date() {
		return fd_date;
	}

	public void setFd_date(Timestamp fd_date) {
		this.fd_date = fd_date;
	}

	public String getFd_name() {
		return fd_name;
	}

	public void setFd_name(String fd_name) {
		this.fd_name = fd_name;
	}

	public String getFd_des() {
		return fd_des;
	}

	public void setFd_des(String fd_des) {
		this.fd_des = fd_des;
	}

	public String getFd_status() {
		return fd_status;
	}

	public void setFd_status(String fd_status) {
		this.fd_status = fd_status;
	}

	public String getFd_status_rv_des() {
		return fd_status_rv_des;
	}

	public void setFd_status_rv_des(String fd_status_rv_des) {
		this.fd_status_rv_des = fd_status_rv_des;
	}

	public String getFd_loc() {
		return fd_loc;
	}

	public void setFd_loc(String fd_loc) {
		this.fd_loc = fd_loc;
	}

	public String getFd_status_shelve() {
		return fd_status_shelve;
	}

	public void setFd_status_shelve(String fd_status_shelve) {
		this.fd_status_shelve = fd_status_shelve;
	}

	public Timestamp getFd_etime() {
		return fd_etime;
	}

	public void setFd_etime(Timestamp fd_etime) {
		this.fd_etime = fd_etime;
	}

}

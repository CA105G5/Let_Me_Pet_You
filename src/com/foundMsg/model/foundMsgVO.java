package com.foundMsg.model;

import java.sql.Timestamp;

public class foundMsgVO {
	private String fd_msg_id;
	private String fd_case_id;
	private String memb_id;
	private Timestamp fd_msg_date;
	private String fd_msg_cont;

	public String getFd_msg_id() {
		return fd_msg_id;
	}

	public void setFd_msg_id(String fd_msg_id) {
		this.fd_msg_id = fd_msg_id;
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

	public Timestamp getFd_msg_date() {
		return fd_msg_date;
	}

	public void setFd_msg_date(Timestamp fd_msg_date) {
		this.fd_msg_date = fd_msg_date;
	}

	public String getFd_msg_cont() {
		return fd_msg_cont;
	}

	public void setFd_msg_cont(String fd_msg_cont) {
		this.fd_msg_cont = fd_msg_cont;
	}

}

package com.foundMsgReport.model;

import java.sql.Timestamp;

public class foundMsgReportVO {
	private String fd_msg_rt_id;
	private String fd_msg_id;
	private String memb_id;
	private String fd_msg_rt_cont;
	private String fd_msg_rt_sta;
	private Timestamp fd_msg_rt_time;

	public String getFd_msg_rt_id() {
		return fd_msg_rt_id;
	}

	public void setFd_msg_rt_id(String fd_msg_rt_id) {
		this.fd_msg_rt_id = fd_msg_rt_id;
	}

	public String getFd_msg_id() {
		return fd_msg_id;
	}

	public void setFd_msg_id(String fd_msg_id) {
		this.fd_msg_id = fd_msg_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getFd_msg_rt_cont() {
		return fd_msg_rt_cont;
	}

	public void setFd_msg_rt_cont(String fd_msg_rt_cont) {
		this.fd_msg_rt_cont = fd_msg_rt_cont;
	}

	public String getFd_msg_rt_sta() {
		return fd_msg_rt_sta;
	}

	public void setFd_msg_rt_sta(String fd_msg_rt_sta) {
		this.fd_msg_rt_sta = fd_msg_rt_sta;
	}

	public Timestamp getFd_msg_rt_time() {
		return fd_msg_rt_time;
	}

	public void setFd_msg_rt_time(Timestamp fd_msg_rt_time) {
		this.fd_msg_rt_time = fd_msg_rt_time;
	}

}

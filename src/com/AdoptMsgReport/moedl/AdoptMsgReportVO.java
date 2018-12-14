package com.AdoptMsgReport.moedl;

import java.sql.*;

public class AdoptMsgReportVO implements java.io.Serializable {
	
	private static final long serialVersionUID = 666666666L;
	
	private String adopt_msg_rt_id;
	private String adopt_msg_id;
	private String memb_id;
	private java.sql.Timestamp adopt_msg_rt_time;
	private String adopt_msg_rt_comm;
	private String adopt_msg_rv_des;
	private String adopt_msg_rt_status;

	
	public String getAdopt_msg_rt_id() {
		return adopt_msg_rt_id;
	}


	public void setAdopt_msg_rt_id(String adopt_msg_rt_id) {
		this.adopt_msg_rt_id = adopt_msg_rt_id;
	}


	public String getAdopt_msg_id() {
		return adopt_msg_id;
	}


	public void setAdopt_msg_id(String adopt_msg_id) {
		this.adopt_msg_id = adopt_msg_id;
	}


	public String getMemb_id() {
		return memb_id;
	}


	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}


	public java.sql.Timestamp getAdopt_msg_rt_time() {
		return adopt_msg_rt_time;
	}


	public void setAdopt_msg_rt_time(java.sql.Timestamp adopt_msg_rt_time) {
		this.adopt_msg_rt_time = adopt_msg_rt_time;
	}


	public String getAdopt_msg_rt_comm() {
		return adopt_msg_rt_comm;
	}


	public void setAdopt_msg_rt_comm(String adopt_msg_rt_comm) {
		this.adopt_msg_rt_comm = adopt_msg_rt_comm;
	}


	public String getAdopt_msg_rv_des() {
		return adopt_msg_rv_des;
	}


	public void setAdopt_msg_rv_des(String adopt_msg_rv_des) {
		this.adopt_msg_rv_des = adopt_msg_rv_des;
	}


	public String getAdopt_msg_rt_status() {
		return adopt_msg_rt_status;
	}


	public void setAdopt_msg_rt_status(String adopt_msg_rt_status) {
		this.adopt_msg_rt_status = adopt_msg_rt_status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public AdoptMsgReportVO() {
		// TODO Auto-generated constructor stub
	}

}

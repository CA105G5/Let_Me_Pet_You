package com.rscMsgRt.model;

import java.sql.Timestamp;

public class RscMsgRtVO implements java.io.Serializable{
	
	private String rsc_msg_rt_id;
	private String rsc_msg_id;
	private String memb_id;
	private Timestamp rsc_msg_rt_time;
	private String rsc_msg_rt_comm;
	private String rsc_msg_rv_des;
	private String rsc_msg_rt_status;
	public String getRsc_msg_rt_id() {
		return rsc_msg_rt_id;
	}
	public void setRsc_msg_rt_id(String rsc_msg_rt_id) {
		this.rsc_msg_rt_id = rsc_msg_rt_id;
	}
	public String getRsc_msg_id() {
		return rsc_msg_id;
	}
	public void setRsc_msg_id(String rsc_msg_id) {
		this.rsc_msg_id = rsc_msg_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public Timestamp getRsc_msg_rt_time() {
		return rsc_msg_rt_time;
	}
	public void setRsc_msg_rt_time(Timestamp rsc_msg_rt_time) {
		this.rsc_msg_rt_time = rsc_msg_rt_time;
	}
	public String getRsc_msg_rt_comm() {
		return rsc_msg_rt_comm;
	}
	public void setRsc_msg_rt_comm(String rsc_msg_rt_comm) {
		this.rsc_msg_rt_comm = rsc_msg_rt_comm;
	}
	public String getRsc_msg_rv_des() {
		return rsc_msg_rv_des;
	}
	public void setRsc_msg_rv_des(String rsc_msg_rv_des) {
		this.rsc_msg_rv_des = rsc_msg_rv_des;
	}
	public String getRsc_msg_rt_status() {
		return rsc_msg_rt_status;
	}
	public void setRsc_msg_rt_status(String rsc_msg_rt_status) {
		this.rsc_msg_rt_status = rsc_msg_rt_status;
	}

	
}

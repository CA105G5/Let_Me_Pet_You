package com.rscRt.model;

import java.sql.Timestamp;

public class RscRtVO implements java.io.Serializable{

	private String rsc_rt_id;
	private String rsc_id;
	private String memb_id;
	private Timestamp rsc_rt_time;
	private String rsc_rt_comm;
	private String rsc_rv_des;
	private String rsc_rt_status;
	
	public String getRsc_rt_id() {
		return rsc_rt_id;
	}
	public void setRsc_rt_id(String rsc_rt_id) {
		this.rsc_rt_id = rsc_rt_id;
	}
	public String getRsc_id() {
		return rsc_id;
	}
	public void setRsc_id(String rsc_id) {
		this.rsc_id = rsc_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public Timestamp getRsc_rt_time() {
		return rsc_rt_time;
	}
	public void setRsc_rt_time(Timestamp rsc_rt_time) {
		this.rsc_rt_time = rsc_rt_time;
	}
	public String getRsc_rt_comm() {
		return rsc_rt_comm;
	}
	public void setRsc_rt_comm(String rsc_rt_comm) {
		this.rsc_rt_comm = rsc_rt_comm;
	}
	public String getRsc_rv_des() {
		return rsc_rv_des;
	}
	public void setRsc_rv_des(String rsc_rv_des) {
		this.rsc_rv_des = rsc_rv_des;
	}
	public String getRsc_rt_status() {
		return rsc_rt_status;
	}
	public void setRsc_rt_status(String rsc_rt_status) {
		this.rsc_rt_status = rsc_rt_status;
	}
	
}

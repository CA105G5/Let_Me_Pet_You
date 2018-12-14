package com.rscMsg.model;

import java.sql.Timestamp;

public class RscMsgVO implements java.io.Serializable{
	
	private String rsc_msg_id;
	private String rsc_id;
	private String rsc_msg_sper;
	private Timestamp rsc_msg_time;
	private String rsc_msg_comm;
	private String rsc_msg_status;
	
	public String getRsc_msg_id() {
		return rsc_msg_id;
	}
	public void setRsc_msg_id(String rsc_msg_id) {
		this.rsc_msg_id = rsc_msg_id;
	}
	public String getRsc_id() {
		return rsc_id;
	}
	public void setRsc_id(String rsc_id) {
		this.rsc_id = rsc_id;
	}
	public String getRsc_msg_sper() {
		return rsc_msg_sper;
	}
	public void setRsc_msg_sper(String rsc_msg_sper) {
		this.rsc_msg_sper = rsc_msg_sper;
	}
	public Timestamp getRsc_msg_time() {
		return rsc_msg_time;
	}
	public void setRsc_msg_time(Timestamp rsc_msg_time) {
		this.rsc_msg_time = rsc_msg_time;
	}
	public String getRsc_msg_comm() {
		return rsc_msg_comm;
	}
	public void setRsc_msg_comm(String rsc_msg_comm) {
		this.rsc_msg_comm = rsc_msg_comm;
	}
	public String getRsc_msg_status() {
		return rsc_msg_status;
	}
	public void setRsc_msg_status(String rsc_msg_status) {
		this.rsc_msg_status = rsc_msg_status;
	}
	
}

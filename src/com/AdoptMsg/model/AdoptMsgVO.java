package com.AdoptMsg.model;

public class AdoptMsgVO implements java.io.Serializable{

	private static final long serialVersionUID = 1111111L;
	
	public AdoptMsgVO() {
		
	}
	
	private String adopt_msg_id;
	private String adopt_id;
	private String adopt_msg_sper;
	private java.sql.Timestamp adopt_msg_time;
	private String adopt_msg_comm;

	public String getAdopt_msg_id() {
		return adopt_msg_id;
	}
	public void setAdopt_msg_id(String adopt_msg_id) {
		this.adopt_msg_id = adopt_msg_id;
	}
	public String getAdopt_id() {
		return adopt_id;
	}
	public void setAdopt_id(String adopt_id) {
		this.adopt_id = adopt_id;
	}
	public String getAdopt_msg_sper() {
		return adopt_msg_sper;
	}
	public void setAdopt_msg_sper(String adopt_msg_sper) {
		this.adopt_msg_sper = adopt_msg_sper;
	}
	public java.sql.Timestamp getAdopt_msg_time() {
		return adopt_msg_time;
	}
	public void setAdopt_msg_time(java.sql.Timestamp adopt_msg_time) {
		this.adopt_msg_time = adopt_msg_time;
	}
	public String getAdopt_msg_comm() {
		return adopt_msg_comm;
	}
	public void setAdopt_msg_comm(String adopt_msg_comm) {
		this.adopt_msg_comm = adopt_msg_comm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}

package com.ntf.model;

import java.sql.Timestamp;

public class NtfVO implements java.io.Serializable {
	
	private static final long serialVersionUID = -838389874354633192L;
	
	private String ntf_id;
	private String memb_id;
	private String ntf_src_id;
	private String ntf_dt;
	private String ntf_link;
	private String ntf_sta;
	private Timestamp ntf_time;
	
	public String getNtf_id() {
		return ntf_id;
	}
	public void setNtf_id(String ntf_id) {
		this.ntf_id = ntf_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public String getNtf_src_id() {
		return ntf_src_id;
	}
	public void setNtf_src_id(String ntf_src_id) {
		this.ntf_src_id = ntf_src_id;
	}
	public String getNtf_dt() {
		return ntf_dt;
	}
	public void setNtf_dt(String ntf_dt) {
		this.ntf_dt = ntf_dt;
	}
	public String getNtf_link() {
		return ntf_link;
	}
	public void setNtf_link(String ntf_link) {
		this.ntf_link = ntf_link;
	}
	public String getNtf_sta() {
		return ntf_sta;
	}
	public void setNtf_sta(String ntf_sta) {
		this.ntf_sta = ntf_sta;
	}
	public Timestamp getNtf_time() {
		return ntf_time;
	}
	public void setNtf_time(Timestamp ntf_time) {
		this.ntf_time = ntf_time;
	}
}

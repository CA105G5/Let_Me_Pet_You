package com.CurrencyDetail.model;

public class CurDtVO implements java.io.Serializable {
	
	private static final long serialVersionUID = -6266212398319317817L;
	
	private String cur_dt_id;
	private String memb_id;
	private String cur_src_id;
	private String cur_dt;
	
	public String getCur_dt_id() {
		return cur_dt_id;
	}
	public void setCur_dt_id(String cur_dt_id) {
		this.cur_dt_id = cur_dt_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public String getCur_src_id() {
		return cur_src_id;
	}
	public void setCur_src_id(String cur_src_id) {
		this.cur_src_id = cur_src_id;
	}
	public String getCur_dt() {
		return cur_dt;
	}
	public void setCur_dt(String cur_dt) {
		this.cur_dt = cur_dt;
	}
	
}

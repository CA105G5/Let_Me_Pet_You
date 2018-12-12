package com.ord.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class OrdVO implements Serializable {
	
	private	String		ord_id;
	private	String		memb_id;
	private	Timestamp	ord_date;
	private	Integer		ord_total;
	private	String		ord_receiver;
	private	String		ord_rc_tel;
	private	String		ord_rc_add;
	private	String		ord_rc_comm;
	
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public Timestamp getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}
	public Integer getOrd_total() {
		return ord_total;
	}
	public void setOrd_total(Integer ord_total) {
		this.ord_total = ord_total;
	}
	public String getOrd_receiver() {
		return ord_receiver;
	}
	public void setOrd_receiver(String ord_receiver) {
		this.ord_receiver = ord_receiver;
	}
	public String getOrd_rc_tel() {
		return ord_rc_tel;
	}
	public void setOrd_rc_tel(String ord_rc_tel) {
		this.ord_rc_tel = ord_rc_tel;
	}
	public String getOrd_rc_add() {
		return ord_rc_add;
	}
	public void setOrd_rc_add(String ord_rc_add) {
		this.ord_rc_add = ord_rc_add;
	}
	public String getOrd_rc_comm() {
		return ord_rc_comm;
	}
	public void setOrd_rc_comm(String ord_rc_comm) {
		this.ord_rc_comm = ord_rc_comm;
	}
	
	


}

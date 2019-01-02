package com.orditem.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class OrdItemVO implements Serializable {
	
	private	String		prod_id;
	private	String		ord_id;
	private	Integer		ord_item_qty;
	private	String		ord_item_sp_status;
	private	Timestamp	ord_item_sp_date;
	private	String		ord_item_rc_status;
	private	Timestamp	ord_item_rc_date;
	private	String		ord_item_coin_st;
	private	String		ord_item_rt_status;
	private	Timestamp	ord_item_rt_date;
	private	String		ord_item_rt_comm;
	private	String		ord_item_review;
	private	String		ord_item_rv_des;
	private	String		ord_item_rt_pic;
	
	public String getOrd_item_rt_pic() {
		return ord_item_rt_pic;
	}
	public void setOrd_item_rt_pic(String ord_item_rt_pic) {
		this.ord_item_rt_pic = ord_item_rt_pic;
	}
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public Integer getOrd_item_qty() {
		return ord_item_qty;
	}
	public void setOrd_item_qty(Integer ord_item_qty) {
		this.ord_item_qty = ord_item_qty;
	}
	public String getOrd_item_sp_status() {
		return ord_item_sp_status;
	}
	public void setOrd_item_sp_status(String ord_item_sp_status) {
		this.ord_item_sp_status = ord_item_sp_status;
	}
	public Timestamp getOrd_item_sp_date() {
		return ord_item_sp_date;
	}
	public void setOrd_item_sp_date(Timestamp ord_item_sp_date) {
		this.ord_item_sp_date = ord_item_sp_date;
	}
	public String getOrd_item_rc_status() {
		return ord_item_rc_status;
	}
	public void setOrd_item_rc_status(String ord_item_rc_status) {
		this.ord_item_rc_status = ord_item_rc_status;
	}
	public Timestamp getOrd_item_rc_date() {
		return ord_item_rc_date;
	}
	public void setOrd_item_rc_date(Timestamp ord_item_rc_date) {
		this.ord_item_rc_date = ord_item_rc_date;
	}
	public String getOrd_item_coin_st() {
		return ord_item_coin_st;
	}
	public void setOrd_item_coin_st(String ord_item_coin_st) {
		this.ord_item_coin_st = ord_item_coin_st;
	}
	public String getOrd_item_rt_status() {
		return ord_item_rt_status;
	}
	public void setOrd_item_rt_status(String ord_item_rt_status) {
		this.ord_item_rt_status = ord_item_rt_status;
	}
	public Timestamp getOrd_item_rt_date() {
		return ord_item_rt_date;
	}
	public void setOrd_item_rt_date(Timestamp ord_item_rt_date) {
		this.ord_item_rt_date = ord_item_rt_date;
	}
	public String getOrd_item_rt_comm() {
		return ord_item_rt_comm;
	}
	public void setOrd_item_rt_comm(String ord_item_rt_comm) {
		this.ord_item_rt_comm = ord_item_rt_comm;
	}
	public String getOrd_item_review() {
		return ord_item_review;
	}
	public void setOrd_item_review(String ord_item_review) {
		this.ord_item_review = ord_item_review;
	}
	public String getOrd_item_rv_des() {
		return ord_item_rv_des;
	}
	public void setOrd_item_rv_des(String ord_item_rv_des) {
		this.ord_item_rv_des = ord_item_rv_des;
	}

	

}

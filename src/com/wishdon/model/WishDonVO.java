package com.wishdon.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class WishDonVO implements Serializable {
	
	private	String		wish_don_id;
	private	String		wish_id;
	private	String		memb_id;
	private	Integer		wish_don_qty;
	private	Timestamp	wish_don_date;
	private	String		wish_don_sp_status;
	private	Timestamp	wish_don_sp_date;
	private	String		wish_don_rc_status;
	private	Timestamp	wish_don_rc_date;
	private	String		wish_don_coin_st;
	
	
	public String getWish_don_id() {
		return wish_don_id;
	}
	public void setWish_don_id(String wish_don_id) {
		this.wish_don_id = wish_don_id;
	}
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public Integer getWish_don_qty() {
		return wish_don_qty;
	}
	public void setWish_don_qty(Integer wish_don_qty) {
		this.wish_don_qty = wish_don_qty;
	}
	public Timestamp getWish_don_date() {
		return wish_don_date;
	}
	public void setWish_don_date(Timestamp wish_don_date) {
		this.wish_don_date = wish_don_date;
	}
	public String getWish_don_sp_status() {
		return wish_don_sp_status;
	}
	public void setWish_don_sp_status(String wish_don_sp_status) {
		this.wish_don_sp_status = wish_don_sp_status;
	}
	public Timestamp getWish_don_sp_date() {
		return wish_don_sp_date;
	}
	public void setWish_don_sp_date(Timestamp wish_don_sp_date) {
		this.wish_don_sp_date = wish_don_sp_date;
	}
	public String getWish_don_rc_status() {
		return wish_don_rc_status;
	}
	public void setWish_don_rc_status(String wish_don_rc_status) {
		this.wish_don_rc_status = wish_don_rc_status;
	}
	public Timestamp getWish_don_rc_date() {
		return wish_don_rc_date;
	}
	public void setWish_don_rc_date(Timestamp wish_don_rc_date) {
		this.wish_don_rc_date = wish_don_rc_date;
	}
	public String getWish_don_coin_st() {
		return wish_don_coin_st;
	}
	public void setWish_don_coin_st(String wish_don_coin_st) {
		this.wish_don_coin_st = wish_don_coin_st;
	}


    

}

package com.wish.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class WishVO implements Serializable {
	
	private	String	wish_id;
	private	String	wish_name;
	private	String	wish_des;
	private	Integer	wish_qty;
	private	Integer	wish_stock;
	private	Timestamp	wish_date;
	private	String	wish_status;
	private	Integer	wish_coin;
	
	
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getWish_name() {
		return wish_name;
	}
	public void setWish_name(String wish_name) {
		this.wish_name = wish_name;
	}
	public String getWish_des() {
		return wish_des;
	}
	public void setWish_des(String wish_des) {
		this.wish_des = wish_des;
	}
	public Integer getWish_qty() {
		return wish_qty;
	}
	public void setWish_qty(Integer wish_qty) {
		this.wish_qty = wish_qty;
	}
	public Integer getWish_stock() {
		return wish_stock;
	}
	public void setWish_stock(Integer wish_stock) {
		this.wish_stock = wish_stock;
	}
	public Timestamp getWish_date() {
		return wish_date;
	}
	public void setWish_date(Timestamp wish_date) {
		this.wish_date = wish_date;
	}
	public String getWish_status() {
		return wish_status;
	}
	public void setWish_status(String wish_status) {
		this.wish_status = wish_status;
	}
	public Integer getWish_coin() {
		return wish_coin;
	}
	public void setWish_coin(Integer wish_coin) {
		this.wish_coin = wish_coin;
	}

}

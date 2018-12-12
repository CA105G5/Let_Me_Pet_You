package com.prod.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProdVO implements Serializable {
	
	private	String		prod_id;
	private	String		memb_id;
	private	String		prod_type_id;
	private	String		prod_ani_type_id;
	private	String		prod_name;
	private	String		prod_des;
	private	String		prod_info;
	private	Integer		prod_qty;
	private	Integer		prod_stock;
	private	Timestamp	prod_date;
	private	String		prod_review;
	private	String		prod_review_des;
	private	String		prod_status;
	private	Integer		prod_price;
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public String getProd_type_id() {
		return prod_type_id;
	}
	public void setProd_type_id(String prod_type_id) {
		this.prod_type_id = prod_type_id;
	}
	public String getProd_ani_type_id() {
		return prod_ani_type_id;
	}
	public void setProd_ani_type_id(String prod_ani_type_id) {
		this.prod_ani_type_id = prod_ani_type_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_des() {
		return prod_des;
	}
	public void setProd_des(String prod_des) {
		this.prod_des = prod_des;
	}
	public String getProd_info() {
		return prod_info;
	}
	public void setProd_info(String prod_info) {
		this.prod_info = prod_info;
	}
	public Integer getProd_qty() {
		return prod_qty;
	}
	public void setProd_qty(Integer prod_qty) {
		this.prod_qty = prod_qty;
	}
	public Integer getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(Integer prod_stock) {
		this.prod_stock = prod_stock;
	}
	public Timestamp getProd_date() {
		return prod_date;
	}
	public void setProd_date(Timestamp prod_date) {
		this.prod_date = prod_date;
	}
	public String getProd_review() {
		return prod_review;
	}
	public void setProd_review(String prod_review) {
		this.prod_review = prod_review;
	}
	public String getProd_review_des() {
		return prod_review_des;
	}
	public void setProd_review_des(String prod_review_des) {
		this.prod_review_des = prod_review_des;
	}
	public String getProd_status() {
		return prod_status;
	}
	public void setProd_status(String prod_status) {
		this.prod_status = prod_status;
	}
	public Integer getProd_price() {
		return prod_price;
	}
	public void setProd_price(Integer prod_price) {
		this.prod_price = prod_price;
	}
	
	


    

}

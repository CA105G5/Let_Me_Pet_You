package com.manager.model;

public class ManagerVO implements java.io.Serializable {

	private static final long serialVersionUID = 4454761783703124559L;

	private String ma_id;
	private String ma_name;
	private String ma_acc;
	private String ma_psw;
	private String ma_status;
	
	public String getMa_id() {
		return ma_id;
	}
	public void setMa_id(String ma_id) {
		this.ma_id = ma_id;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public String getMa_acc() {
		return ma_acc;
	}
	public void setMa_acc(String ma_acc) {
		this.ma_acc = ma_acc;
	}
	public String getMa_psw() {
		return ma_psw;
	}
	public void setMa_psw(String ma_psw) {
		this.ma_psw = ma_psw;
	}
	public String getMa_status() {
		return ma_status;
	}
	public void setMa_status(String ma_status) {
		this.ma_status = ma_status;
	}
	
	
}

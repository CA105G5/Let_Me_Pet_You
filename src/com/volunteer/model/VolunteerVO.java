package com.volunteer.model;

public class VolunteerVO implements java.io.Serializable{

	private String vlt_id;
	private String vlt_name;
	private String vlt_mail;
	private String vlt_pw;
	private String vlt_gender;
	private String vlt_tel;
	private byte[] vlt_img;
	private java.sql.Date vlt_registerdate;
	private String vlt_duty_day;
	private String vlt_sta;
	private String vlt_reg;
	public String getVlt_id() {
		return vlt_id;
	}
	public void setVlt_id(String vlt_id) {
		this.vlt_id = vlt_id;
	}
	public String getVlt_name() {
		return vlt_name;
	}
	public void setVlt_name(String vlt_name) {
		this.vlt_name = vlt_name;
	}
	public String getVlt_mail() {
		return vlt_mail;
	}
	public void setVlt_mail(String vlt_mail) {
		this.vlt_mail = vlt_mail;
	}
	public String getVlt_pw() {
		return vlt_pw;
	}
	public void setVlt_pw(String vlt_pw) {
		this.vlt_pw = vlt_pw;
	}
	public String getVlt_gender() {
		return vlt_gender;
	}
	public void setVlt_gender(String vlt_gender) {
		this.vlt_gender = vlt_gender;
	}
	public String getVlt_tel() {
		return vlt_tel;
	}
	public void setVlt_tel(String vlt_tel) {
		this.vlt_tel = vlt_tel;
	}
	public byte[] getVlt_img() {
		return vlt_img;
	}
	public void setVlt_img(byte[] vlt_img) {
		this.vlt_img = vlt_img;
	}
	public java.sql.Date getVlt_registerdate() {
		return vlt_registerdate;
	}
	public void setVlt_registerdate(java.sql.Date vlt_registerdate) {
		this.vlt_registerdate = vlt_registerdate;
	}
	public String getVlt_duty_day() {
		return vlt_duty_day;
	}
	public void setVlt_duty_day(String vlt_duty_day) {
		this.vlt_duty_day = vlt_duty_day;
	}
	public String getVlt_sta() {
		return vlt_sta;
	}
	public void setVlt_sta(String vlt_sta) {
		this.vlt_sta = vlt_sta;
	}
	public String getVlt_reg() {
		return vlt_reg;
	}
	public void setVlt_reg(String vlt_reg) {
		this.vlt_reg = vlt_reg;
	}
	
	
}
package com.Adoption.model;

public class AdoptionVO implements java.io.Serializable{
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public AdoptionVO() {
	
	}
	
	private String adopt_id;
	private String adopt_species;
	private String adopt_sponsor;
	private String adopt_status;
	private String adopt_apply_status;
	private java.sql.Timestamp adopt_btime;
	private java.sql.Timestamp adopt_etime;
	private String adopt_des;
	private byte[] adopt_img;
	
	
	public String getAdopt_id() {
		return adopt_id;
	}
	public void setAdopt_id(String adopt_id) {
		this.adopt_id = adopt_id;
	}
	public String getAdopt_species() {
		return adopt_species;
	}
	public void setAdopt_species(String adopt_species) {
		this.adopt_species = adopt_species;
	}
	public String getAdopt_sponsor() {
		return adopt_sponsor;
	}
	public void setAdopt_sponsor(String adopt_sponsor) {
		this.adopt_sponsor = adopt_sponsor;
	}
	public String getAdopt_status() {
		return adopt_status;
	}
	public void setAdopt_status(String adopt_status) {
		this.adopt_status = adopt_status;
	}
	public String getAdopt_apply_status() {
		return adopt_apply_status;
	}
	public void setAdopt_apply_status(String adopt_apply_status) {
		this.adopt_apply_status = adopt_apply_status;
	}
	public java.sql.Timestamp getAdopt_btime() {
		return adopt_btime;
	}
	public void setAdopt_btime(java.sql.Timestamp adopt_btime) {
		this.adopt_btime = adopt_btime;
	}
	public java.sql.Timestamp getAdopt_etime() {
		return adopt_etime;
	}
	public void setAdopt_etime(java.sql.Timestamp adopt_etime) {
		this.adopt_etime = adopt_etime;
	}
	public String getAdopt_des() {
		return adopt_des;
	}
	public void setAdopt_des(String adopt_des) {
		this.adopt_des = adopt_des;
	}
	public byte[] getAdopt_img() {
		return adopt_img;
	}
	public void setAdopt_img(byte[] adopt_img) {
		this.adopt_img = adopt_img;
	}

	
	
	
}
package com.AdoptApply.model;

public class AdoptApplyVO implements java.io.Serializable{
	
	private static final long serialVersionUID = 22222222222L;
	
	private String memb_id;
	private String adopt_id;
	private String adopt_des;
	private String adopt_id_status;

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public String getAdopt_id() {
		return adopt_id;
	}

	public void setAdopt_id(String adopt_id) {
		this.adopt_id = adopt_id;
	}

	public String getAdopt_des() {
		return adopt_des;
	}

	public void setAdopt_des(String adopt_des) {
		this.adopt_des = adopt_des;
	}

	public String getAdopt_id_status() {
		return adopt_id_status;
	}

	public void setAdopt_id_status(String adopt_id_status) {
		this.adopt_id_status = adopt_id_status;
	}

	public AdoptApplyVO() {
		// TODO Auto-generated constructor stub
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

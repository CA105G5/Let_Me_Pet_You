package com.AdoptTrack.model;

public class AdoptTrackVO implements java.io.Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	private String adopt_id;
	private String memb_id;
	
	public AdoptTrackVO() {
		// TODO Auto-generated constructor stub
	}

	public String getAdopt_id() {
		return adopt_id;
	}

	public void setAdopt_id(String adopt_id) {
		this.adopt_id = adopt_id;
	}

	public String getMemb_id() {
		return memb_id;
	}

	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	

}

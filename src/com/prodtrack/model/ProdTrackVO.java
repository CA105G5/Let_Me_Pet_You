package com.prodtrack.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProdTrackVO implements Serializable {
	
	private	String		prod_id;
	private	String		memb_id;

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

    

}

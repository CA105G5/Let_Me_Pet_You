package com.prodimg.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProdImgVO implements Serializable {
	
	private	String	prod_img_id;
	private	String	prod_id;
	private	byte[]	prod_img;
	
	
	public String getProd_img_id() {
		return prod_img_id;
	}
	public void setProd_img_id(String prod_img_id) {
		this.prod_img_id = prod_img_id;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public byte[] getProd_img() {
		return prod_img;
	}
	public void setProd_img(byte[] prod_img) {
		this.prod_img = prod_img;
	}


}

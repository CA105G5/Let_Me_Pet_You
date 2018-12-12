package com.wishimg.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class WishImgVO implements Serializable {
	
	private	String	wish_img_id;
	private	String	wish_id;
	private	byte[]	wish_img;
	public String getWish_img_id() {
		return wish_img_id;
	}
	public void setWish_img_id(String wish_img_id) {
		this.wish_img_id = wish_img_id;
	}
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public byte[] getWish_img() {
		return wish_img;
	}
	public void setWish_img(byte[] wish_img) {
		this.wish_img = wish_img;
	}
	
	

}

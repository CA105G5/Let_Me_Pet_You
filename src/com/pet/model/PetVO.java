package com.pet.model;

import java.sql.Date;

public class PetVO implements java.io.Serializable {
	
	private static final long serialVersionUID = 5078650562442772388L;
	
	private String pet_id;
	private String pet_name;
	private String memb_id;
	private String pet_gender;
	private Date pet_birth;
	private String pet_descr;
	private String pet_status;
	private Date pet_death;
	private byte[] pet_photo;
	private String pet_microchip;
	private String pet_type;
	
	public String getPet_id() {
		return pet_id;
	}
	public void setPet_id(String pet_id) {
		this.pet_id = pet_id;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public Date getPet_birth() {
		return pet_birth;
	}
	public void setPet_birth(Date pet_birth) {
		this.pet_birth = pet_birth;
	}
	public String getPet_descr() {
		return pet_descr;
	}
	public void setPet_descr(String pet_descr) {
		this.pet_descr = pet_descr;
	}
	public String getPet_status() {
		return pet_status;
	}
	public void setPet_status(String pet_status) {
		this.pet_status = pet_status;
	}
	public Date getPet_death() {
		return pet_death;
	}
	public void setPet_death(Date pet_death) {
		this.pet_death = pet_death;
	}
	public byte[] getPet_photo() {
		return pet_photo;
	}
	public void setPet_photo(byte[] pet_photo) {
		this.pet_photo = pet_photo;
	}
	public String getPet_microchip() {
		return pet_microchip;
	}
	public void setPet_microchip(String pet_microchip) {
		this.pet_microchip = pet_microchip;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	
}

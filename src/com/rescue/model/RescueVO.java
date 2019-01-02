package com.rescue.model;

import java.sql.Timestamp;
 
public class RescueVO implements java.io.Serializable{
	
	private String rsc_id;
	private String rsc_name;
	private String rsc_add;
	private String rsc_des;
	private byte[] rsc_img;
	private String rsc_sponsor;
	private String vlt_id;
	private Double rsc_lat;
	private Double rsc_lon;
	private String rsc_sta;
	private Timestamp rsc_stm_time;
	private String rsc_stm_url;
	private String rsc_stm_sta;
	private Timestamp rsc_btime;
	private Integer rsc_coin;
	private Timestamp rsc_etime;
	private String rsc_reg;
	private String rsc_rt_status;
	private String ntf_vlt_dt;
	private String ntf_vlt_link;
	private String ntf_vlt_sta;
	private Timestamp ntf_vlt_time;
	
	public RescueVO() {
		 
	}
	
	public RescueVO (String rsc_name, String rsc_add, String rsc_sta) {
		this.rsc_name = rsc_name;
        this.rsc_add = rsc_add;
        this.rsc_sta = rsc_sta;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null || !(obj instanceof RescueVO)) {
			return false;
		}
		return this.getRsc_id().equals(((RescueVO) obj).getRsc_id());
	}
	
	public String getRsc_id() {
		return rsc_id;
	}
	public void setRsc_id(String rsc_id) {
		this.rsc_id = rsc_id;
	}
	public String getRsc_name() {
		return rsc_name;
	}
	public void setRsc_name(String rsc_name) {
		this.rsc_name = rsc_name;
	}
	public String getRsc_add() {
		return rsc_add;
	}
	public void setRsc_add(String rsc_add) {
		this.rsc_add = rsc_add;
	}
	public String getRsc_des() {
		return rsc_des;
	}
	public void setRsc_des(String rsc_des) {
		this.rsc_des = rsc_des;
	}
	public byte[] getRsc_img() {
		return rsc_img;
	}
	public void setRsc_img(byte[] rsc_img) {
		this.rsc_img = rsc_img;
	}
	public String getRsc_sponsor() {
		return rsc_sponsor;
	}
	public void setRsc_sponsor(String rsc_sponsor) {
		this.rsc_sponsor = rsc_sponsor;
	}
	public String getVlt_id() {
		return vlt_id;
	}
	public void setVlt_id(String vlt_id) {
		this.vlt_id = vlt_id;
	}
	public Double getRsc_lat() {
		return rsc_lat;
	}
	public void setRsc_lat(Double rsc_lat) {
		this.rsc_lat = rsc_lat;
	}
	public Double getRsc_lon() {
		return rsc_lon;
	}
	public void setRsc_lon(Double rsc_lon) {
		this.rsc_lon = rsc_lon;
	}
	public String getRsc_sta() {
		return rsc_sta;
	}
	public void setRsc_sta(String rsc_sta) {
		this.rsc_sta = rsc_sta;
	}
	public Timestamp getRsc_stm_time() {
		return rsc_stm_time;
	}
	public void setRsc_stm_time(Timestamp rsc_stm_time) {
		this.rsc_stm_time = rsc_stm_time;
	}
	public String getRsc_stm_url() {
		return rsc_stm_url;
	}
	public void setRsc_stm_url(String rsc_stm_url) {
		this.rsc_stm_url = rsc_stm_url;
	}
	public String getRsc_stm_sta() {
		return rsc_stm_sta;
	}
	public void setRsc_stm_sta(String rsc_stm_sta) {
		this.rsc_stm_sta = rsc_stm_sta;
	}
	public Timestamp getRsc_btime() {
		return rsc_btime;
	}
	public void setRsc_btime(Timestamp rsc_btime) {
		this.rsc_btime = rsc_btime;
	}
	public Integer getRsc_coin() {
		return rsc_coin;
	}
	public void setRsc_coin(Integer rsc_coin) {
		this.rsc_coin = rsc_coin;
	}
	public Timestamp getRsc_etime() {
		return rsc_etime;
	}
	public void setRsc_etime(Timestamp rsc_etime) {
		this.rsc_etime = rsc_etime;
	}
	public String getRsc_reg() {
		return rsc_reg;
	}
	public void setRsc_reg(String rsc_reg) {
		this.rsc_reg = rsc_reg;
	}
	public String getRsc_rt_status() {
		return rsc_rt_status;
	}
	public void setRsc_rt_status(String rsc_rt_status) {
		this.rsc_rt_status = rsc_rt_status;
	}
	public String getNtf_vlt_dt() {
		return ntf_vlt_dt;
	}
	public void setNtf_vlt_dt(String ntf_vlt_dt) {
		this.ntf_vlt_dt = ntf_vlt_dt;
	}
	public String getNtf_vlt_link() {
		return ntf_vlt_link;
	}
	public void setNtf_vlt_link(String ntf_vlt_link) {
		this.ntf_vlt_link = ntf_vlt_link;
	}
	public String getNtf_vlt_sta() {
		return ntf_vlt_sta;
	}
	public void setNtf_vlt_sta(String ntf_vlt_sta) {
		this.ntf_vlt_sta = ntf_vlt_sta;
	}
	public Timestamp getNtf_vlt_time() {
		return ntf_vlt_time;
	}
	public void setNtf_vlt_time(Timestamp ntf_vlt_time) {
		this.ntf_vlt_time = ntf_vlt_time;
	}
	
	
	
	
}

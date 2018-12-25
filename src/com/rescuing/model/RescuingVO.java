package com.rescuing.model;

import java.sql.Timestamp;
  
public class RescuingVO implements java.io.Serializable{
	
	private String rsc_id;
	private String rscing_ptcp;
	private Timestamp rscing_btime;
	private String rscing_sta;
	private String rscing_cdes;
	private Timestamp rscing_ctime;
	private Timestamp rscing_etime;
	private Double rscing_lat;
	private Double rscing_lon;
	private String rscing_rv_des;
	
	public String getRsc_id() {
		return rsc_id;
	}
	public void setRsc_id(String rsc_id) {
		this.rsc_id = rsc_id;
	}
	public String getRscing_ptcp() {
		return rscing_ptcp;
	}
	public void setRscing_ptcp(String rscing_ptcp) {
		this.rscing_ptcp = rscing_ptcp;
	}
	public Timestamp getRscing_btime() {
		return rscing_btime;
	}
	public void setRscing_btime(Timestamp rscing_btime) {
		this.rscing_btime = rscing_btime;
	}
	public String getRscing_sta() {
		return rscing_sta;
	}
	public void setRscing_sta(String rscing_sta) {
		this.rscing_sta = rscing_sta;
	}
	public String getRscing_cdes() {
		return rscing_cdes;
	}
	public void setRscing_cdes(String rscing_cdes) {
		this.rscing_cdes = rscing_cdes;
	}
	public Timestamp getRscing_ctime() {
		return rscing_ctime;
	}
	public void setRscing_ctime(Timestamp rscing_ctime) {
		this.rscing_ctime = rscing_ctime;
	}
	public Timestamp getRscing_etime() {
		return rscing_etime;
	}
	public void setRscing_etime(Timestamp rscing_etime) {
		this.rscing_etime = rscing_etime;
	}
	public Double getRscing_lat() {
		return rscing_lat;
	}
	public void setRscing_lat(Double rscing_lat) {
		this.rscing_lat = rscing_lat;
	}
	public Double getRscing_lon() {
		return rscing_lon;
	}
	public void setRscing_lon(Double rscing_lon) {
		this.rscing_lon = rscing_lon;
	}
	public String getRscing_rv_des() {
		return rscing_rv_des;
	}
	public void setRscing_rv_des(String rscing_rv_des) {
		this.rscing_rv_des = rscing_rv_des;
	}
	
	
	
}

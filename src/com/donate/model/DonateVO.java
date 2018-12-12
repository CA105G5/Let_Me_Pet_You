package com.donate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class DonateVO implements Serializable {
	
	private	String		donate_id;
	private	String		memb_id;
	private	String		bank_id;
	private	Integer		donate_amount;
	private	Timestamp	donate_date;
	private	String		donate_coin_st;
	private	String		donate_private;
	private	String		donate_src;
	private	String		donate_src_cre;
	private	String		donate_src_trn;
	private	String		donate_status;
	
	public String getDonate_id() {
		return donate_id;
	}
	public void setDonate_id(String donate_id) {
		this.donate_id = donate_id;
	}
	public String getMemb_id() {
		return memb_id;
	}
	public void setMemb_id(String memb_id) {
		this.memb_id = memb_id;
	}
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	public Integer getDonate_amount() {
		return donate_amount;
	}
	public void setDonate_amount(Integer donate_amount) {
		this.donate_amount = donate_amount;
	}
	public Timestamp getDonate_date() {
		return donate_date;
	}
	public void setDonate_date(Timestamp donate_date) {
		this.donate_date = donate_date;
	}
	public String getDonate_coin_st() {
		return donate_coin_st;
	}
	public void setDonate_coin_st(String donate_coin_st) {
		this.donate_coin_st = donate_coin_st;
	}
	public String getDonate_private() {
		return donate_private;
	}
	public void setDonate_private(String donate_private) {
		this.donate_private = donate_private;
	}
	public String getDonate_src() {
		return donate_src;
	}
	public void setDonate_src(String donate_src) {
		this.donate_src = donate_src;
	}
	public String getDonate_src_cre() {
		return donate_src_cre;
	}
	public void setDonate_src_cre(String donate_src_cre) {
		this.donate_src_cre = donate_src_cre;
	}
	public String getDonate_src_trn() {
		return donate_src_trn;
	}
	public void setDonate_src_trn(String donate_src_trn) {
		this.donate_src_trn = donate_src_trn;
	}
	public String getDonate_status() {
		return donate_status;
	}
	public void setDonate_status(String donate_status) {
		this.donate_status = donate_status;
	}

	

}

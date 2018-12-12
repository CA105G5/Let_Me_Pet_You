package com.bank.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class BankVO implements Serializable {
	
	private	String	bank_id;
	private	String	bank_name;
	
	
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


    

}

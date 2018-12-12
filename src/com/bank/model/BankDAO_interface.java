package com.bank.model;

import java.util.List;

public interface BankDAO_interface {
	public void insert(BankVO bankVO);
	public void update(BankVO bankVO); //修改(其實不需要這個，因為兩個都是主鍵)
	public void delete(String bank_id); 
	public BankVO findByPrimaryKey(String bank_id);
	public List<BankVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProdTrackVO> getAll(Map<String, String[]> map); 
}

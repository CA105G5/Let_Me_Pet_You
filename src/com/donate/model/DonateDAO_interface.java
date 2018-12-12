package com.donate.model;

import java.util.List;

public interface DonateDAO_interface {
	public void insert(DonateVO donateVO);
	public void update(DonateVO donateVO);
	public void delete(String donate_id);
	public DonateVO findByPrimaryKey(String donate_id);
	public List<DonateVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<DonateVO> getAll(Map<String, String[]> map); 
}

package com.donate.model;

import java.util.List;

public interface DonateDAO_interface {
	public void insert(DonateVO donateVO);
	public void update(DonateVO donateVO);
	public void delete(String donate_id);
	public DonateVO findByPrimaryKey(String donate_id);
	public List<DonateVO> getAll();
	public Integer getAllByDate(String year, String month);
	public List<DonateVO> getAllByMem(String memb_id);
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<DonateVO> getAll(Map<String, String[]> map); 
}

package com.rescueCoin.model;

import java.util.List;



public interface RescueCoinDAO_interface {
	public void insert(RescueCoinVO rescueCoinVO);
	public void update(RescueCoinVO rescueCoinVO);
	public void delete(String rsc_id,String rsc_coin_mem);
	public RescueCoinVO findByPrimaryKey(String rsc_id);
	public List<RescueCoinVO> getAll();
	 //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RescueCoinVO> getAll(Map<String, String[]> map); 
}

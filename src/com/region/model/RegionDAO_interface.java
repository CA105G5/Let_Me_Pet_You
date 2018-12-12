package com.region.model;

import java.util.List;



public interface RegionDAO_interface {
	public void insert(RegionVO regionVO);
	public void update(RegionVO regionVO);
	public void delete(String reg_id);
	public RegionVO findByPrimaryKey(String reg_id);
	public List<RegionVO> getAll();
	 //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RegionVO> getAll(Map<String, String[]> map); 
}

package com.prodtrack.model;

import java.util.List;

public interface ProdTrackDAO_interface {
	public void insert(ProdTrackVO prodTrackVO);
//	public void update(ProdTrackVO prodTrackVO); //修改(其實不需要這個，因為兩個都是主鍵)
	public void delete(String prod_id, String memb_id); 
	public ProdTrackVO findByPrimaryKey(String memb_id);
	public List<ProdTrackVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProdTrackVO> getAll(Map<String, String[]> map); 
}

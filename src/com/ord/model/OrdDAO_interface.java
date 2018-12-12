package com.ord.model;

import java.util.List;

import com.ord.model.OrdVO;

public interface OrdDAO_interface {
	public void insert(OrdVO ordVO);
	public void update(OrdVO ordVO);
	public void delete(String ord_id);
	public OrdVO findByPrimaryKey(String ord_id);
	public List<OrdVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<OrdVO> getAll(Map<String, String[]> map); 
}

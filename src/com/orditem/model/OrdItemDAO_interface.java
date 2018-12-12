package com.orditem.model;

import java.util.List;

import com.orditem.model.OrdItemVO;

public interface OrdItemDAO_interface {
	public void insert(OrdItemVO ordItemVO);
	public void update(OrdItemVO ordItemVO);
	public void delete(String prod_id, String ord_id);
	public OrdItemVO findByPrimaryKey(String prod_id, String ord_id);
	public List<OrdItemVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<OrdItemVO> getAll(Map<String, String[]> map); 
}

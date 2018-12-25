package com.prod.model;

import java.util.List;
import java.util.Map;

import com.prod.model.ProdVO;

public interface ProdDAO_interface {
	public String insert(ProdVO prodVO);
	public void update(ProdVO prodVO);
	public void delete(String prod_id);
	public ProdVO findByPrimaryKey(String prod_id);
	public List<ProdVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
	public List<ProdVO> getAll(Map<String, String[]> map); 
}

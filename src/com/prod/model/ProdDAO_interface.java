package com.prod.model;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.ord.model.OrdVO;
import com.orditem.model.OrdItemVO;
import com.prod.model.ProdVO;

public interface ProdDAO_interface {
	public String insert(ProdVO prodVO);
	public void update(ProdVO prodVO);
	//同時新增訂單主檔與明細
	public void update(ProdVO prodVO, Connection con);
	public void delete(String prod_id);
	public ProdVO findByPrimaryKey(String prod_id);
	public List<ProdVO> getAll();
	public List<ProdVO> getAll_Front();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
	public List<ProdVO> getAll(Map<String, String[]> map); 
	public List<ProdVO> getProdByMem(String memb_id);
}

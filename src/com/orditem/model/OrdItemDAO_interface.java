package com.orditem.model;

import java.util.List;

import com.CurrencyDetail.model.CurDtVO;
import com.mem.model.MemVO;
import com.ord.model.OrdVO;
import com.orditem.model.OrdItemVO;
import com.prod.model.ProdVO;

public interface OrdItemDAO_interface {
	public void insert(OrdItemVO ordItemVO);
	public void update(OrdItemVO ordItemVO);
	public void update(OrdItemVO ordItemVO, MemVO memVO, CurDtVO curDTVO);
	public void delete(String prod_id, String ord_id);
	public OrdItemVO findByPrimaryKey(String prod_id, String ord_id);
	public List<OrdItemVO> getAll();
	
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<OrdItemVO> getAll(Map<String, String[]> map); 
	
	 public void insert2 (OrdItemVO ordItemVO , java.sql.Connection con);
	 public List<OrdItemVO> getOrdItemByOrd(List<OrdVO> ordList);
	 public List<OrdItemVO> getOrdItemByProd(List<ProdVO> prodList);
}

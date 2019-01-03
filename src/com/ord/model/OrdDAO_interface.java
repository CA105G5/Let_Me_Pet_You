package com.ord.model;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ord.model.OrdVO;
import com.orditem.model.OrdItemVO;

public interface OrdDAO_interface {  
	public void insert(OrdVO ordVO);
	public void update(OrdVO ordVO);
	public void delete(String ord_id);
	public OrdVO findByPrimaryKey(String ord_id);
	public List<OrdVO> getAll();
	
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
	public List<OrdVO> getAll(Map<String, String[]> map); 
	 //查詢某訂單的明細(一對多)(回傳 Set)
    public Set<OrdVO> getOrdItemByOrd(String ord_id);
    
    //同時新增訂單主檔與明細
    public void insertWithOrdItem(OrdVO ordVO, List<OrdItemVO> list);
    
    //以會員編號查詢所有訂單
    public List<OrdVO> getOrdByMem(String memb_id);
}

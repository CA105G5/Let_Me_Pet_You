package com.rescuing.model;

import java.util.*; 


public interface RescuingDAO_interface {
    public void insert(RescuingVO rescuingVO);
    public void update(RescuingVO rescuingVO);
    public void delete(String rsc_id,String rscing_ptcp);
    public RescuingVO findByPrimaryKey(String rsc_id);
    public List<RescuingVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
  public List<RescuingVO> getAll(Map<String, String[]> map);
  
  	//安卓功能
  
}

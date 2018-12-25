package com.rescue.model;

import java.util.*;

 
public interface RescueDAO_interface {
    public void insert(RescueVO rescueVO);
    public void update(RescueVO rescueVO);
    public void delete(String rsc_id);
    public RescueVO findByPrimaryKey(String rsc_id);
    public List<RescueVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
  public List<RescueVO> getAll(Map<String, String[]> map); 
}

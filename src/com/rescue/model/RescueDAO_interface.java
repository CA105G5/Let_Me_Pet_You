package com.rescue.model;

import java.util.*;
 

 
public interface RescueDAO_interface {
    public void insert(RescueVO rescueVO);
    public void update(RescueVO rescueVO);
    public void updateRscSta(String rsc_id, java.sql.Connection con);
    public void updateByManager(RescueVO rescueVO);
    public void delete(String rsc_id);
    public RescueVO findByPrimaryKey(String rsc_id);
    public List<RescueVO> getAll();
    public List<RescueVO> getAllDelay();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<RescueVO> getAll(Map<String, String[]> map); 
  
    //安卓功能
    byte[] getImage(String rsc_id);
    boolean updateCase(RescueVO rescueVO);
    boolean addCase(RescueVO rescueVO);
}

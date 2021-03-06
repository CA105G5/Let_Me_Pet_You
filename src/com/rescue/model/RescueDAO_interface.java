package com.rescue.model;

import java.sql.Connection;
import java.util.*;
 

  
public interface RescueDAO_interface {
    public void insert(RescueVO rescueVO);
    public void update(RescueVO rescueVO);
    public void updateRscSta(String rsc_id, java.sql.Connection con);
    public void updateByPass(String rsc_id,java.sql.Connection con);
    public void updateByNoPass(String rsc_id,java.sql.Connection con);
    public void updateByPassRt(String rsc_id,java.sql.Connection con);
    public void updateByNoPassRt(String rsc_id,java.sql.Connection con);
    public void updateByManager(RescueVO rescueVO);
    public void updateByDoneReport(String rsc_id, java.sql.Connection con);
    public void updateByDoneVolunteer(String rsc_id, java.sql.Connection con);
    public void updateByRt(String rsc_id,java.sql.Connection con);
    public void delete(String rsc_id);
    public RescueVO findByPrimaryKey(String rsc_id);
    public List<RescueVO> getAll(); 
    public List<RescueVO> getAllDelay();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<RescueVO> getAll(Map<String, String[]> map); 
  
    //安卓功能
    byte[] getImage(String rsc_id);
    boolean updateCase(String rsc_id, String rscing_ptcp);
    boolean addCase(RescueVO rescueVO);
    public List<RescueVO> getAllRescue();
	boolean updateCase(String rsc_id, String rscing_ptcp, Connection con);  
}

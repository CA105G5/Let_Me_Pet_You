package com.rescuing.model;

import java.sql.Connection;
import java.util.*;

import com.rescue.model.RescueVO; 


public interface RescuingDAO_interface {
    public void insert(RescuingVO rescuingVO);
    public void update(RescuingVO rescuingVO);
    public List updateByVolunteer(String rsc_id,java.sql.Connection con);
    public void updatePassMem(String rsc_id,String rsc_ptcp,java.sql.Connection con);
    public void updateNoPassMem(String rsc_id,String rsc_ptcp,java.sql.Connection con); 
    public void updateNoPass(String rsc_id,String rsc_ptcp,java.sql.Connection con); 
    public void updateDoneReport(RescuingVO rescuingVO,List<String> doneRescueMemslist);
    public void updateByManagerPass(RescueVO rescueVO);
    public void updateByManagerNoPass(String rsc_id,String rscing_rv_des);
    public void delete(String rsc_id,String rscing_ptcp);
    public RescuingVO findByPrimaryKey(String rsc_id);
    public RescuingVO findself(String rsc_id,String rscing_ptcp);
    public List<RescuingVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
  public List<RescuingVO> getAll(Map<String, String[]> map);
  
  	//安卓功能
  	public boolean joinRescuing(String rsc_id,String rscing_ptcp, Connection con);
  	
}

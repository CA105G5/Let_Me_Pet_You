package com.rscMsg.model;

import java.util.List;


public interface RscMsgDAO_interface {
    public void insert(RscMsgVO rscMsgVO);
    public void update(RscMsgVO rscMsgVO);
    public void delete(String rsc_msg_id);
    public RscMsgVO findByPrimaryKey(String rsc_msg_id);
    public List<RscMsgVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RscMsgVO> getAll(Map<String, String[]> map); 
}

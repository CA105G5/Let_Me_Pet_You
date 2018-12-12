package com.rscMsgRt.model;

import java.util.List;


public interface RscMsgRtDAO_interface {
    public void insert(RscMsgRtVO rscMsgRtVO);
    public void update(RscMsgRtVO rscMsgRtVO);
    public void delete(String rsc_msg_rt_id);
    public RscMsgRtVO findByPrimaryKey(String rsc_msg_rt_id);
    public List<RscMsgRtVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RscMsgRtVO> getAll(Map<String, String[]> map); 
}

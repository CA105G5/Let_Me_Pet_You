package com.rscRt.model;

import java.util.List;


public interface RscRtDAO_interface {
    public void insert(RscRtVO rscRtVO);
    public void update(RscRtVO rscRtVO);
    public void delete(String rsc_rt_id);
    public RscRtVO findByPrimaryKey(String rsc_rt_id);
    public List<RscRtVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RscRtVO> getAll(Map<String, String[]> map); 
}

package com.rscTrack.model;

import java.util.List;


public interface RscTrackDAO_interface {
    public void insert(RscTrackVO rscTrackVO);
    public void update(RscTrackVO rscTrackVO);
    public void delete(String rsc_id,String memb_id);
    public RscTrackVO findByPrimaryKey(String rsc_id);
    public List<RscTrackVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<RscTrackVO> getAll(Map<String, String[]> map); 
}

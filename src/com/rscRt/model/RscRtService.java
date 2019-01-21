package com.rscRt.model;

import java.util.List;
import java.util.Map;



public class RscRtService {
	public RscRtDAO_interface dao;
	
	public RscRtService() {
		dao = new RscRtJNDIDAO();
	}
	
	public void addRscRt(RscRtVO rscRtVO) {
		dao.insert(rscRtVO);
	}
	public void updateRscRt(RscRtVO rscRtVO) {
		
		dao.update(rscRtVO);
	}
	public void updateByPassRt(String rsc_rt_id,String rsc_id) {
		dao.updateByPassRt(rsc_rt_id,rsc_id);
	}
	 public void updateByNoPassRt(String rsc_rt_id,String rsc_rv_des,String rsc_id,String memb_id) {
		 dao.updateByNoPassRt(rsc_rt_id, rsc_rv_des, rsc_id,memb_id);
	 }
	public void deleteRscRt(String rsc_rt_id) {
		dao.delete(rsc_rt_id);
	}
	
	public RscRtVO getOneRscRt(String rsc_rt_id) {
		return dao.findByPrimaryKey(rsc_rt_id);
	}
	
	public List<RscRtVO> getAll() {
		return dao.getAll();
	}
	
	public List<RscRtVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}
}

package com.rscRt.model;

import java.util.List;
import java.util.Map;



public class RscRtService {
	public RscRtDAO_interface dao;
	
	public RscRtService() {
		dao = new RscRtJDBCDAO();
	}
	
	public void addRscRt(RscRtVO rscRtVO) {
		dao.insert(rscRtVO);
	}
	public void updateRscRt(RscRtVO rscRtVO) {
		
		dao.update(rscRtVO);
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

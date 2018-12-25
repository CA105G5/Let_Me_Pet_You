package com.rscTrack.model;

import java.util.List;
import java.util.Map;



public class RscTrackService {
	
	private RscTrackDAO_interface dao;
	
	public RscTrackService() {
		dao = new RscTrackJDBCDAO();
	}
	public void addRscTrack(RscTrackVO rscTrackVO) {
		
		dao.insert(rscTrackVO);
	}
	
	public void deleteRscTrack(String rsc_id,String memb_id) {
		dao.delete(rsc_id,memb_id);
	}
	
	
	public List<RscTrackVO> getAll(){
		return dao.getAll();
	}
	
	public List<RscTrackVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}

}

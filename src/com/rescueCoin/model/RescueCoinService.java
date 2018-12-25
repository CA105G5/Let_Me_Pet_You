package com.rescueCoin.model;

import java.util.List;
import java.util.Map;

import com.rescuing.model.RescuingVO;

public class RescueCoinService {
	
	private RescueCoinDAO_interface dao;
	
	public RescueCoinService() {
		dao = new RescueCoinJDBCDAO();
	}
	
	public void addRescueCoin(RescueCoinVO rescueCoinVO) {
		
		dao.insert(rescueCoinVO);
	}
	
	public void deleteRescueCoin(String rsc_id,String rscing_ptcp) {
		dao.delete(rsc_id,rscing_ptcp);
	}
	
	
	public List<RescueCoinVO> getAll(){
		return dao.getAll();
	}
	
	public List<RescueCoinVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}

}

package com.rescuing.model;

import java.util.List;
import java.util.Map;

import com.rescue.model.RescueVO;

 

public class RescuingService {
	
public RescuingDAO_interface dao;
	
	public RescuingService() {
		dao = new RescuingJDBCDAO();
	}
	
	public void addRescuing(RescuingVO rescuingVO) {
		dao.insert(rescuingVO);
	}
	public void updateRescuing(RescuingVO rescuingVO) {
		
		dao.update(rescuingVO);
	}
	public void deleteRescuing(String rsc_id,String rsc_coin_mem) {
		dao.delete(rsc_id,rsc_coin_mem);
	}
	public RescuingVO findself(String rsc_id,String rsc_coin_mem) {
		return dao.findself(rsc_id,rsc_coin_mem);
	}
	
	public RescuingVO getOneRescuing(String rsc_id) {
		return dao.findByPrimaryKey(rsc_id);
	}
	
	public List<RescuingVO> getAll() {
		return dao.getAll();
	}
	
	public List<RescuingVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}

}

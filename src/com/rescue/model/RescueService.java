package com.rescue.model;

import java.util.List;
import java.util.Map;
 
public class RescueService {
	
	public RescueDAO_interface dao;
	
	public RescueService() {
		dao = new RescueJDBCDAO();
	}
	
	public void addRescue(RescueVO rescueVO) {
		dao.insert(rescueVO);
	}
	public void updateRescue(RescueVO rescueVO) {
		
		dao.update(rescueVO);
	}
	public void updateRscSta(String rsc_id,java.sql.Connection con) {
		dao.updateRscSta(rsc_id, con);
	}
	public void updateByManager(RescueVO rescueVO) {
		dao.updateByManager(rescueVO);
	}
	public void deleteRescue(String rsc_id) {
		dao.delete(rsc_id);
	}
	
	public RescueVO getOneRescue(String rsc_id) {
		return dao.findByPrimaryKey(rsc_id);
	}
	
	public List<RescueVO> getAll() {
		return dao.getAll();
	}
	
	public List<RescueVO> getAllDelay() {
		return dao.getAllDelay();
	}
	
	public List<RescueVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}

}

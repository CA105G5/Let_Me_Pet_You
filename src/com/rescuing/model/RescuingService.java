package com.rescuing.model;

import java.util.List;
import java.util.Map;

import com.rescue.model.RescueVO;

 

public class RescuingService {
	
public RescuingDAO_interface dao;
	
	public RescuingService() {
		dao = new RescuingJNDIDAO();
	}
	
	public void addRescuing(RescuingVO rescuingVO) {
		dao.insert(rescuingVO);
	}
	public void updateRescuing(RescuingVO rescuingVO) {
		
		dao.update(rescuingVO);
	}
	public List updateByVolunteer(String rsc_id,java.sql.Connection con) {
		return dao.updateByVolunteer(rsc_id, con);
	}

    public void updateByManagerPass(RescueVO rescueVO){
    	dao.updateByManagerPass(rescueVO);
    }
    public void updateByManagerNoPass(String rsc_id,String rscing_rv_des) {
    	dao.updateByManagerNoPass(rsc_id,rscing_rv_des);
    }
    public void updateDoneReport(RescuingVO rescuingVO,List<String> doneRescueMemslist) {
    	dao.updateDoneReport(rescuingVO, doneRescueMemslist);
    }
	public void deleteRescuing(String rsc_id,String rsc_coin_mem) {
		dao.delete(rsc_id,rsc_coin_mem);
	}
	public RescuingVO findself(String rsc_id,String rscing_ptcp) {
		return dao.findself(rsc_id,rscing_ptcp);
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

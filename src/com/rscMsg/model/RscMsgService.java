package com.rscMsg.model;

import java.util.List;
import java.util.Map;


public class RscMsgService {

	private RscMsgDAO_interface dao;
	
	public RscMsgService() {
		dao = new RscMsgJDBCDAO();
	}
	
	public void addRscMsg(RscMsgVO rscMsgVO) {
		dao.insert(rscMsgVO);
	}
	public void updateRscMsg(RscMsgVO rscMsgVO) {
		
		dao.update(rscMsgVO);
	}
	public void deleteRscMsg(String rsc_msg_id) {
		dao.delete(rsc_msg_id);
	}
	
	public RscMsgVO getOneRscMsg(String rsc_msg_id) {
		return dao.findByPrimaryKey(rsc_msg_id);
	}
	
	public List<RscMsgVO> getAll() {
		return dao.getAll();
	}
	
	public List<RscMsgVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}
}

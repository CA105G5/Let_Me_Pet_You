package com.rscMsgRt.model;

import java.util.List;
import java.util.Map;



public class RscMsgRtService {
public RscMsgRtDAO_interface dao;
	
	public RscMsgRtService() {
		dao = new RscMsgRtJDBCDAO();
	}
	
	public void addRscMsgRt(RscMsgRtVO rscMsgRtVO) {
		dao.insert(rscMsgRtVO);
	}
	public void updateRscMsgRt(RscMsgRtVO rscMsgRtVO) {
		
		dao.update(rscMsgRtVO);
	}
	public void deleteRscMsgRt(String rsc_msg_rt_id) {
		dao.delete(rsc_msg_rt_id);
	}
	
	public RscMsgRtVO getOneRscMsgRt(String rsc_msg_rt_id) {
		return dao.findByPrimaryKey(rsc_msg_rt_id);
	}
	
	public List<RscMsgRtVO> getAll() {
		return dao.getAll();
	}
	
	public List<RscMsgRtVO> getAll(Map<String ,String[]> map){
		return dao.getAll(map);
	}
}

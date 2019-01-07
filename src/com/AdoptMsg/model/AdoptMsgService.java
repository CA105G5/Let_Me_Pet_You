package com.AdoptMsg.model;

import java.sql.Timestamp;
import java.util.List;

public class AdoptMsgService {
	private AdoptMsgDAO_Interface dao;
	
	public AdoptMsgService() {
		dao = new AdoptMsgJNDIDAO();
	}
	
	
	public AdoptMsgVO addAdopMsg(String adopt_id, String adopt_msg_sper,String adopt_msg_comm) {
		AdoptMsgVO adoptMsgVO = new AdoptMsgVO();
		adoptMsgVO.setAdopt_id(adopt_id);
		adoptMsgVO.setAdopt_msg_sper(adopt_msg_sper);
		adoptMsgVO.setAdopt_msg_comm(adopt_msg_comm);
		dao.insert(adoptMsgVO);
		
		return adoptMsgVO;
	}
	
	public AdoptMsgVO updateAdoptMsg(String adopt_id, String adopt_msg_sper, Timestamp adopt_msg_time,String adopt_msg_comm, String adopt_msg_id) {
		AdoptMsgVO adoptMsgVO = new AdoptMsgVO();
		adoptMsgVO.setAdopt_id(adopt_id);
		adoptMsgVO.setAdopt_msg_sper(adopt_msg_sper);
		adoptMsgVO.setAdopt_msg_comm(adopt_msg_comm);
		adoptMsgVO.setAdopt_msg_time(adopt_msg_time);
		adoptMsgVO.setAdopt_msg_id(adopt_msg_id);
		dao.update(adoptMsgVO);
		
		return adoptMsgVO;
	}
	
	public List<AdoptMsgVO> findByAdopt(String adopt_id){
		return dao.findByAdopt(adopt_id);
	}

	public List<AdoptMsgVO> getAll(){
		return dao.getAll();
	}
	public AdoptMsgVO getOneMsg(String adopt_msg_id) {
		return dao.findByPrimaryKey(adopt_msg_id);
	}
}

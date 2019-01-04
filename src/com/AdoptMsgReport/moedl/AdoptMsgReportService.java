package com.AdoptMsgReport.moedl;

import java.util.List;

public class AdoptMsgReportService {
	private AdoptMsgReportDAO_Interface dao;
	
	public AdoptMsgReportService() {
		dao = new AdoptMsgReportJNDIDAO();
	}
	
	public AdoptMsgReportVO addAdoptMsgReport(String adopt_msg_id, String memb_id, String adopt_msg_rt_comm) {
		AdoptMsgReportVO adoptMsgReportVO = new AdoptMsgReportVO();
		adoptMsgReportVO.setAdopt_msg_id(adopt_msg_id);
		adoptMsgReportVO.setMemb_id(memb_id);
		adoptMsgReportVO.setAdopt_msg_rt_comm(adopt_msg_rt_comm);
		dao.insert(adoptMsgReportVO);
		
		return adoptMsgReportVO;
	}
	
	public List<AdoptMsgReportVO> listAllReport(){
		return dao.getAll();
	}
	
	public AdoptMsgReportVO updataStatus(String adopt_msg_rt_status, String adopt_msg_id) {
		AdoptMsgReportVO adoptMsgReportVO = new AdoptMsgReportVO();
		adoptMsgReportVO.setAdopt_msg_rt_status(adopt_msg_rt_status);
		adoptMsgReportVO.setAdopt_msg_id(adopt_msg_id);
		dao.update(adoptMsgReportVO);
		
		return adoptMsgReportVO;
	}
	
	
	
	
}

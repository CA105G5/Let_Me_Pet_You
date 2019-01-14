package com.missingMsgReport.model;

import java.sql.Timestamp;
import java.util.List;

public class missingMsgReportService {
	private missingMsgReportDAO_interface dao;

	public missingMsgReportService() {
		dao = new missingMsgReportJNDIDAO();
	}

	public missingMsgReportVO addMissingMsgReport(String missing_msg_id, String memb_id, String missing_msg_rt_cont,
			String missing_msg_rt_sta, Timestamp missing_msg_rt_time) {
		
		missingMsgReportVO missingMsgReportVO = new missingMsgReportVO();
		missingMsgReportVO.setMissing_msg_id(missing_msg_id);
		missingMsgReportVO.setMemb_id(memb_id);
		missingMsgReportVO.setMissing_msg_rt_cont(missing_msg_rt_cont);
		missingMsgReportVO.setMissing_msg_rt_sta(missing_msg_rt_sta);
		missingMsgReportVO.setMissing_msg_rt_time(missing_msg_rt_time);
		dao.insert(missingMsgReportVO);
		
		return missingMsgReportVO;
	}

	//全部留言檢舉
	public List<missingMsgReportVO> listAllReport(){
		return dao.getAll();
	}
	
	//改檢舉狀態
	public missingMsgReportVO updateStatus(String missing_msg_rt_sta, String missing_msg_rt_id) {
		missingMsgReportVO missingMsgReportVO = new missingMsgReportVO();
		missingMsgReportVO.setMissing_msg_rt_sta(missing_msg_rt_sta);
		missingMsgReportVO.setMissing_msg_rt_id(missing_msg_rt_id);
		dao.updateStatus(missingMsgReportVO);
		
		return missingMsgReportVO;
	}
	
	public missingMsgReportVO getOneMissingRt(String missing_msg_rt_id) {
		return dao.findByPrimaryKey(missing_msg_rt_id);
	}
}

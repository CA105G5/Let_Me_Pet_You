package com.AdoptMsgReport.moedl;

import java.util.List;

public interface AdoptMsgReportDAO_Interface {
	
	public void insert(AdoptMsgReportVO adoptMsgReportVO);
	public void update(AdoptMsgReportVO adoptMsgReportVO);
	public void delete(String adopt_msg_rt_id);
	public List<AdoptMsgReportVO> findByPrimaryKey(String adopt_msg_rt_id);

}

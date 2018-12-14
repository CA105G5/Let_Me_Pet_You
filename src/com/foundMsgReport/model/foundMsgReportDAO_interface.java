package com.foundMsgReport.model;

import java.util.List;

public interface foundMsgReportDAO_interface {
	   public void insert(foundMsgReportVO foundMsgReportVO);
	    public void update(foundMsgReportVO foundMsgReportVO);
	    public void delete(String fd_msg_rt_id);
	    public foundMsgReportVO findByPrimaryKey(String fd_msg_rt_id);
	    public List<foundMsgReportVO> getAll();
}

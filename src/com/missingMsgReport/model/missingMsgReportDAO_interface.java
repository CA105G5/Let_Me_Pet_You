package com.missingMsgReport.model;

import java.util.List;


public interface missingMsgReportDAO_interface {
    public void insert(missingMsgReportVO missingMsgReportVO);
    public void update(missingMsgReportVO missingMsgReportVO);
    public void delete(String missing_msg_rt_id);
    public missingMsgReportVO findByPrimaryKey(String missing_msg_rt_id);
    public List<missingMsgReportVO> getAll();
}

package com.reportMissing.model;

import java.util.List;

public interface ReportMissingDAO_interface {
	   public void insert(ReportMissingVO reportMissingVO);
	    public void update(ReportMissingVO reportMissingVO);
	    public void delete(String report_missing_id);
	    public ReportMissingVO findByPrimaryKey(String report_missing_id);
	    public List<ReportMissingVO> getAll();

}

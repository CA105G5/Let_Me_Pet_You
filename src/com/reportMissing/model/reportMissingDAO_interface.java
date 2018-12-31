package com.reportMissing.model;

import java.util.List;

public interface reportMissingDAO_interface {
	   public void insert(reportMissingVO reportMissingVO);
	    public void update(reportMissingVO reportMissingVO);
	    public void delete(String report_missing_id);
	    public reportMissingVO findByPrimaryKey(String report_missing_id);
	    public List<reportMissingVO> getAll();
	    public void updateStatus(reportMissingVO reportMissingVO);
}

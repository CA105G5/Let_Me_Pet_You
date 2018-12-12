package com.missingTrace.model;

import java.util.List;

public interface missingTraceDAO_interface {
	public void insert(missingTraceVO missingTraceVO);
	public void insert(String missing_case_id, String memb_id);
	public void delete(String missing_case_id, String memb_id);
	public List<missingTraceVO> findByMember(String memb_id);
}

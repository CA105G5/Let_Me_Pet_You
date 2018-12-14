package com.foundTrace.model;

import java.util.List;

public interface foundTraceDAO_interface {
	public void insert(foundTraceVO foundTraceVO);
	public void insert(String fd_case_id, String memb_id);
	public void delete(String fd_case_id, String memb_id);
	public List<foundTraceVO> findByMember(String memb_id);
}